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

// User-defined Anokiwave API class
#include "data\include\AnokiAPI.h"
//#include "data\include\AnokiCommand.h"
//#include "data\include\AnokiObj.h"

// User-defined Marvin API class
#include "data\include\MarvinAPI.h"

// User-defined VISA API class
#include "data\include\VisaAPI.h"

// --- Main execution functio
int main(int argc, char* argv[]) {
    
    // Ask user for operating frequency of the card
    std::cout << "MAIN: Enter a frequency for Marvin card to clock at (0.001 to 100 MHz): ";
    std::string userinput_freq;
    std::getline(std::cin, userinput_freq);

    // Define execution frequency
    //unsigned long _exeFrequency = 100000000;
    unsigned long _exeFrequency = std::stod(userinput_freq) * 1000000;

    //// Define User-defined class that handles GTDIO interface
    MarvinAPI marvin;
    marvin.set_OperatingFrequency(_exeFrequency);
    //// Define User-defined class that handles Anokwiave interface
    AnokiAPI anoki(_exeFrequency);
    anoki.set_CreateClockFlag(true);

    // Define User-defined class that handles VISA interface with PXA
    VisaAPI keysight;
    // Ask user if they want to connect to VISA at all.
    std::cout << "MAIN: Do you want to search and connect to NI VISA resources (y / n)?  ";
    std::string userinput_VISA;
    std::getline(std::cin, userinput_VISA);

    if (userinput_VISA == "y") {
        keysight.cmd_SearchForVisaResource();
        keysight.cmd_StartVisaConnection();
        keysight.set_VisaAttributes();

        char command[VI_FIND_BUFLEN] = "";
        char response[VI_FIND_BUFLEN] = "";
        strcpy_s(command, "*IDN?\n");
        keysight.cmd_sendString(command, response);


        keysight.cmd_EndVisaConnection();
    }

    // --- Find the local relative filepath of .csv with 2 column defining angles.
    char nInputCSVFile[100];
    if (argv[1] == NULL) {
        snprintf(nInputCSVFile, sizeof(nInputCSVFile) / sizeof(char), "anglePoint.csv");
    } else {
        strcpy_s(nInputCSVFile, argv[1]);
    }

    // --- Load the angles in the csv file to AnokiAPI
    anoki.cmd_readFromCSV(nInputCSVFile);
    // Set the frequency in case the input file does not have frequency column
    anoki.cmd_generateCommandSequenceFromFile(0, 28050);
    //anoki.showAnokiCommandSequence(8*9);

    // --- Generate a file describing memory content
    anoki.export_MemoryToASCII();
    //anoki.export_MemoryToReadable();
    //std::cout << "\n";

    // --- Initialize marvin card
    marvin.cmd_SetupInterface(0x103, DIO_IO_INTERFACE_LVDS, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT);
    marvin.cmd_StartConnection();

    // --- Set LVDS cable latch high
    //std::cout << "MAIN: Setting LVDS Latch channel high\n";

    //marvin.set_BufferValue(0x08, 5);

    //std::string userinputPAAPowered;
    //std::cout << "Please power on the Anokiwave PAA now, it should recognize LVDS interface.\nWaiting for user to press enter.\n";
    //std::getline(std::cin, userinputPAAPowered);

    // --- Load memory heap into DIO file
    strcpy_s(marvin.szDIOFileNameInput, "marvin_test01.DIO");
    strcpy_s(marvin.szDIFileNameOutput, "marvin_test01__.DI");

    DWORD numAnokiSteps = anoki.get_numberOfSteps();
    marvin.cmd_StartDIOLoad(numAnokiSteps);

    marvin.set_CardMemory(anoki.get_commandPointer(), anoki.get_controlPointer(), numAnokiSteps);
    marvin.cmd_LoadVectorToCard();

    marvin.cmd_RunProgram(10000);
    marvin.cmd_ReadFromCard();

    anoki.cmd_maskedReadMemory();
    anoki.export_ReadMemoryHEXSequence();

    return 0;
}

