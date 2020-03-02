/**
	File name: MarvinAPI.cpp

	Summary: User defined class that returns a Marvin object that contains command control information
			 and memory storage, referenced in GTDIO Programmer's Ref Guide

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Description: ...

	Usage: ...

*/
#pragma once

// Include corresponding header file
#include "..\include\MarvinAPI.h"


/// <summary>
/// Simple function to initialize the card locating in nSlotNum with connector of type interfaceType.
/// <param name='nSlotNum'> unsigned int defining the slot number. See PXI/PCI Explorer. </param>
/// <param name='interfaceType'> int representing the connector type, 0:TTL, 1:LVDS </param>
/// </summary>
void MarvinAPI::cmd_SetupInterface(SHORT _nSlotNum, SHORT _nInterfaceType, SHORT _nExpectBoard, SHORT _nOperatingMode) {
	nSlotNum = _nSlotNum;
	nInterfaceType = _nInterfaceType;
	nExpectedBoard = _nExpectBoard;
	nOperatingMode = _nOperatingMode;
}

void MarvinAPI::cmd_StartConnection() {

	// --- Initialize and return the board handle of the connected card -----------------------
	SHORT Master = 0;
	SHORT BoardNum = 1;
	DioSetupInitialization(Master, BoardNum, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);
	CheckStatus();
	// TODO: Add throw catch exception to stop running commands if card not even initialized

	// Stop any operations at initialization
	ctrlHalt();

	DioReset(nHandle, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Reseting board at board handle: " << nHandle << "\n";

	// --- Get the board type -----------------------------------------------------------------
	DioGetBoardType(nHandle, &nBoardType, &nStatus);
	CheckStatus();
	// Check and display the board type
	if (nBoardType == nExpectedBoard) {
		std::cout << "MarvinAPI: Correct board, initialized. Board Handle: " << nHandle << "\n";
	}
	else {
		std::cout << "MarvinAPI: Board at slot location not expected, check board." << "\n";
	}

	// --- Set up the connection interface ----------------------------------------------------
	DioSetupInputInterface(nHandle, nInterfaceType, &nStatus);
	CheckStatus();
	// Get the connection interface after setup
	SHORT nConnector;
	DioGetInputInterface(nHandle, &nConnector, &nStatus);
	CheckStatus();
	// Display the connection interface
	std::cout << "MarvinAPI: Marvin Card Interface: ";
	std::cout << (nConnector ? "LVDS \n" : "TTL \n"); // nConnector returns 1:LVDS, 0:TTL

	// --- Set up the Operating mode of the card ----------------------------------------------
	DioDomainSetupOperatingMode(nHandle, nOperatingMode, &nStatus);
	CheckStatus();
	// Get the operating mode after setup
	SHORT nOperatingMode = 0;
	DioDomainGetOperatingMode(nHandle, &nOperatingMode, &nStatus);
	CheckStatus();
	// Display the Operating mode of the card
	std::cout << "MarvinAPI: Operating mode: ";
	std::cout << (nOperatingMode ? "Real-Time Compare \n" : "High Speed IO Default \n"); // nOperatingMode 1:Real-Time 0:Default

	// --- Setup channel states of the card ------------------------------------------------------
	DWORD channelState = 0x00000000;
	DioSetupChannelsOutputStates(nHandle, 0xFFFFFFFF, &nStatus);
	CheckStatus();
	DioGetChannelsOutputStates(nHandle, &channelState, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Channels state set to " << std::hex << channelState << std::dec << "\n";

	// --- Setup output voltage level for LVDS. ---------------------------------------------------
	// TODO: Set the output voltage level for LVDS

	// --- Setup remainder of run output state ----------------------------------------------------
	// Allow Marvin to hold it's last value
	SHORT sendOutputState = OUTPUTS_ENABLED;
	SHORT readOutputState = NULL;
	DioSetupOutputState(nHandle, sendOutputState, &nStatus);
	CheckStatus();
	DioGetOutputState(nHandle, &readOutputState, &nStatus);
	CheckStatus();
	if (sendOutputState == readOutputState) {
		std::cout << "MarvinAPI: Output state configured.\n";
	}
	else {
		std::cout << "MarvinAPI: Could not configure output state.\n";
	}

}

//void MarvinAPI::SetupChannelAnoki(SHORT handle) {
//	// Define which channels are no return
//	SHORT channels_NR[4] = { 1, 2, 3, 4 };
//	SHORT numChannelsNR = sizeof(channels_NR) / sizeof(SHORT);
//	// Define which channels will return complement
//	// TODO : Attempt to map clock to channel 0
//	SHORT channels_RC[1] = { 0 };
//	SHORT numChannelsRC = sizeof(channels_RC) / sizeof(SHORT);
//
//	// Send the channel data format configuration
//	DioSetupOutputDataFormat(handle, DIO_CH_LIST_MODE_ARRAY_OF_CHANNELS, numChannelsNR, channels_NR, 0, DIO_OUTPUT_DATA_FORMAT_NR, &nStatus);
//	CheckStatus();
//	DioSetupOutputDataFormat(handle, DIO_CH_LIST_MODE_ARRAY_OF_CHANNELS, numChannelsRC, channels_RC, 0, DIO_OUTPUT_DATA_FORMAT_RC, &nStatus);
//	CheckStatus();
//
//	std::cout << "Channels set to data format of Anokiwave PAA. \n";
//}

void MarvinAPI::cmd_StartDIOLoad(DWORD _numSteps) {
	// --- Create a new file through DIOEasy ---------------------------------------------------
	std::cout << "MarvinAPI: Opening DIO File handle\n";
	DioFileOpen(szDIOFileNameInput, DIO_FILE_CREATE, &nBoardType, &nFileHandle, &nStatus);
	CheckStatus();

	// --- Give idea of how many steps will be loaded ------------------------------------------
	double fileSize = _numSteps / 1024;
	char sizeOfFile[100];
	std::string fileChar = "KB";
	if (fileSize > 1024) {
		fileSize = fileSize / 1024;
		fileChar = "MB";
	}
	snprintf(sizeOfFile, sizeof(sizeOfFile), "MarvinAPI: Loading DIO File: %.3f %s \n", fileSize, fileChar.c_str() );
	std::cout << std::string(sizeOfFile);

	// Set up file step size -- File CREATE
	std::cout << "MarvinAPI: Assigning number of steps to copy\n";
	dwSize = _numSteps;
	DioFileSetNumberOfSteps(nFileHandle, _numSteps, &nStatus);
	CheckStatus();

	// --- Set up the IO Configuration the card ------------------------------------------------

	//nWidth = 0; // 32-bit channel wide: 64MB, DWORD
	//nWidth = 1; // 16-bit channel wide: 128MB, WORD
	nWidth = 2; //8 bit channel wide: 256MB, BYTE10
	//nWidth = 3; // 4-bit channel wide: 512MB, Unpacked DWORD
	DioSetupIOConfiguration(nFileHandle, nWidth, NULL, &nStatus);
	CheckStatus();
	DioGetIOConfiguration(nFileHandle, &nWidth, NULL, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: IO Channel Width set to: " << (32 >> nWidth) << "\n";
	std::cout << "MarvinAPI: Max steps in memory: " << (64 << nWidth) << "MB \n";
}

void MarvinAPI::set_BufferValue(DWORD _value, DWORD _numSteps) {
	// Halt or pause the card at whatever state it is in
	ctrlHalt();
	std::cout << "MarvinAPI: Halting operation\n";

	// Writes the _value to the current state of the card
	//DioWriteIOPinsValue(nHandle, 0x08, &nStatus);
	//CheckStatus();

	unsigned char latchHigh[100];
	unsigned char controlArray[100];

	memset(latchHigh, _value, _numSteps);
	memset(controlArray, _value, _numSteps);

	// Take first two steps to set the latch high
	DioWriteOutMemory(nFileHandle, latchHigh, dwMemoryIndex, dwMemoryIndex + 2, &nStatus);
	CheckStatus();
	DioWriteDirectionMemory(nFileHandle, controlArray, dwMemoryIndex, dwMemoryIndex + 2, &nStatus);
	CheckStatus();

	DioWriteCtrlCommand(nFileHandle, dwMemoryIndex + _numSteps, DIO_COMMAND_HALT, 0, 0, 0, 0, &nStatus);
	CheckStatus();
	
	dwMemoryIndex = dwMemoryIndex + _numSteps;

	std::cout << "MarvinAPI: Wrote buffer value 0x" << std::hex << _value << std::dec << " from step 0 to 2.\n";
}

void MarvinAPI::set_CardMemory(PVOID _memory, PVOID _control, DWORD _numSteps) {
	//dwMemory = _memory;

	// Load the data information into memory
	std::cout << "MarvinAPI: Memory location pointer set\n";
	DioWriteOutMemory(nFileHandle, _memory, dwMemoryIndex, _numSteps, &nStatus);
	CheckStatus();

	//dwControl = _control;

	// Load the control information into direction memory
	std::cout << "MarvinAPI: Control location pointer set\n";
	DioWriteDirectionMemory(nFileHandle, _control, dwMemoryIndex, _numSteps, &nStatus);
	CheckStatus();

	std::cout << "MarvinAPI: End of command halt set\n";
	DioWriteCtrlCommand(nFileHandle, dwMemoryIndex + _numSteps, DIO_COMMAND_HALT, 0, 0, 0, 0, &nStatus);
	CheckStatus();
}

void MarvinAPI::cmd_LoadVectorToCard() {
	// Set the operating frequency of the board
	DioSetupFrequency(nFileHandle, nBoardFrequency, &nStatus);
	CheckStatus();

	DioFileClose(nFileHandle, &nStatus);
	CheckStatus();

	std::cout << "MarvinAPI: Closing DIO File  \n";

	// Set card to halt state before loading
	ctrlHalt();
	CheckStatus();

	// Load the dio file into card
	DioLoadFile(nHandle, szDIOFileNameInput, 0, 0, &dwSize, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Loading DIO File in card memory \n";
}

void MarvinAPI::GenerateExampleMemory() {
	
	std::cout << "Generating some random DWORD memory.\n";

	// TODO: Add a way to index and set random values to a void pointed array

	for (DWORD dwData = 0; dwData < 10; dwData++) {
		//dwMemory[dwData] = 0x000000FF;
	}
	for (DWORD dwData = 10; dwData < 30; dwData++) {
		//dwMemory[dwData] = 0x000000A6;
	}


	for (DWORD dwData = 0; dwData < dwSize; dwData++) {
		// if corresponding channel bit is high, input
		// if corresponding channel bit is low, output
		//dwControl[dwData] = 0x00000000; 
	}
}

void MarvinAPI::cmd_RunProgram(DWORD _milliseconds) {
	// Prepare card to run program
	ctrlArm();
	ctrlTrig();
	std::cout << "MarvinAPI: Armed board, Triggering board to run internal program \n";

	Sleep(_milliseconds);

	// Tell card to stop program
	ctrlHalt();
}

void MarvinAPI::cmd_ReadFromCard() {
	//Read back the card memory after operation with Anokiwave PAA
	DioReadInMemory(nHandle, dwMemory, 0, dwSize, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Reading Card Memory into AnokiAPI heap \n";

	DioSaveFile(nHandle, szDIFileNameOutput, 0, &dwSize, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Read card memory into file\n";
}

void MarvinAPI::set_OperatingFrequency(unsigned long _freq) {
	nBoardFrequency = _freq;
}


void MarvinAPI::show_Memory(PVOID _memory, DWORD posStart, DWORD posEnd) {

	// TODO : How to scan through bit positions of a void pointed array
	for (DWORD i = posStart; i < posEnd; i++) {
		//std::bitset<32> bit(_memory[i]);
		//std::cout << bit << "\n";
	}
}





// Set board state Halt to state Pause
void MarvinAPI::ctrlArm() {
	DioArm(nHandle, &nStatus);
	CheckStatus();
}
// Set board state Run/Pause to Halt
void MarvinAPI::ctrlHalt() {
	DioHalt(nHandle, &nStatus);
	CheckStatus();
}
// Set board state Run/Pause to Halt
void MarvinAPI::ctrlPause() {
	DioPause(nHandle, &nStatus);
	CheckStatus();
}
// Set board state Pause to state Run
void MarvinAPI::ctrlTrig() {
	DioTrig(nHandle, &nStatus);
	CheckStatus();
}



void MarvinAPI::CheckStatus() {
	// Check if nStatus = 0:success
	if (!nStatus) return;

	// Create the temporary Error Char String
	CHAR szError[512];
	DioGetErrorString(nStatus, szError, sizeof(szError)); // Display the error message
	std::cout << "Error Code: " << nStatus << "\t";
	std::cout << szError << "\n";

	// TODO: Change simple exit of program to exception thrown
	//std::cout << "Aborting Program \n";
	//exit(nStatus);
}

void MarvinAPI::CheckStatus(std::string _errorMsg) {
	if (!nStatus) return;
	
	CheckStatus();
}