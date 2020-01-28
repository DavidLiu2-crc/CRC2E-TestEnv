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

    unsigned int cmdSeq[1024];
    unsigned int clkSeq[1024];
    DWORD cmdIndex = 0;

    //Initialize marvin card
    marvin.SetupCard(0x105, DIO_IO_INTERFACE_TTL, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT);
    // Generate some hexacommand sequence
    anoki.cmd_SetScratchValue(0xfdecba98);
    anoki.get_commandSequence(cmdSeq);

    //marvin.addCommandToMemory(unsigned int hexa, unsigned int _channel, unsigned int _cmdPosition);
    //marvin.addCMDSingleToMemory(0xFF, ANOKI_CLK, 0);
    
    unsigned int hexa = 0x67;
    marvin.addCMDSingleToMemory(hexa, ANOKI_CLK, 0);

    marvin.addCMDSequenceToMemory(cmdSeq, ANOKI_SDI, 8);

    //marvin.addCMDSingleToMemory(0xAA, ANOKI_CLK, 0);
    //marvin.addCMDSingleToMemory(0xAA, ANOKI_CLK, 8);
    //marvin.addCMDSingleToMemory(0xAA, ANOKI_CLK, 16);

    marvin.ShowMemory(marvin.dwMemory, 0, 32 );
    
    strcpy_s(marvin.szFileNameInput, "marvin_test01.DIO");
    strcpy_s(marvin.szFileNameOutput, "marvin_test01.DI");

    //marvin.GenerateExampleMemory();
    marvin.LoadCard(marvin.dwMemory, marvin.dwControl, 10000);
    marvin.RunProgram(1000);
    marvin.ReadFromCard();


    



}

