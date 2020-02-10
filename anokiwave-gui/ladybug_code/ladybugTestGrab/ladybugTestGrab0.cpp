// ladybugTestGrab.cpp : This file contains the a test context connection with the Ladybug v5
//

#include <iostream>
#include <cstdlib>
#include <string>

#include "ladybug.h"
#include "ladybugstream.h"

#include <windows.h>
#include <ShlObj.h>

using namespace std;


// Error handling definition
#define _HANDLE_ERROR \
    if ( error != LADYBUG_OK) { \
        cout << "Erro: Ladybug library reported - \n" << ::ladybugErrorToString( error ) << std::endl; \
    } \
    return EXIT_FAILURE; \


int main(int argc, char *argv[]) {
    // Initialize ladybug context
    LadybugContext context;
    LadybugError error = ::ladybugCreateContext(&context);
    _HANDLE_ERROR;

    // Find Ladybug device on local bus
    cout << "Initializing ... \n";
    error = ::ladybugInitializeFromIndex(context, 0);
    _HANDLE_ERROR;  // Check error and print error code

    // Get ladybug information
    LadybugCameraInfo caminfo;
    error = ladybugGetCameraInfo(context, &caminfo);
    _HANDLE_ERROR("ladybugGetCameraInfo()"); // Check error and print error code

    // Start ladybug connection
    cout << "Starting " << caminfo.pszModelName, << "(" << caminfo.serialHead << ")\n";
    error = ::ladybugStart(context, LADYBUG_DATAFORMAT_HALF_HEIGHT_RAW8);
    _HANDLE_ERROR;

    // ---------------------------------------------
    // Insert code to command Ladybug over USB3 here
    // ---------------------------------------------

    // Destroy the context
    cout << "Destroying Ladybug context ...\n";
    error = ::ladybugDestroyContext(&context);
    _HANDLE_ERROR;
    cout << "Execution complete. Exit program.";
    return 0;

}


namespace{
    // Get writable directory (DESKTOP of current user)
    std::string getUserDesktopPath() {
        std::string desktopPath;
        char buffer[_MAX_PATH];
        HRESULT findDesktopResult = SHGetFolderPath(NULL, CSIDL_DESKTOP, NULL, 0, buffer);
        //char LCWSTR caused by C++ Use Multi byte character setting
        desktopPath.append(buffer);
        if (findDesktopResult == S_OK) desktopPath.append("\\");
        return desktopPath;
    }
}



