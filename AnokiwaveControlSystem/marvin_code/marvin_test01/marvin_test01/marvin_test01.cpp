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


// --- Main execution function
int main(int argc, char* argv[]) {
    // (Debugging)
    Sleep(3000);


    // --- Entry point for main file --------------------------------------------------------------
    
    unsigned long _exeFrequency = 1000000;  // execution operation frequency
    unsigned long _exeMilliseconds = 1000;  // execution sleep time
    bool _exeVISA = false;                  // execution look for visa
    // input CSV file name
    char nInputCSVFile[100] = { 0 };
    // Default file name expected
    snprintf(nInputCSVFile, sizeof(nInputCSVFile) / sizeof(char), "anglePoint.csv");

    // --- Check the optional parameters ----------------------------------------------------------
    unsigned char _numArguments = argc;
    for (unsigned char i = 1; i < argc; i++) {

        // Check if input option -f (frequency)
        if (strcmp(argv[i], "-f") == 0) {
            _exeFrequency = std::stof(argv[i + 1]);
            if (_exeFrequency > 100000000) _exeFrequency = 100000000;   // Upper bound the frequency
            i++;    // skip one iteration
        }

        // Check if input option -v (visa)
        if (strcmp(argv[i], "-v") == 0) {
            if (strcmp(argv[i + 1], "1") == 0) {
                _exeVISA = true;
            }
            i++;    // skip one iteration
        }

        // Check if input option -i (input file)
        if (strcmp(argv[i], "-i") == 0) {
            strcpy_s(nInputCSVFile, 100, argv[i + 1]);
            i++;    // skip one iteration
        }

        // Check if input option -e (execution time)
        if (strcmp(argv[i], "-e") == 0) {
            _exeMilliseconds = std::stof(argv[i + 1]);
            i++;    // skip one iteration
        }

        // Check if help option -h
        if (strcmp(argv[i], "-h") == 0) {
            // Display to the user help documentation and exit the program
            std::cout << "ControlSolution.exe designed to run on PXI with Marvin DIO Card installed.\n";
            std::cout << "Input arguments:\n";
            std::cout << " -f : (unsigned long 0 - 100000000) operating frequency of the Marvin card\n";
            std::cout << " -v : (boolean 0:false 1:true) running VISA subroutine\n";
            std::cout << " -i : filename.extension reference angle file to read and send to Marvin card\n";
            std::cout << " -e : (unsigned long 0 - inf) max milliseconds to run after trig before force halt\n";
            return 0;
        }
    }
    std::string pnInputName = std::string(nInputCSVFile);
    pnInputName = pnInputName.substr(0, pnInputName.find('.'));

    // --- Define instances of user-defined objects -----------------------------------------------

    // Define User-defined class that handles VISA interface with PXA
    VisaAPI keysight;
    // Define User-defined class that handles GTDIO interface
    MarvinAPI marvin;
    // Define User-defined class that handles Anokwiave interface
    AnokiAPI anoki(_exeFrequency);

    marvin.set_OperatingFrequency(_exeFrequency);
    anoki.set_CreateClockFlag(true);
    
    // Connect to visa resources
    if (_exeVISA) {
        keysight.cmd_SearchForVisaResource();
        keysight.cmd_StartVisaConnection();
        keysight.set_VisaAttributes();

        char command[VI_FIND_BUFLEN] = "";
        char response[VI_FIND_BUFLEN] = "";
        strcpy_s(command, "*IDN?\n");
        keysight.cmd_sendString(command, response);

        strcpy_s(command, ":DISP:ENAB ON");
        keysight.cmd_sendString(command, response);
        strcpy_s(command, ":INST:SEL BASIC");
        keysight.cmd_sendString(command, response);
        keysight.cmd_sendString("*CLS; *RST", response);

        keysight.cmd_sendString(":FORM REAL 32", response);

        keysight.cmd_sendString("FCAP:LENG", response);
        keysight.cmd_sendString("FCAP:LENG 10000", response);
        keysight.cmd_sendString("FCAP:BLOC 10000", response);
        keysight.cmd_sendString(":INIT:FCAP", response);

        keysight.cmd_EndVisaConnection();
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

    // --- Initialize marvin card -----------------------------------------------------------------
    marvin.cmd_SetConnection(0x103, DIO_IO_INTERFACE_LVDS, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT);
    marvin.cmd_StartConnection();
    marvin.cmd_ConfigureHandle( marvin.get_boardMasterHandle() );

    // --- Set LVDS cable latch high
    std::cout << "MAIN: Setting LVDS Latch channel high\n";

    marvin.set_BufferValue(marvin.get_boardMasterHandle(), 0x08, 5);
    marvin.cmd_RunFromStep(0);

    std::string userinputPAAPowered;
    std::cout << "Please power on the Anokiwave PAA now, it should recognize LVDS interface.\nWaiting for user to press enter.\n";
    std::getline(std::cin, userinputPAAPowered);

    // --- Load memory heap into DIO file
    marvin.set_fileName(pnInputName.c_str());
    //strcpy_s(marvin.szDIOFileNameInput, "marvin_test01.DIO");
    //strcpy_s(marvin.szDIFileNameOutput, "marvin_test01.DI");

    DWORD numAnokiSteps = anoki.get_numberOfSteps();
    marvin.set_CardMemory(marvin.get_boardMasterHandle(), anoki.get_commandPointer(), anoki.get_controlPointer(), numAnokiSteps);

    //DWORD numAnokiSteps = anoki.get_numberOfSteps();
    //marvin.cmd_StartDIOLoad(numAnokiSteps);
    //marvin.cmd_ConfigureHandle(marvin.get_fileHandle());
    //marvin.set_fileChannelName(marvin.get_fileHandle());

    //marvin.set_CardMemory(marvin.get_boardMasterHandle, anoki.get_commandPointer(), anoki.get_controlPointer(), numAnokiSteps);
    //marvin.cmd_LoadVectorToCard();
    
    // Provide run program with the maximum wait time before halting execution run.
    marvin.cmd_RunProgram(_exeMilliseconds);
    
    marvin.cmd_ReadFromCard();

    anoki.cmd_maskedReadMemory();
    anoki.export_ReadMemoryHEXSequence();

    return 0;
}

