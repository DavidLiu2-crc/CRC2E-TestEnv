// ladybugTestGrab.cpp : This file contains the a test context connection with the Ladybug v5
//

#include <cstdio>
#include <cstdlib>
#include <string>
#include <chrono>
#include <ctime>

#include "ladybug.h"
#include "ladybugrenderer.h"
#include "ladybuggeom.h"
#include "ladybugstream.h"

#include <windows.h>
#include <ShlObj.h>

using namespace std;

//#define ladybugPanoramicWidth 2048
#define ladybugPanoramicWidth 2048*4
#define ladybugPanoramicHeight 1024

#define ladybugColorProcessing LADYBUG_DOWNSAMPLE4 // Fastest color method for real-time usage
//#define ladybugColorProcessing LADYBUG_HQLINEAR   // High quality method for large stitched images

// Error handling definition
#define _HANDLE_ERROR \
    if ( error != LADYBUG_OK) { \
        printf( "Error: Ladybug library reported - %s\n", ::ladybugErrorToString(error) ); \
        return error; \
    } \

//Get current date and time
std::string currentDataTime() {
    char buf[80] = { 0 };
    // Get the time struct from local machine
    time_t timeraw = time(0);
    struct tm timeinfo;
    localtime_s(&timeinfo, &timeraw);

    // Convert to YYYY_MM_DD_HH_MM
    const struct tm timeString = timeinfo;
    strftime(buf, sizeof(buf), "%Y_%m_%d__%H_%M_%S", &timeString);

    return buf;
}

LadybugError startCamera(LadybugContext context) {
    LadybugError error;

    // Find Ladybug device on local bus
    printf("Initializing Ladybug Camera control \n");
    error = ::ladybugInitializeFromIndex(context, 0);
    _HANDLE_ERROR;

    // Get ladybug camera information
    LadybugCameraInfo caminfo;
    printf("Getting Camera information from device \n");
    error = ::ladybugGetCameraInfo(context, &caminfo);
    _HANDLE_ERROR;
    printf("Found Camera %s (%u) \n", caminfo.pszModelName, caminfo.serialHead);

    // Load the configuration of the intrinsic camera properties
    printf("Loading configuration of intrinsic camera values into device \n");
    error = ::ladybugLoadConfig(context, NULL);
    _HANDLE_ERROR;
    
    // Enable software rendering
    //error = ::ladybugEnableSoftwareRendering(context, true);
    //_HANDLE_ERROR;

    error = ladybugSetColorProcessingMethod(context, ladybugColorProcessing);
    _HANDLE_ERROR;

    error = ::ladybugSetAlphaMasking(context, true);
    _HANDLE_ERROR;


    printf("Setting up camera for Panoramic View \n");
    error = ::ladybugSetPanoramicViewingAngle(context, LADYBUG_FRONT_0_POLE_5);
    _HANDLE_ERROR;

    error = ::ladybugConfigureOutputImages(context, LADYBUG_PANORAMIC);
    _HANDLE_ERROR;

    printf("Setting up image resolution for Panoramic image \n");
    error = ::ladybugSetOffScreenImageSize(context, LADYBUG_PANORAMIC, ladybugPanoramicWidth, ladybugPanoramicHeight);
    _HANDLE_ERROR;
    

    // printf("Setting up camera for Rectified View \n");
    // error = ::ladybugConfigureOutputImages(context, LADYBUG_ALL_RECTIFIED_IMAGES);
    // _HANDLE_ERROR;


    
}


