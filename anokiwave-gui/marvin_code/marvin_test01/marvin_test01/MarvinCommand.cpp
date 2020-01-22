#include "MarvinCommand.h"

// General C++ modules
#include <iostream>

// GeoTestDigitalInputOutput Module
// Make sure GTDio32.lib is also included in project
#include "GTDIO.h"

SHORT CheckStatus(SHORT nStatus) {
    CHAR errorString[512];
    if (!nStatus) return 0;
    DioGetErrorString(nStatus, errorString, sizeof errorString);
    std::cout << errorString << "\n";
    std::cout << "Aborting the program...\n";
    return 1;
}

// Single function caller to initiate IO card
void SetupCard(SHORT nSlotNum, PSHORT pnHandle, PSHORT pnBoardType, PSHORT pnStatus, SHORT nExpectBoard) {
    SHORT nDensity; // Points to Density of Memory Bank
    SHORT nBanks;   // Points to Number of Memory Bank

    // Start the connection, assigning the handle to nHandle
    SHORT nMaster = 0;  // Master board assigned 0
    SHORT nBoardNum = 1;// First valid assignment of board number
    DioSetupInitialization(nMaster, nBoardNum, nSlotNum, &nDensity, &nBanks, pnHandle, pnStatus);
    CheckStatus(*pnStatus);

    // Get the board type
    DioGetBoardType(*pnHandle, pnBoardType, pnStatus);
    // Check if status=0:success and if correct board type
    if (CheckStatus(*pnStatus) == 0) {
        if (*pnBoardType == nExpectBoard) {
            std::cout << "Correct board, initialized. Board Handle: " << *pnHandle << "\n";
        }
    }
    else { // If no success board type, quit the program
        std::cout << "Board Type: " << std::hex << *pnBoardType << "\n";
    }
    return;
}