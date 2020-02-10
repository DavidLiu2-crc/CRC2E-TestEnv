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


int main(int argc, char* argv[]) {
    //Environment starting variables
    std::string nowDateTime = currentDataTime();

    // Set up file save path
    char buffer[256];
    //char pszInputCameraCal[256] = { 0 };
    char pszOutputFilePath[256] = { 0 };
    GetCurrentDirectory(256, buffer);
    //sprintf_s(pszInputCameraCal, "\\ladybug13451180.cal");

        // Initialize ladybug context
    LadybugContext context;
    LadybugError error;
    error = ::ladybugCreateContext(&context);
    _HANDLE_ERROR;

    // Find Ladybug device on local bus
    printf("Initializing Ladybug Camera control \n");
    error = ::ladybugInitializeFromIndex(context, 0);
    _HANDLE_ERROR("ladybugInitializeFromIndex");  // Check error and print error code

    // Get ladybug information
    LadybugCameraInfo caminfo;
    error = ladybugGetCameraInfo(context, &caminfo);
    _HANDLE_ERROR("ladybugGetCameraInfo()"); // Check error and print error code

    // Start ladybug connection
    printf("Connected to %s (%u)", caminfo.pszModelName, caminfo.serialHead);
    error = ::ladybugStart(context, LADYBUG_DATAFORMAT_RAW8);
    _HANDLE_ERROR;

    // Load the configuration of the intrinsic camera properties
    error = ::ladybugLoadConfig(context, NULL);
    _HANDLE_ERROR;
    //error = ::ladybugEnableSoftwareRendering(context, true);
    //_HANDLE_ERROR;
    error = ::ladybugConfigureOutputImages(context, LADYBUG_ALL_RECTIFIED_IMAGES);
    _HANDLE_ERROR;
    
    // ---------------------------------------------------------------------------------
    // Begin controlling the ladybug
    LadybugImageRenderingInfo camRenderInfo;
    error = ::ladybugGetImageRenderingInfo(context, &camRenderInfo);
    printf(" Rendering Info: %u ; %u ; %u", camRenderInfo.uiMaxTextureSize, camRenderInfo.uiMaxViewPortWidth, camRenderInfo.uiMaxViewPortHeight);


    // End controlling the ladybug
    // ---------------------------------------------------------------------------------

    // Destroy the context
    printf("Destroying Ladybug context ...\n");
    error = ::ladybugDestroyContext(&context);
    _HANDLE_ERROR;
    printf("Execution complete. Exit program.");
    return 0;
}