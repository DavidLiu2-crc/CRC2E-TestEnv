/*

    File name: _instance_Marvin_test01.cpp

    Summary: This file contains the 'main' function. Program execution begins and ends there.

    Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

    Assumption made with LVDS connection using GX5292 to _instance_Anokiwave AWMF-0129 Phased Array Antenna
    IO 0: CLK
    IO 1: SDI
    IO 2: SDO
    IO 3: LATCH
    IO 4: STROBE

    Input arguments:
        -h   : Show help documentation for usage of this function
        -f   : (unsigned long 1 - 100 000 000 Hz) operating frequency of the attached _instance_Marvin card (default 1MHz)
        -e   : (any integer mS) Maximum execution wait time before force halt (default 1000 mS)
        -v 0 : (0: Don't connect, 1:Do connect) Connect to VISA resource found on machine (default false)
        -i   : string input pointing to an input csv file name (default anglePoint.csv)
        -o   : string output pointing to export file name handler (default _instance_Marvin_test01)


     Proper indexing types depending on length of command sequence
     _exe_ : global execution variable
     _temp : limited scope variables
     _ptr_ : global pointers to array
     _ctr_ : corresponding counter to array
     n     : limited to class/instance variable
     pn    : limited to class/instance pointers

     Visual Studio C++  : GTDIO     : VisaType  : Data Range                        Byte limit              : Byte Size
     -------------------+-----------+-----------+-----------------------------------------------------------+-----------
     unsigned char      : BYTE		: ViUInt8   : [0 - 255]                         [ff]                    : 1
     char               : CHAR      : ViInt8    : [-128 , 127]                                              : 1
     unsigned short int : WORD		: ViUInt16  : [0 - 65 535]                      [ffff]                  : 2
     short int          : SHORT     : ViInt16   : [-32 768, 32 767]                                         : 2
     unsigned long      : DWORD		: ViUInt32  : [0 - 4 294 967 295]               [ffff ffff]             : 4
     long, int          : INT       : ViInt32   : [-2 147 483 648, 2 147 483 647]                           : 4
     unsigned long long : DDWORD	: ViUInt64  : [0 - 18 446 744 073 709 551 615]  [ffff ffff ffff ffff]   : 8
     long long          :           : ViInt64   : [-9 223 372 036 854 775 808, 9 223 372 036 854 775 807]   : 8
     float              :           : ViReal32  : 3.4 E+- 38                                                : 4
     double             : DOUBLE    : ViReal64  : 1.7 E+- 308                                               : 8


*/

#include "Source.h"



void printFrequency(unsigned long _nFreq) {
    float _tempFrequency = (float)_nFreq;
    std::string hzChar = "Hz";
    if (_tempFrequency >= 1000) { // Check if in kHz range
        _tempFrequency = _tempFrequency / 1000;
        hzChar = "kHz";
    }
    if (_tempFrequency >= 1000) { // Check if in MHz range
        _tempFrequency = _tempFrequency / 1000;
        hzChar = "MHz";
    }
    std::cout << "MAIN: Marvin card operating @ freq = " << _tempFrequency << hzChar.c_str() << "\n";

}


// Variable naming convention : taking advantage of in scope variable call
//  _exe_ : global execution variable
//  _(type)_: underscore means variable is being passed between instances
//  _temp : temporary variables that will be deleted when out-of-scope (C++ garbage management)
//

