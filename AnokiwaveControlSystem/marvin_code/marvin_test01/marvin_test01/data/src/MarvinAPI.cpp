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

// --- Define Public functions here ---------------------------------------------------------------
void MarvinAPI::cmd_SetConnection(SHORT _nSlotNum, SHORT _nInterfaceType, SHORT _nExpectBoard, SHORT _nOperatingMode) {
	nSlotNum = _nSlotNum;
	nInterfaceType = _nInterfaceType;
	nExpectedBoard = _nExpectBoard;
	nOperatingMode = _nOperatingMode;
}

void MarvinAPI::cmd_StartConnection() {

	// --- Initialize and return the board handle of the connected card ---------------------------
	SHORT Master = 0;
	SHORT BoardNum = 1;
	DioSetupInitialization(Master, BoardNum, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);
	CheckStatus();
	// TODO: Add throw catch exception to stop running commands if card not even initialized

	// Stop any operations at initialization
	stateHALT();

	DioReset(nHandle, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Reseting board at board handle: " << nHandle << "\n";

	// --- Get the board type ---------------------------------------------------------------------
	DioGetBoardType(nHandle, &nBoardType, &nStatus);
	CheckStatus();
	// Check and display the board type
	if (nBoardType == nExpectedBoard) {
		std::cout << "MarvinAPI: Correct board, initialized. Board Handle: " << nHandle << "\n";
	}
	else {
		std::cout << "MarvinAPI: Board at slot location not expected, check board." << "\n";
	}

	// --- Setup remainder of run output state ----------------------------------------------------
	SHORT sendOutputState = OUTPUTS_ENABLED; // Allow Marvin to hold it's last value
	SHORT readOutputState = NULL;
	DioSetupOutputState(nHandle, sendOutputState, &nStatus);
	CheckStatus();
	DioGetOutputState(nHandle, &readOutputState, &nStatus);
	CheckStatus();//
	if (sendOutputState == readOutputState) {
		std::cout << "MarvinAPI: Configured all channel to output state\n";
	}
	else {
		std::cout << "MarvinAPI: Could not configure output state.\n";
	}
}

void MarvinAPI::cmd_ConfigureHandle(SHORT nHandle) {

	// --- Set up the IO Configuration the card ------------------------------------------------
	//nWidth = 0; // 32-bit channel wide: 64MB, DWORD
	//nWidth = 1; // 16-bit channel wide: 128MB, WORD
	nWidth = 2; //8 bit channel wide: 256MB, BYTE10
	//nWidth = 3; // 4-bit channel wide: 512MB, Unpacked DWORD
	SHORT nDirection = 0;
	DioSetupIOConfiguration(nHandle, nWidth, nDirection, &nStatus);
	CheckStatus();
	DioGetIOConfiguration(nHandle, &nWidth, &nDirection, &nStatus);
	CheckStatus();
	// Display the IO Channel width
	//std::cout << "MarvinAPI: Configured IO Channel Width set to: " << (32 >> nWidth) << "\n";
	//std::cout << "MarvinAPI: Configured max steps in memory: " << (64 << nWidth) << "MB \n";

	// --- Set up the connection interface --------------------------------------------------------
	SHORT nConnector; 
	DioSetupInputInterface(nHandle, nInterfaceType, &nStatus);
	CheckStatus();
	DioGetInputInterface(nHandle, &nConnector, &nStatus);
	CheckStatus();
	// Display the connection interface
	//std::cout << "MarvinAPI: Configured card interface type: ";
	//std::cout << (nConnector ? "LVDS \n" : "TTL \n"); // nConnector returns 1:LVDS, 0:TTL

	// --- Set up the Operating mode of the card --------------------------------------------------
	SHORT nOperatingMode = 0; 
	DioDomainSetupOperatingMode(nHandle, nOperatingMode, &nStatus);
	CheckStatus();
	DioDomainGetOperatingMode(nHandle, &nOperatingMode, &nStatus);
	CheckStatus();
	// Display the Operating mode of the card
	//std::cout << "MarvinAPI: Configured operating mode: ";
	//std::cout << (nOperatingMode ? "Real-Time Compare \n" : "High Speed IO Default \n"); // nOperatingMode 1:Real-Time 0:Default

	// --- Set up the operating frequency -------------------------------------------------------
	DWORD nCheckFrequency = 1;
	DioSetupFrequency(nHandle, nBoardFrequency, &nStatus);
	CheckStatus();
	DioGetFrequency(nHandle, &nCheckFrequency, &nStatus);
	CheckStatus();
	// TODO: Make frequency display 6 decimal points
	//std::cout << "MarvinAPI: Configured operating frequency: " << (nCheckFrequency / 1000000) << "MHz\n";

	// --- Setup channel states of the card -------------------------------------------------------
	DWORD channelState = 0x00000000;
	DioSetupChannelsOutputStates(nHandle, 0xFFFFFFFF, &nStatus);
	CheckStatus();
	DioGetChannelsOutputStates(nHandle, &channelState, &nStatus);
	CheckStatus();
	// Display the channel state
	//std::cout << "MarvinAPI: Configured channels state set to 0x" << std::hex << channelState << std::dec << "\n";
	
	std::cout << "MarvinAPI: Configured attributes of the handle\n";

	// --- Setup output voltage level for LVDS. ---------------------------------------------------
	// TODO: Set the output voltage level for LVDS
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
	char * sizeOfFile = new char[100];
	std::string fileChar = "KB";
	if (fileSize > 1024) {
		fileSize = fileSize / 1024;
		fileChar = "MB";
	}
	snprintf(sizeOfFile, sizeof(sizeOfFile), "MarvinAPI: Loading DIO File: %.3f %s \n", fileSize, fileChar.c_str() );
	std::cout << std::string(sizeOfFile);
	delete[] sizeOfFile;

	// --- Set up file step size -- File CREATE -------------------------------------------------
	std::cout << "MarvinAPI: Assigning number of steps to copy\n";
	dwSize = _numSteps;
	DioFileSetNumberOfSteps(nFileHandle, _numSteps, &nStatus);
	CheckStatus();

	// --- Set up file number of channels -------------------------------------------------------
	nWidth = 2; //8 bit channel wide: 256MB, BYTE10
	SHORT nDirection = 0;
	DioSetupIOConfiguration(nFileHandle, nWidth, nDirection, &nStatus);
	CheckStatus();
	DioGetIOConfiguration(nFileHandle, &nWidth, &nDirection, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: IO Channel Width set to: " << (32 >> nWidth) << "\n";
	std::cout << "MarvinAPI: Max steps in memory: " << (64 << nWidth) << "MB \n";
}

void MarvinAPI::cmd_LoadVectorToCard() {
	// Set the operating frequency of the board
	DioSetupFrequency(nFileHandle, nBoardFrequency, &nStatus);
	CheckStatus();

	DioFileClose(nFileHandle, &nStatus);
	CheckStatus();

	std::cout << "MarvinAPI: Closing DIO File  \n";

	// Set card to halt state before loading
	stateHALT();
	CheckStatus();

	// Load the dio file into card
	DioLoadFile(nHandle, szDIOFileNameInput, 0, 0, &dwSize, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Loading DIO File in card memory \n";
}

void MarvinAPI::cmd_RunProgram(DWORD _milliseconds) {
	// Prepare card to run program
	stateRUN();
	std::cout << "MarvinAPI: Armed board, Triggering board to run internal program \n";

	CheckStatusRegister();
	Sleep(_milliseconds);
	CheckStatusRegister();

	DioReadProgramCounter(nHandle, &dwSize, &nStatus);
	CheckStatus();
	
	// Tell card to stop program
	stateHALT();
}

void MarvinAPI::cmd_ReadFromCard() {
	//Read back the card memory after operation with Anokiwave PAA
	std::cout << "(Debugger) check here. "<< dwSize <<"\n";
	DioReadInMemory(nHandle, dwMemory, 0, dwSize, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Reading Card Memory into AnokiAPI heap \n";
	
	DioSaveFile(nHandle, szDIFileNameOutput, 0, &dwSize, &nStatus);
	CheckStatus();
	std::cout << "MarvinAPI: Read card memory into file\n";
}

// Assumes there is a halt command that will stop the execution of the card
void MarvinAPI::cmd_RunFromStep(DWORD _nStartStep) {
	DioWriteProgramCounter(nHandle, _nStartStep, &nStatus);
	CheckStatus();
	
	stateRUN();
	CheckStatusRegister();
	CheckStatusRegister();
}

// --- Define set functions here ------------------------------------------------------------------
// Assumes _numSteps < 20
void MarvinAPI::set_BufferValue(SHORT _nHandle, DWORD _value, DWORD _numSteps) {
	// Halt or pause the card at whatever state it is in
	stateHALT();

	// Writes the _value to the current state of the card
	//DioWriteIOPinsValue(nHandle, 0x08, &nStatus);
	//CheckStatus();

	unsigned char* latchHigh = new unsigned char[20];
	unsigned char* controlArray = new unsigned char[20];

	memset(latchHigh, _value, _numSteps);
	memset(controlArray, 0x00, _numSteps);

	// Take first two steps to set the latch high
	DioWriteOutMemory(_nHandle, latchHigh, dwMemoryIndex, dwMemoryIndex + _numSteps, &nStatus);
	CheckStatus();
	DioWriteDirectionMemory(_nHandle, controlArray, dwMemoryIndex, dwMemoryIndex + _numSteps, &nStatus);
	CheckStatus();

	DioWriteCtrlCommand(_nHandle, dwMemoryIndex + _numSteps, DIO_COMMAND_HALT, 0, 0, 0, 0, &nStatus);
	CheckStatus();

	std::vector<unsigned long> addindex;
	addindex.push_back(dwMemoryIndex);
	addindex.push_back(dwMemoryIndex + _numSteps);
	nVectorCommandSet.push_back(addindex);

	std::cout << "MarvinAPI: Wrote buffer value 0x" << std::hex << _value << std::dec << " from step 0 to 2.\n";
	
	// Memory clean up
	delete[] latchHigh;
	delete[] controlArray;
}

void MarvinAPI::set_CardMemory(SHORT _nHandle, PVOID _memory, PVOID _control, DWORD _numSteps) {
	//dwMemory = _memory;

	std::cout << "MarvinAPI: End of command halt set\n";
	DioWriteCtrlCommand(_nHandle, dwMemoryIndex, DIO_COMMAND_PAUSE, 0, 0, 0, 0, &nStatus);
	CheckStatus();

	// Load the data information into memory
	std::cout << "MarvinAPI: Memory location pointer set\n";
	DioWriteOutMemory(_nHandle, _memory, dwMemoryIndex,  _numSteps, &nStatus);
	CheckStatus();

	//dwControl = _control;

	// Load the control information into direction memory
	std::cout << "MarvinAPI: Control location pointer set\n";
	DioWriteDirectionMemory(_nHandle, _control, dwMemoryIndex,  _numSteps, &nStatus);
	CheckStatus();

	std::cout << "MarvinAPI: End of command halt set\n";
	DioWriteCtrlCommand(_nHandle, dwMemoryIndex + _numSteps, DIO_COMMAND_JUMP_A, 0, 0, 0, 0, &nStatus);
	CheckStatus();

	std::vector<unsigned long> addindex;
	addindex.push_back(dwMemoryIndex);
	addindex.push_back(dwMemoryIndex + _numSteps);
	nVectorCommandSet.push_back(addindex);

	dwMemoryIndex = dwMemoryIndex + _numSteps;
}

void MarvinAPI::set_OperatingFrequency(unsigned long _freq) {
	// Upper bound the frequency at 100MHz for GX5292
	_freq > 100000000 ? _freq = 100000000 : _freq;

	nBoardFrequency = _freq;	// Set the local frequency attribute
}

void MarvinAPI::set_fileChannelName(SHORT _nFileHandler) {
	if (nFileHandle == NULL) {
		// TODO: throw exception here
		return;
	}
	
	char _channelName[8];
	unsigned char strLength = sizeof(char) + 7;
	strcpy_s(_channelName, strLength, "CLOCK");
	DioFileSetChannelName(_nFileHandler, 0, _channelName, 5, &nStatus);
	strcpy_s(_channelName, strLength, "SDI");
	DioFileSetChannelName(_nFileHandler, 1, _channelName, 4, &nStatus);
	strcpy_s(_channelName, strLength, "SDO");
	DioFileSetChannelName(_nFileHandler, 2, _channelName, 5, &nStatus);
	strcpy_s(_channelName, strLength, "LATCH");
	DioFileSetChannelName(_nFileHandler, 3, _channelName, 5, &nStatus);
	strcpy_s(_channelName, strLength, "STROBE");
	DioFileSetChannelName(_nFileHandler, 4, _channelName, 6, &nStatus);

	strcpy_s(_channelName, strLength, "NULL1");
	DioFileSetChannelName(_nFileHandler, 5, _channelName, 5, &nStatus);
	strcpy_s(_channelName, strLength, "NULL2");
	DioFileSetChannelName(_nFileHandler, 6, _channelName, 5, &nStatus);
	strcpy_s(_channelName, strLength, "NULL3");
	DioFileSetChannelName(_nFileHandler, 7, _channelName, 5, &nStatus);


}

void MarvinAPI::set_fileName(char* _nFilename) {
	szDIOInputFileName = std::string(_nFilename);
	szDIOInputFileName = szDIOInputFileName + ".DIO";
}

// --- Define get functions here --------------------------------------------------------------
SHORT MarvinAPI::get_boardMasterHandle() {
	return nHandle;
}

SHORT MarvinAPI::get_fileHandle() {
	return nFileHandle;
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

void MarvinAPI::show_Memory(PVOID _memory, DWORD posStart, DWORD posEnd) {

	// TODO : How to scan through bit positions of a void pointed array
	for (DWORD i = posStart; i < posEnd; i++) {
		//std::bitset<32> bit(_memory[i]);
		//std::cout << bit << "\n";
	}
}





// Set board state Halt
void MarvinAPI::ctrlArm() {
	DioArm(nHandle, &nStatus);
	CheckStatus();
}
// Set board state Run/Pause to Halt
void MarvinAPI::ctrlHalt() {
	CheckStatusRegister();

	if (status_state == 0) {
		// Marvin card already in halt state;
		return;
	}
	// Otherwise, halt the card.
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


void MarvinAPI::stateHALT() {
	CheckStatusRegister();
	// See DioEasyUG page 32
	if (status_state >= 3) {
		ctrlHalt();
	}
	// Otherwise, assume already in HALT state
}

void MarvinAPI::statePAUSE() {
	CheckStatusRegister();

	if (status_state == 0) {
		ctrlArm();
	}
	else if (status_state > 3) {
		ctrlPause();
	}
	// Otherwise, assume already in PAUSE state
}

void MarvinAPI::stateRUN() {
	CheckStatusRegister();

	if (status_state == 0) {
		ctrlArm();
		ctrlTrig();
	}
	else if (status_state == 3) {
		ctrlTrig();
	}
	// Otherwise, assume already in RUN state
}



void MarvinAPI::CheckStatus() {
	// Check if nStatus = 0:success
	if (!nStatus) return;

	// Create the temporary Error Char String
	CHAR* szError = new char[512];

	DioGetErrorString(nStatus, szError, sizeof(szError) + 512); // Display the error message
	std::cout << "Error Code: " << nStatus << "\t";
	std::cout << szError << "\n";

	delete[] szError;

	// TODO: Change simple exit of program to exception thrown
	//std::cout << "Aborting Program \n";
	//exit(nStatus);
}

void MarvinAPI::CheckStatus(std::string _errorMsg) {
	if (!nStatus) return;
	
	CheckStatus();
}

void MarvinAPI::CheckStatusRegister() {
	WORD _statusRegister = 0;
	DioReadStatusRegister(nHandle, &_statusRegister, &nStatus);
	CheckStatus();

	// 10 bit status register
	if (nBoardType == DIO_BOARD_TYPE_GX5290) {
		//std::cout << "MarvinAPI: Status Register content: ";

		//WORD bitMask = 0x0200;
		//// Sweep through to display each bit position
		//for (unsigned char i = 0; i < 10; i++) {
			// Displaying each bit
			//std::cout << ((bitMask & _statusRegister) > 0) ? 1 : 0;
			//bitMask = bitMask >> 1;
		//}
		//std::cout << "\n";

		// Set status flags
		status_AOF   = _statusRegister & 0x0100 ? true : false;
		status_RFlag = _statusRegister & 0x0040 ? true : false;
		status_DEQ   = _statusRegister & 0x0020 ? true : false;
		status_state = ((_statusRegister & 0x001B) >> 2);
		status_trigger = _statusRegister & 0x0003;
	}
		
}