int main(int argc, char *argv[]) {
    //Environment starting variables
    std::string nowDateTime = currentDataTime();

    // Set up file save path
    char relativeDirectoryPath[256];
    //char pszInputCameraCal[256] = { 0 };
    char pszOutputFilePath[256] = { 0 };
    GetCurrentDirectory(256, relativeDirectoryPath);
    //sprintf_s(pszInputCameraCal, "\\ladybug13451180.cal");

    
    // --- Initialize ladybug context
    LadybugContext context;
    LadybugError error;
    error = ::ladybugCreateContext(&context);
    _HANDLE_ERROR;

    error = startCamera(context);

    // --- Start ladybug connection
    error = ::ladybugStart(context, LADYBUG_DATAFORMAT_COLOR_SEP_HALF_HEIGHT_JPEG12);
    
    // ---------------------------------------------------------------------------------
    // Begin controlling the ladybug

    // Test the connection with a few captures
    error = LADYBUG_FAILED;
    LadybugImage image;
    unsigned int numTries = 10;
    while (error != LADYBUG_OK && numTries-- > 0) {
        printf(".");
        error = ::ladybugGrabImage(context, &image);
    } printf("\n");
    _HANDLE_ERROR;
    unsigned int uiRawCols = image.uiCols; unsigned int uiRawRows = image.uiRows;

    //Initialize alpha masks
    printf("Initializing Alpha Masks (May take a long time)\n");
    error = ::ladybugInitializeAlphaMasks(context, uiRawCols, uiRawRows);
    _HANDLE_ERROR;

    //// Trigger camera to take pictures from each camera
    //unsigned char* arpBuffers[LADYBUG_NUM_CAMERAS] = { 0 };
    //for (unsigned int uiCamera = 0; uiCamera < LADYBUG_NUM_CAMERAS; uiCamera++) {
    //    // Initialize each camera buffer with the resolution of RGB alpha pixel
    //    arpBuffers[uiCamera] = new unsigned char[image.uiRows * image.uiCols * 4];
    //    // Set every pixel value to valid maximum
    //    memset(arpBuffers[uiCamera], 0xFF, image.uiRows * image.uiCols * 4);
    //}

    // Actually grab the image now
    error = ::ladybugGrabImage(context, &image);
    _HANDLE_ERROR;

    // Process the image into a color format to 6 RGB Filters
    printf("Converting image buffer to color format\n");
    error = ::ladybugConvertImage(context, &image, NULL);
    _HANDLE_ERROR;

    printf("Updating OpenGL Textures\n");
    error = ::ladybugUpdateTextures(context, LADYBUG_NUM_CAMERAS, NULL);
    _HANDLE_ERROR;

    //LadybugPixelFormat renderPixelFormat = LADYBUG_BGRU;

    // Get Image rendering information
    //LadybugImageRenderingInfo camRenderInfo;
    //error = ::ladybugGetImageRenderingInfo(context, &camRenderInfo);
    //unsigned int uiWidth = 2448;
    //unsigned int uiHeight = 2048;
    //printf("Local machine Rendering Info: %u ; Max Width %u ; Max Height %u\n", camRenderInfo.uiMaxTextureSize, camRenderInfo.uiMaxViewPortWidth, camRenderInfo.uiMaxViewPortHeight);
    //printf("Rendering output image at resolution: %u x %u\n", uiWidth, uiHeight);

    printf("Stitching images from device buffer to Panoramic Image\n");
    LadybugProcessedImage processedImage;
    error = ::ladybugRenderOffScreenImage(context, LADYBUG_PANORAMIC, LADYBUG_BGR, &processedImage);
    _HANDLE_ERROR;



    printf("Saving image ...");
    //Generate string for current snapshot time
    sprintf_s(pszOutputFilePath, "\\Results\\ladybug_Panoramic.jpg");
    const std::string outputPath = relativeDirectoryPath + std::string(pszOutputFilePath);
    error = ::ladybugSaveImage(context, &processedImage, outputPath.c_str(), LADYBUG_FILEFORMAT_JPG);
    _HANDLE_ERROR;
    printf("Done\n");
    
    //for (unsigned int uiCamera = 0; uiCamera < LADYBUG_NUM_CAMERAS; uiCamera++) {
    //    // Set up each processed image with properties
    //    LadybugProcessedImage processedImage;
    //    processedImage.pData = arpBuffers[uiCamera];    // Pointer to pixel storage
    //    processedImage.pixelFormat = renderPixelFormat;      // Image color format
    //    processedImage.uiCols = image.uiCols;           // Image number of cols
    //    processedImage.uiRows = image.uiRows;           // Image number of rows

    //    // Define Output image face
    //    LadybugOutputImage outputCameraFace;
    //    switch (uiCamera) {
    //    case 0:
    //        outputCameraFace = LADYBUG_RECTIFIED_CAM0;
    //        break;
    //    case 1:
    //        outputCameraFace = LADYBUG_RECTIFIED_CAM1;
    //        break;
    //    case 2:
    //        outputCameraFace = LADYBUG_RECTIFIED_CAM2;
    //        break;
    //    case 3:
    //        outputCameraFace = LADYBUG_RECTIFIED_CAM3;
    //        break;
    //    case 4:
    //        outputCameraFace = LADYBUG_RECTIFIED_CAM4;
    //        break;
    //    case 5:
    //        outputCameraFace = LADYBUG_RECTIFIED_CAM5;
    //        break;
    //    }

    //    //printf("\nRendering rectified images from buffer (Off-screen processing)\n");
    //    error = ::ladybugRenderOffScreenImage(context, outputCameraFace, LADYBUG_BGR, &processedImage);
    //    _HANDLE_ERROR;

    //    // Generate string for current snapshot time
    //    //sprintf_s(pszOutputFilePath, "\\ladybug_%u_camera_%02u.bmp", caminfo.serialHead, uiCamera);
    //    //sprintf_s(pszOutputFilePath, "\\ladybug_%s_Rectified_Cam%01u.bmp", nowDateTime.c_str(), uiCamera);
    //    sprintf_s(pszOutputFilePath, "\\Results\\ladybug_Rectified_Cam%01u.jpg", uiCamera);
    //    const std::string outputPath = buffer + std::string(pszOutputFilePath);
    //    //printf("\nSaving image at destination: %s\n", outputPath.c_str());

    //    // Trigger camera to save image with processed image properties at file location
    //    error = ::ladybugSaveImage(context, &processedImage, outputPath.c_str(), LADYBUG_FILEFORMAT_JPG);
    //    _HANDLE_ERROR;
    //    printf(".");
    //}printf("\n");

    // End controlling the ladybug
    // ---------------------------------------------------------------------------------

    printf("Stopping Ladybug communication\n");
    ::ladybugStop(context);
    _HANDLE_ERROR;

    // Destroy the context
    printf("Destroying Ladybug context\n");
    error = ::ladybugDestroyContext(&context);
    _HANDLE_ERROR;

    printf("Execution complete. Exit program.");
    return 0;
}