// --- Main execution function
int main(int argc, char* argv[]) {
    // (Debugging) Wait long enough to attach debugger to process: Remote Windows Debugger
    // Sleep(3000);


    // --- ENTRY POINT OF MAIN EXECUTION ----------------------------------------------------------

    // Default value definition (checked against arguments when calling main function)
    unsigned long _exe_frequencyOperating_Hz = 1000000;  // execution operation frequency of marvin card (1 - 1e8 Hz)
    unsigned long _exe_PAAFrequency_MHz = 28050;    // execution pointing frequency of PAA (27.5 - 30 MHz)
    unsigned char _exe_PAABeamMode = 0;        // execution PAA beam mode (0,1,2,3)
    unsigned long _exe_ExecutionDuration_mS = 1000;     // execution sleep time
    unsigned long _exe_frequencySamples_MHz = 200;      // Frequency of the sampling rate
    bool _exe_ConnectToVISA_boolean = false;    // execution look for visa (true - false)
    bool _exe_CreateDoubleClockPulse = true;     // execution create block pulse in channel 0

    char _char_InputCSVFile[100] = { 0 };        // input CSV file name (max relative path size 100)
    snprintf(_char_InputCSVFile, sizeof(_char_InputCSVFile), "anglePoint.csv");     // Default input file name expected
    char _char_OutputFilename[100] = { 0 };      // output CSV file name (max relative path size 100)
    snprintf(_char_OutputFilename, sizeof(_char_OutputFilename), "marvin_test01");  //Default output file name returned

    // --- Check the optional parameters ----------------------------------------------------------
    for (unsigned char i = 1; i < argc; i++) {

        // Check if help option -h
        if (strcmp(argv[i], "-h") == 0) {
            // Display to the user help documentation and exit the program
            std::cout << "ControlSolution.exe designed to run on PXI with _instance_Marvin DIO Card installed.\n";
            std::cout << "Input arguments :\n";
            std::cout << " - h : Show help documentation for usage of this function\n";
            std::cout << " - f : (unsigned long 1 - 100 000 000 Hz) operating frequency of the attached _instance_Marvin card(default 1MHz)\n";
            std::cout << " - e : (any integer mS) Maximum execution wait time before force halt(default 1000 mS)\n";
            std::cout << " - v : (0: Don't connect, 1:Do connect) Connect to VISA resource found on machine (default false)\n";
            std::cout << " - i : string input pointing to an input csv file name(default anglePoint.csv)\n";
            std::cout << " - o : string output pointing to export file name handler(default _instance_Marvin_test01)\n";
            return 0;   // End of function if help was requested
        }

        // Check if input option -f (frequency)
        if (strcmp(argv[i], "-f") == 0) {
            _exe_frequencyOperating_Hz = std::stoi(argv[i + 1]);
            if (_exe_frequencyOperating_Hz > 100000000) _exe_frequencyOperating_Hz = 100000000;   // Upper bound the frequency
            i++;    // skip one iteration
        }

        // Check if input option -v (visa)
        if (strcmp(argv[i], "-v") == 0) {
            if (strcmp(argv[i + 1], "1") == 0) {
                _exe_ConnectToVISA_boolean = true;
            }
            else _exe_ConnectToVISA_boolean = false;
            i++;    // skip one iteration
        }

        // Check if input option -i (input file)
        if (strcmp(argv[i], "-i") == 0) {
            strcpy_s(_char_InputCSVFile, 100, argv[i + 1]);
            i++;    // skip one iteration
        }

        // Check if output option -o (output file)
        if (strcmp(argv[i], "-o") == 0) {
            strcpy_s(_char_OutputFilename, 100, argv[i + 1]);
            i++;    // skip one iteration
        }

        // Check if input option -e (execution time)
        if (strcmp(argv[i], "-e") == 0) {
            _exe_ExecutionDuration_mS = std::stoi(argv[i + 1]);
            i++;    // skip one iteration
        }
    }

    // --- Define instances of user-defined objects -----------------------------------------------

    VisaAPI _instance_VisaResource; // Define User-defined class that handles VISA interface with PXA
    MarvinAPI _instance_Marvin;     // Define User-defined class that handles GTDIO interface
    AnokiAPI _instance_Anoki;       // Define User-defined class that handles Anokwiave interface

    _instance_Anoki.set_CreateClockFlag(true);                  // Tells AnokiAPI to generate double steps
    _instance_Anoki.set_OperatingClockFreq(_exe_frequencyOperating_Hz);  // Tells AnokiAPI what frequency/period to wait for
    _instance_Marvin.set_OperatingFrequency(_exe_frequencyOperating_Hz); // Tells MarvinAPI the operating frequency


    // --- Initialize _instance_Marvin card -----------------------------------------------------------------
    // NULL, NULL, NULL, STROBE 0, LATCH 0, SDO 1, SDI 0, CLK 0
    CHAR _charA_anokiwaveLVDSchannel = 0x04; // IO direction when connecting to Anokiwave PAA through LVDS
    SHORT _short_nSlotNum = 0x103;
    _instance_Marvin.cmd_SetConnection(_short_nSlotNum, DIO_IO_INTERFACE_LVDS, DIO_BOARD_TYPE_GX5290, DIO_OPERATING_MODE_DEFAULT, _charA_anokiwaveLVDSchannel);
    _instance_Marvin.cmd_StartConnection();
    _instance_Marvin.cmd_ConfigureHandle(_instance_Marvin.get_boardMasterHandle());

    // --- Initialize visa resource ---------------------------------------------------------------
    //_instance_VisaResource.cmd_SearchForVisaResource(); // Search local machine for N9030A hislip0 INSTR (Takes 15s)
    _instance_VisaResource.set_VisaInstrDescrip("TCPIP::A-N9030A-90115.local::hislip0::INSTR"); // Directly connect to IP resource
    _instance_VisaResource.cmd_StartVisaConnection("N9030A");
    _instance_VisaResource.cmd_SetupIQ(_exe_PAAFrequency_MHz, 200);


    // --- Set the LVDS latch high for PAA power up -----------------------------------------------
    std::cout << "MAIN: Setting LVDS Latch channel high\n";

    _instance_Marvin.set_BufferValue(0x08, 0, 5);     // Set 0 to 5 buffer region as latch high
    _instance_Marvin.cmd_RunFromStep(0);              // --- Set LVDS cable latch high
    _instance_Marvin.get_programCounter();

    std::string _userinput_PAAPowered;
    std::cout << "Please power on the Anokiwave PAA now, it should recognize LVDS interface.\n";
    std::cout << "Waiting for user to press enter.\n";
    std::getline(std::cin, _userinput_PAAPowered);

    // --- Execution variables
    unsigned long _exe_numberSamples = 0;    // Number of samples to fetch
    unsigned long _exe_numberSteps = 0;    // Number of steps
    unsigned long _exe_numberFetchBlocks = 10000;// Number of data points to fetch each block (Max 131072)
    unsigned long _exe_numberFetchedPoints = 0;    // Number of fetched points
    PVOID _ptr_commandSeq = NULL;                   // Pointer to command sequence
    float* _ptr_fetchPXAdata = NULL;                // Pointer to PXA fetched data memory heap

    // --- Start keyboard control of Sweep Control Solution program
    std::string _userInput_Operation = "h";
    do {
        if (_userInput_Operation.compare("h") == 0) {
            std::cout << "Options for execution program\n";
            std::cout << "h : Show available commands (help command)\n";
            std::cout << "f : Configure the operating frequency\n";
            std::cout << "v : Configure whether to allow visa to fetch data during run\n";
            std::cout << "c : Clear the memory heap (does not delete, just memory heap to zero)\n\n";
            std::cout << "i : Import the input csv file --AnokiAPI--> local memory heap\n";
            std::cout << "l : Load the local memory heap onto the Marvin card at specified memory steps\n";
            std::cout << "o : Read the memory steps from Marvin card to local memory heap\n";
            std::cout << "e : Output the local memory heap (asc, txt)\n";
            std::cout << "r : Run the command sequence on Marvin card from specified steps\n";
            std::cout << "q : Quit the running program\n";
        }

        std::cout << "\nEnter a key from list above and press enter on the keyboard: ";
        std::getline(std::cin, _userInput_Operation);

        // Change the operating frequency
        if (_userInput_Operation.compare("f") == 0) {
            std::cout << "Enter a operating frequency for the Marvin card to run at (1 - 100 000 000Hz): ";
            std::getline(std::cin, _userInput_Operation);
            _exe_frequencyOperating_Hz = std::stoi(_userInput_Operation);

            // Confirm the frequency back to user
            printFrequency(_exe_frequencyOperating_Hz);

            _instance_Anoki.set_OperatingClockFreq(_exe_frequencyOperating_Hz);    // Tells AnokiAPI what frequency/period to wait for
            _instance_Marvin.set_OperatingFrequency(_exe_frequencyOperating_Hz);   // Tells MarvinAPI the operating frequency
        }

        // Change the visa block fetch parameter
        else if (_userInput_Operation.compare("v") == 0) {
            std::cout << "Do you want the PXI to fetch data block from PXA connected (no, yes): ";
            std::getline(std::cin, _userInput_Operation);
            if (_userInput_Operation.compare("yes") == 0) {
                _exe_ConnectToVISA_boolean = true;
                std::cout << "Main: Will try to connect to Visa devices \n";
            }
            else {
                _exe_ConnectToVISA_boolean = false;
                std::cout << "Main: Will not try to connect to Visa devices\n";
            }
        }

        // If the user wants to clear the content of AnokiAPI
        else if (_userInput_Operation.compare("c") == 0) {
            _instance_Anoki = AnokiAPI();

            _instance_Anoki.set_CreateClockFlag(true);
            _instance_Anoki.set_OperatingClockFreq(_exe_frequencyOperating_Hz);

            std::cout << "MAIN: Cleared AnokiAPI instance.\n";

            _instance_VisaResource.cmd_clearHeap();
            std::cout << "MAIN: Cleared Visa data block instance.\n";
        }

        // If user wants to import the csv file
        else if (_userInput_Operation.compare("i") == 0) {
            // Main:        Verify the local file that the user wants to import
            // AnokiAPI:    Load the file through AnokiAPI
            // AnokiAPI:    Convert to AnokiObj
            // Main:        Set file converted flag

            // Verify the frequency to generate the command sequence at
            printFrequency(_exe_frequencyOperating_Hz);

            // Verify to append or clear the existing memory heap of Anoki instance
            std::string _tempUserOption = "";
            std::cout << "MAIN: Do you want to clear the memory heap of this Anoki instance? (y) : ";
            std::getline(std::cin, _tempUserOption);
            if (_tempUserOption.compare("y") == 0) {
                _instance_Anoki = AnokiAPI();

                _instance_Anoki.set_CreateClockFlag(true);
                _instance_Anoki.set_OperatingClockFreq(_exe_frequencyOperating_Hz);
                std::cout << "MAIN: Cleared memory heap for this Anoki instance\n";
            }


            // Verify that the file to import is the following name
            std::cout << "MAIN: Do you want to import this csv file : " << _char_InputCSVFile << " ? (n) : ";
            std::getline(std::cin, _tempUserOption);
            if (_tempUserOption.compare("n") == 0) {
                std::string newFilename = "";
                std::cout << "MAIN: Enter the csv file name to import : ";
                std::getline(std::cin, newFilename);
                strcpy_s(_char_InputCSVFile, 100, newFilename.c_str());
            }

            // Import each line in the csv file
            _instance_Anoki.cmd_readFromCSV(_char_InputCSVFile, 3);

            // Set beam mode and frequency of scan
            _instance_Anoki.set_BeamSweepParameter(_exe_PAABeamMode, _exe_PAAFrequency_MHz, 0);

            // Tell AnokiAPI to convert the AnokiObjs to binary command sequence
            _instance_Anoki.cmd_generateCommandSequenceFromFile();

            // Calculate number of steps here
            _exe_numberSteps = _instance_Anoki.get_numberOfSteps();
            _ptr_commandSeq = _instance_Anoki.get_commandPointer();

            //_instance_Anoki.get_commandPointer((unsigned char*)_ptr_commandSeq, &_exe_numberSteps);

            // --- Display exepected execution time
            float _exeTime = (float)_exe_numberSteps / _exe_frequencyOperating_Hz;
            _exe_ExecutionDuration_mS = (unsigned long)ceil(_exeTime * 1000);
            std::cout << "MAIN: Execution sweep time: " << _exe_ExecutionDuration_mS << " mS\n";


            std::cout << "MAIN: Do you want to export the memory heap? (y) : ";
            std::getline(std::cin, _tempUserOption);
            if (_tempUserOption.compare("y") == 0) {
                // --- Generate a file describing memory content
                //_instance_Anoki.export_MemoryToASCII();
                _instance_Anoki.export_MemoryToReadable();
                std::cout << "\n";
            }

        }

        // If the user wants to load the _instance_Anoki object onto the _instance_Marvin card
        else if (_userInput_Operation.compare("l") == 0) {
            // MarvinAPI:   Give option to create a DIO file first
            // MarvinAPI:   Load the card memory of the Marvin card (to master handle not filehandle)

            // Assume csv file has been read by _instance_AnokiAPI
            _instance_Marvin.set_fileName(_char_OutputFilename);

            // Check if want to create a DIO file
            std::string _createDIOFileOption = "";
            std::cout << "MAIN: Do you want to create a vector file ? (y) : ";
            std::getline(std::cin, _createDIOFileOption);

            if (_createDIOFileOption.compare("y") == 0) {
                //_instance_Marvin.cmd_StartDIOLoad(num_instance_AnokiSteps);
                //_instance_Marvin.cmd_ConfigureHandle(_instance_Marvin.get_fileHandle());
                //_instance_Marvin.set_CardMemory(_instance_Marvin.get_fileHandle(), _instance_Anoki.get_commandPointer(), 0, num_instance_AnokiSteps);
                //_instance_Marvin.cmd_LoadVectorToCard();

                _instance_Marvin.cmd_LoadCardWithDIOFile(_ptr_commandSeq, _exe_numberSteps);
            }
            else {
                //_instance_Marvin.set_CardMemory(_instance_Marvin.get_boardMasterHandle(), _instance_Anoki.get_commandPointer(), _instance_Marvin.get_dwIndex(), num_instance_AnokiSteps);

                _instance_Marvin.cmd_LoadCardDirectly(_ptr_commandSeq, _exe_numberSteps);
            }

        }

        // If the user wants to read the result command sequence (assuming already ran once before)
        else if (_userInput_Operation.compare("o") == 0) {
            // MarvinAPI:   Create a DI file to offload the content of the memory
            // MarvinAPI:   Halt the card just in case
            // MarvinAPI:   Read from the memory and save as DI file
            // AnokiAPI:    Off load the memory heap as asc and txt file
            // AnokiAPI:    Add functionality to read the Serial Data Out information and determine if all commands were ACK

            _instance_Marvin.cmd_ReadFromCard();

            _instance_VisaResource.export_dataBlock();

            //_instance_Anoki.cmd_maskedReadMemory();
            //_instance_Anoki.export_ReadMemoryHEXSequence();

        }


        else if (_userInput_Operation.compare("e") == 0) {

        }

        // If the user wants to run the command sequence (assuming memory has been loaded onto the card with halt)
        else if (_userInput_Operation.compare("r") == 0) {
            // Main:        Ask which command sequence to trig until halt
            // MarvinAPI:   Set the program counter to the start of the command sequence
            // VisaAPI:     Tell PXA to initiate fetch
            // MarvinAPI:   Set the Marvin card state to run
            // MarvinAPI:   Wait execution time, constantly checking if the card has already halted
            // MarvinAPI:   Force halt in case the card doesnt

            _instance_Marvin.show_NumberOfCommands();
            _instance_Marvin.get_programCounter();

            // Ask user which set of commands to run
            std::string _startStepOption = "0";
            std::cout << "Enter the starting index to set the _instance_Marvin card to step at (0):";
            std::getline(std::cin, _startStepOption);

            if (_startStepOption.compare("") == 0) _startStepOption = "0"; // Set the default step

            // Change the program counter to user requested step
            _instance_Marvin.set_programCounter(std::stoi(_startStepOption));
            _instance_Marvin.get_programCounter();

            // Configure fetch parameters (Fetch length)
            _instance_VisaResource.set_fetchParameters(_exe_numberSteps, _exe_frequencyOperating_Hz, _exe_frequencySamples_MHz);
            _instance_VisaResource.cmd_initFCAP(_exe_numberSamples, _exe_numberFetchBlocks);    // :INIT:FCAP

            _instance_Marvin.cmd_RunProgram(_exe_ExecutionDuration_mS);

            _instance_VisaResource.cmd_fetchData(_ptr_fetchPXAdata, _exe_numberFetchedPoints);   // FETC:FCAP?
            _ptr_fetchPXAdata = _instance_VisaResource.get_dataPointer();
            _exe_numberFetchedPoints = _instance_VisaResource.get_dataCounter();

            _instance_Marvin.get_programCounter();
        }

        // If the user wants to quit the execution
        else if (_userInput_Operation.compare("q") == 0) {
            std::cout << "Quiting execution...\n";
            _instance_VisaResource.cmd_EndVisaConnection();   // Freeing up VISA session
            return 0;   // Quit the program
        }

        // Hidden function to import the data
        else if (_userInput_Operation.compare("z") == 0) {
            std::ifstream dataBlockFile;
            std::string pnInputFetchFile = "dataFetchedOn.txt";
            dataBlockFile.open(pnInputFetchFile, std::ios::in);

            std::string line = "";
            unsigned long i = 0;

            while (std::getline(dataBlockFile, line)) {
                _ptr_fetchPXAdata[i] = std::stof(line);
                i++;
            }




        }
    } while (true);

    return 0;
}

