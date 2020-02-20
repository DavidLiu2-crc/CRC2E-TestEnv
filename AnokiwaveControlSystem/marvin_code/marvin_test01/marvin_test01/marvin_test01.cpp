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

// User-defined Anokiwave memory class
#include "AnokiMemory.h"
#include "AnokiCommand.h"
//#include "AnokiObj.h"

// User-defined Marvin command functions
#include "MarvinCommand.h"



int main(int argc, char* argv[]) {
    // Define execution frequency
    unsigned int _exeFrequency = 1000000;

    // Define User-defined class that handles GTDIO interface
    MarvinCommand marvin;
    marvin.setOperatingFrequency(_exeFrequency);
    // Define User-defined class that handles Anokwiave interface
    AnokiMemory anoki(_exeFrequency, 32);
    anoki.set_CreateClockFlag(true);

    //Generate some sample sequence
    //AnokiCommand anokiCmd;
    //AnokiObj obj1, obj2;
    //obj1 = anokiCmd.cmd_SetScratchValue(0xfedcba98);
    //obj1 = anokiCmd.cmd_ReadScratchRequest();
    //obj1 = anokiCmd.cmd_RequestFixedSequence();

    //anokiCmd.set_modeTXRX(false);
    //anokiCmd.set_beamMode(1);
    //anokiCmd.set_PointingAngle(60, 42);
    //anokiCmd.set_PointingFreq(28050);
    //obj1 = anokiCmd.cmd_PAAPointingCommand();

    //anokiCmd.set_factoryFlag(true);
    //obj1 = anokiCmd.cmd_FactoryReset();

    //anokiCmd.set_enableBeam(true);
    //obj1 = anokiCmd.cmd_EnableBeam();

    //obj1 = anokiCmd.cmd_ArrayConfigurationRequest();
    //obj1 = anokiCmd.cmd_StatusSummaryRequest();
    //obj1 = anokiCmd.cmd_StatusDetailRequest();


    // --- Find the local relative filepath of .csv with 2 column defining angles.
    char nInputCSVFile[100];
    if (argv[1] == NULL) {
        snprintf(nInputCSVFile, sizeof(nInputCSVFile) / sizeof(char), "anglePoint.csv");
    }
    else {
        strcpy_s(nInputCSVFile, argv[1]);
    }

    // --- Load the angles in the csv file to anokimemory
    anoki.readFromCSV(nInputCSVFile);

    // --- Generate a sequence of objects defining the commands to send
    // Start the connection on the anokiwave with a beam mode and frequency
    anoki.cmd_StartBeam(0, 28050);
    // Read the angles to generate an anokiObj that contains the command information
    anoki.cmd_steerAngle();
    // End the connection to the anokiwave
    anoki.cmd_EndBeam();

    anoki.generateCommandSequenceFromFile();
    //anoki.showAnokiCommandSequence(8*9);

    // --- Generate a file describing memory content
    //anoki.exportMemoryToASCII();
    //anoki.exportMemoryToReadable();
    std::cout << "\n";

    // --- Initialize marvin card
    marvin.SetupInterface(0x103, DIO_IO_INTERFACE_TTL, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT);
    marvin.StartConnection();

    strcpy_s(marvin.szFileNameInput, "marvin_test01.DIO");
    strcpy_s(marvin.szFileNameOutput, "marvin_test01.DI");

    DWORD numberOfSteps = anoki.commandSequenceIndex;
    marvin.StartDIOLoad(numberOfSteps);
    marvin.LoadCard(anoki.commandSequence, anoki.controlSequence);
    marvin.LoadVectorToCard();
    marvin.RunProgram(1000);
    marvin.ReadFromCard();






}
