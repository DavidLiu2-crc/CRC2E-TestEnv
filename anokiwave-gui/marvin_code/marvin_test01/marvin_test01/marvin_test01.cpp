// marvin_test01.cpp : This file contains the 'main' function. Program execution begins and ends there.

/*
    Suppose LVDS connection to PAA is
    IO 0: CLK
    IO 1: SDI
    IO 2: SDO
    IO 3: LATCH
    IO 4: STROBE

    DWORD is the same thing as unsigned int
*/
#include <iostream>
#include <string>
#include <vector>

// User-defined Anokiwave command class
#include "AnokiCommand.h"
#include "AnokiMemory.h"
// User-defined Marvin command functions
#include "MarvinCommand.h"



int main(int argc, char* argv[]) {

    // Define Marvin card object
    MarvinCommand marvin;
    // Define Anokiwave PAA object
    AnokiCommand anoki;
    // Define Anokiwave Memory object
    AnokiMemory anokiMem;

    DWORD cmdIndex = 0;
    unsigned int cmdLength = 0;
    //unsigned int cmdSeq[15];
    std::vector<std::string> commandLog;

    
    double delayTime = 1e-6;
    marvin.nBoardFrequency = SHORT( 1e6 );

    //Initialize marvin card
    //marvin.SetupInterface(0x105, DIO_IO_INTERFACE_TTL, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT);
    //marvin.StartConnection();

    anokiMem.readFromCSV();

    // --- Create AnokiObj objects to store the command
    AnokiObj obj1, obj2;
    // Generate some sample sequence
    //obj1 = anoki.cmd_SetScratchValue(0xfdecba98);
    //obj2 = anoki.cmd_ReadScratchRequest();
    //obj2 = anoki.cmd_RequestFixedSequence();
    //obj2 = anoki.cmd_ArrayConfigurationRequest();
    //obj2 = anoki.cmd_StatusSummaryRequest();
    //obj2 = anoki.cmd_StatusDetailRequest();

    //anoki.paramFactoryReset = 1;
    //obj1 = anoki.cmd_FactoryReset();

    anoki.paramBeamEnable = 1;
    obj1 = anoki.cmd_EnableBeam();

    anoki.paramModeTXRX = 0;
    anoki.paramModeBeam = 1;
    anoki.set_PointingAngle(60, 42);
    anoki.set_PointingFreq(28050);
    obj1 = anoki.cmd_PAAPointingCommand();



    //anoki.get_commandSequence(cmdSeq, commandLog);
    //anoki.get_commandSequence(anokiMem);
    //anoki.get_commandLength(&cmdLength);
    //marvin.addCMDToMemory(cmdSeq, ANOKI_SDI, cmdLength);

    //anokiMem.pzAngleFile = "anglePoint.csv";
    

    //// Generate Enable Beam sequence
    //anoki.paramBeamEnable = 1;
    //anoki.cmd_EnableBeam();
    //anoki.get_commandSequence(cmdSeq, commandLog);
    //anoki.get_commandLength(&cmdLength);
    //marvin.addCMDToMemory(cmdSeq, ANOKI_SDI, cmdLength);

    //// Point the beam in one direction
    //anoki.paramModeBeam = 0;
    //anoki.paramModeTXRX = 0;
    //anoki.set_PointingFreq(28050);
    //anoki.set_PointingAngleAE(45, 0);
    //anoki.cmd_PAAPointingCommand();
    //anoki.get_commandSequence(cmdSeq, commandLog);
    //anoki.get_commandLength(&cmdLength);
    //marvin.addCMDToMemoryWithSkip(cmdSeq, ANOKI_SDI, cmdLength, 1e-6);

    //anoki.paramModeBeam = 0;
    //anoki.paramModeTXRX = 0;
    //anoki.set_PointingAngleAE(60, 0);
    //anoki.cmd_PAAPointingCommand();
    //anoki.get_commandSequence(cmdSeq, commandLog);
    //anoki.get_commandLength(&cmdLength);
    //marvin.addCMDToMemoryWithSkip(cmdSeq, ANOKI_SDI, cmdLength, 1e-6);


    //marvin.ShowMemory(marvin.dwMemory, 0, 64 );
    std::cout << "\n";
    for (unsigned int cmdLog = 0; cmdLog < commandLog.size(); cmdLog++) {
        std::cout << commandLog[cmdLog].c_str() << "\n";
    }std::cout << "\n";
    
    
    strcpy_s(marvin.szFileNameInput, "marvin_test01.DIO");
    strcpy_s(marvin.szFileNameOutput, "marvin_test01.DI");

    //marvin.GenerateExampleMemory();
    //marvin.LoadCard();
    //marvin.LoadCardWith(marvin.dwMemory, marvin.dwControl);
    //marvin.RunProgram(1000);
    //marvin.ReadFromCard();


    



}

