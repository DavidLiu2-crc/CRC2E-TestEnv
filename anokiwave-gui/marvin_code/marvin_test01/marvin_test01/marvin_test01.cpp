// marvin_test01.cpp : This file contains the 'main' function. Program execution begins and ends there.

/*
    Suppose LVDS connection to PAA is
    IO 0: CLK
    IO 1: SDI
    IO 2: SDO
    IO 3: LATCH
    IO 4: STROBE
*/
#include <iostream>
#include <string>

// User-defined Anokiwave command class
#include "AnokiCommand.h"
// User-defined Marvin command functions
#include "MarvinCommand.h"


int main() {

    // Define Marvin card object
    MarvinCommand marvin;
    // Define Anokiwave PAA object
    AnokiCommand anoki;

    unsigned int cmdSeq[15];
    DWORD cmdIndex = 0;
    unsigned int cmdLength = 0;

    //Initialize marvin card
    marvin.SetupCard(0x105, DIO_IO_INTERFACE_TTL, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT);
    

    // Generate some sample sequence
    anoki.cmd_SetScratchValue(0xfdecba98);
    anoki.get_commandSequence(cmdSeq);
    anoki.get_commandLength(&cmdLength);
    marvin.addCMDToMemory(cmdSeq, ANOKI_SDI, cmdLength);

    // Generate Enable Beam sequence
    anoki.paramBeamEnable = 1;
    anoki.cmd_EnableBeam();
    anoki.get_commandSequence(cmdSeq);
    anoki.get_commandLength(&cmdLength);
    marvin.addCMDToMemory(cmdSeq, ANOKI_SDI, cmdLength);

    // Point the beam in one direction
    anoki.paramModeBeam = 0;
    anoki.paramModeTXRX = 0;
    anoki.set_PointingAngleAE(45, 0);
    anoki.cmd_PAAPointingCommand();
    anoki.get_commandSequence(cmdSeq);
    anoki.get_commandLength(&cmdLength);
    marvin.addCMDToMemory(cmdSeq, ANOKI_SDI, cmdLength);


    //marvin.ShowMemory(marvin.dwMemory, 0, 64 );
    
    strcpy_s(marvin.szFileNameInput, "marvin_test01.DIO");
    strcpy_s(marvin.szFileNameOutput, "marvin_test01.DI");

    //marvin.GenerateExampleMemory();
    marvin.LoadCard(marvin.dwMemory, marvin.dwControl, 1000);
    marvin.RunProgram(1000);
    marvin.ReadFromCard();


    



}

