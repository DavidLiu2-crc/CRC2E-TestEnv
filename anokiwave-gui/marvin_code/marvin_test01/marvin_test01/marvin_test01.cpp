// marvin_test01.cpp : This file contains the 'main' function. Program execution begins and ends there.

/*
    Suppose LVDS connection to PAA is
    IO 0: CLK
    IO 1: SDI
    IO 2: SDO
    IO 3: LATCH
    IO 4: STROBE
*/

// General C++ modules
#include <iostream>
#include <Windows.h>
#include <vector>

// GeoTestDigitalInputOutput Module
// Make sure GTDio32.lib is also included in project
#include "GTDIO.h"

// User-defined Anokiwave command class
#include "AnokiCommand.h"
// User-defined Marvin command functions
#include "MarvinCommmand.h"


int main() {
    SHORT nSlotNum = 0x105; // nSlotNum: Points to Slot number
    SHORT nMasterHandle;    // Points to Handle pointer
    SHORT nBoardType;       // Points to Board type
    SHORT nStatus;          // Points to Status returned by DIO instruction

    SetupCard(nSlotNum, &nMasterHandle, &nBoardType, &nStatus, DIO_BOARD_TYPE_GX5290);

    DioHalt(nMasterHandle, &nStatus);

    //// Setup IO Channel Direction
    //SHORT nWidth, nDirection;
    //DioGetIOConfiguration(nMasterHandle, &nWidth, &nDirection, &nStatus);
    //CheckStatus(nStatus);
    //std::cout << "Width of channels: " << nWidth << "\n";
    //std::cout << "Direction of IO: " << nDirection << "\n";

    //nWidth = 2;
    //DioSetupIOConfiguration(nMasterHandle, nWidth, nDirection, &nStatus);
    //CheckStatus(nStatus);
    //std::cout << "Width of channels: " << nWidth << "\n";
    //std::cout << "Direction of IO: " << nDirection << "\n";

    // Setup IO Channel Direction
    DWORD dwWriteStates = 0x1b;
    DioSetupChannelsOutputStates(nMasterHandle, dwWriteStates, &nStatus);
    CheckStatus(nStatus);
    DWORD dwReadStates;
    DioGetChannelsOutputStates(nMasterHandle, &dwReadStates, &nStatus);
    CheckStatus(nStatus);
    std::cout << "Channel Output States: " << dwReadStates << "\n";
    
    AnokiCommand anoki;
    anoki.cmd_SetScratchValue(0x45328933);
    anoki.commandToVector(6);
    

    std::cout << "\nEnd of Marvin Test program\n";
    return 1;
}