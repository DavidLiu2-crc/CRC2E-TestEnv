#pragma once

#include "MarvinCommand.h"


/// <summary>
/// Simple function to initialize the card locating in nSlotNum with connector of type interfaceType.
/// <param name='nSlotNum'> unsigned int defining the slot number. See PXI/PCI Explorer. </param>
/// <param name='interfaceType'> int representing the connector type, 0:TTL, 1:LVDS </param>
/// </summary>
void MarvinCommand::SetupCard(unsigned int nSlotNum, int interfaceType, unsigned int nExpectBoard, int operatingMode) {

	// Initialize and return the board handle of the connected card
	SHORT Master = 0;
	SHORT BoardNum = 1;
	DioSetupInitialization(Master, BoardNum, nSlotNum, &nDensity, &nBanks, &nHandle, &nStatus);
	CheckStatus(nStatus);

	DioReset(nHandle, &nStatus);
	CheckStatus(nStatus);
	std::cout << "Reseting board at board handle" << nHandle << "\n";

	// Get the board type
	DioGetBoardType(nHandle, &nBoardType, &nStatus);
	CheckStatus(nStatus);

	// Check and display the board type
	if (!nStatus) {
		if (nBoardType == nExpectBoard) {
			std::cout << "Correct board, initialized. Board Handle: " << nHandle << "\n";
		}
		else {
			std::cout << "Board at slot location not expected, check board." << "\n";
		}
	}

	// Set up the connection interface
	DioSetupInputInterface(nHandle, interfaceType, &nStatus);
	CheckStatus(nStatus);
	// Get the connection interface after setup
	SHORT nConnector;
	DioGetInputInterface(nHandle, &nConnector, &nStatus);
	CheckStatus(nStatus);
	// Display the connection interface
	if (nConnector == 1) { // If nConnector = 1:LVDS
		std::cout << "Marvin Card Interface: LVDS \n";
	}
	else if (nConnector == 0) { // If nConnector = 0:TTL
		std::cout << "Marvin Card Interface: TTL \n";
	}

	// Set up the Operating mode of the card
	DioDomainSetupOperatingMode(nHandle, operatingMode, &nStatus);
	CheckStatus(nStatus);
	// Get the operating mode after setup
	SHORT nOperatingMode = 0;
	DioDomainGetOperatingMode(nHandle, &nOperatingMode, &nStatus);
	CheckStatus(nStatus);
	// Display the Operating mode of the card
	if (nOperatingMode == 1) { // if operatingMode = 1:Real-Time Compare
		std::cout<< "Operating mode: Real-Time Compare \n";
	}
	else if (nOperatingMode == 0) { // if operatingMode = 0:Default
		std::cout << "Operating mode: High Speed IO Default \n";
	}

}

void MarvinCommand::SetupChannelAnoki(SHORT handle) {
	// Define which channels are no return
	SHORT channels_NR[4] = { 1, 2, 3, 4 };
	SHORT numChannelsNR = sizeof(channels_NR) / sizeof(SHORT);
	// Define which channels will return complement
	// TODO : Attempt to map clock to channel 0
	SHORT channels_RC[1] = { 0 };
	SHORT numChannelsRC = sizeof(channels_RC) / sizeof(SHORT);

	// Send the channel data format configuration
	DioSetupOutputDataFormat(handle, DIO_CH_LIST_MODE_ARRAY_OF_CHANNELS, numChannelsNR, channels_NR, 0, DIO_OUTPUT_DATA_FORMAT_NR, &nStatus);
	CheckStatus(nStatus);
	DioSetupOutputDataFormat(handle, DIO_CH_LIST_MODE_ARRAY_OF_CHANNELS, numChannelsRC, channels_RC, 0, DIO_OUTPUT_DATA_FORMAT_RC, &nStatus);
	CheckStatus(nStatus);

	std::cout << "Channels set to data format of Anokiwave PAA. \n";
}



void MarvinCommand::LoadCard(DWORD* _memory, DWORD* _control, DWORD _frequency) {
	
	std::cout << "Opening DIO File to write memory into \n";

	// Create a new file through DIOEasy
	DioFileOpen(szFileNameInput, DIO_FILE_CREATE, &nBoardType, &nFileHandle, &nStatus);
	CheckStatus(nStatus);

	//SetupChannelAnoki(nFileHandle);

	// Set up file step size -- File OPEN
	DioFileSetNumberOfSteps(nFileHandle, 4096, &nStatus);
	CheckStatus(nStatus);

	// Load the data information into memory
	DioWriteOutMemory(nFileHandle, _memory, 0, 4096, &nStatus);

	// Load the control information into direction memory
	DioWriteDirectionMemory(nFileHandle, _control, 0, 4096, &nStatus);
	CheckStatus(nStatus);

	// Set the operating frequency of the board
	DioSetupFrequency(nFileHandle, _frequency, &nStatus);
	CheckStatus(nStatus);

	DioFileClose(nFileHandle, &nStatus);
	CheckStatus(nStatus);

	std::cout << "Closing DIO File \n";

	// Set card to halt state before loading
	ctrlHalt();
	CheckStatus(nStatus);

	// Load the dio file into card
	DioLoadFile(nHandle, szFileNameInput, 0, 0, &dwSize, &nStatus);
	CheckStatus(nStatus);
	std::cout << "Loading DIO File in card memory \n";
}

void MarvinCommand::GenerateExampleMemory() {
	
	std::cout << "Generating some random DWORD memory.\n";

	for (DWORD dwData = 0; dwData < 10; dwData++) {
		dwMemory[dwData] = 0x000000FF;
	}
	for (DWORD dwData = 10; dwData < 30; dwData++) {
		dwMemory[dwData] = 0x000000A6;
	}


	for (DWORD dwData = 0; dwData < dwSize; dwData++) {
		// if corresponding channel bit is high, input
		// if corresponding channel bit is low, output
		dwControl[dwData] = 0x00000000; 
	}
}

void MarvinCommand::RunProgram(DWORD _milliseconds) {
	// Prepare card to run program
	ctrlArm();
	std::cout << "Arming board, Triggering board to run internal program \n";
	ctrlTrig();

	Sleep(_milliseconds);

	// Tell card to stop program
	ctrlHalt();
}

void MarvinCommand::ReadFromCard() {
	std::cout << "Reading from card memory \n";
	DioSaveFile(nHandle, szFileNameOutput, 0, &dwSize, &nStatus);
	CheckStatus(nStatus);
	std::cout << "Read card memory into file\n";
}

void MarvinCommand::addBuffer(bool byteHeader, unsigned int _memoryIndex) {
	unsigned int latchByte = 0xFF;
	unsigned int strobeByte = 0x0F;
	addCMDSingleToMemory(latchByte, 3, _memoryIndex);
	if (!byteHeader) {	// If byteHeader = 0:End Byte
		addCMDSingleToMemory(strobeByte, 4, _memoryIndex);
	}
}

void MarvinCommand::addClock(unsigned int _memoryIndex) {

	unsigned int value = 0x5555;
	unsigned int bitmask = 0x8000;
	unsigned int addBit = 1;

	for (int i = 0; i < 8; i++) { // Loop through a single byte (8 bits) on a channel
		DWORD currentWord = dwMemory[_memoryIndex + i];
		dwMemory[_memoryIndex + i] = value & bitmask ? currentWord + addBit : currentWord;
		bitmask = bitmask >> 1;
	}
}

void MarvinCommand::addCMDToMemory(unsigned int* cmdSeq, unsigned int _dataChannel, unsigned int cmdLength) {

	// Add clock right into memory
	unsigned int clkByte = 0x55;

	// Add the starting byte
	addBuffer(true, dwMemoryIndex);
	dwMemoryIndex += 8*2;

	// Add the command sequence
	addSequenceToMemory(cmdSeq, cmdLength, _dataChannel, dwMemoryIndex);
	for (unsigned int i = 0; i < cmdLength * 2; i++) {
		addClock(dwMemoryIndex + 8*i);
	}
	dwMemoryIndex += 8 * 2 * cmdLength;

	// Add the ending byte
	addBuffer(false, dwMemoryIndex);
	dwMemoryIndex += 8*2;

}



// ------ LVDS Implementation - Generating own clock pulse -----
void MarvinCommand::addSequenceToMemory(unsigned int* seq, unsigned int _cmdLength, unsigned int _channel, unsigned int _cmdPosition) {
	// TODO: Change to size of array sequence
	for (unsigned int i = 0; i < 9; i++) {
		addCMDSingleToMemory(seq[i], _channel, _cmdPosition);
		_cmdPosition += 16;
	}

	/*for (unsigned int i = 0; i < 9; i++) {
		unsigned int bitmask = 0x80;
		unsigned int addBit = 1 << _channel;
		for (int j = 0; j < 8; j++) {
			unsigned int bitOffset = i * 8 * 2 + j;
			dwMemory[_cmdPosition + bitOffset] = seq[i] & bitmask ? addBit : 0;
			dwMemory[_cmdPosition + bitOffset + 1] = seq[i] & bitmask ? addBit : 0;
			bitmask = bitmask >> 1;
		}
	}*/
}

void MarvinCommand::addCMDSingleToMemory(unsigned int value, unsigned int _channel, unsigned int _cmdPosition) {
	
	unsigned int bitmask = 0x80;
	unsigned int addBit = 1 << _channel;
	for (int i = 0; i < 8; i++) { // Loop through a single byte (8 bits) on a channel
		DWORD currentWord = dwMemory[_cmdPosition + 2*i];
		dwMemory[_cmdPosition + 2*i] = value & bitmask ? currentWord + addBit : currentWord;
		dwMemory[_cmdPosition + 2*i + 1] = value & bitmask ? currentWord + addBit : currentWord;
		bitmask = bitmask >> 1;
	}
	
}

// ------ LVDS Implementation - Pulling LVDS Clock Out from J4 -----

//void MarvinCommand::addCMDToMemory(unsigned int* cmdSeq, unsigned int _dataChannel, unsigned int cmdLength) {
//
//	// Add the starting byte
//	addBuffer(true, dwMemoryIndex);
//	dwMemoryIndex += 8;
//	// Add the command sequence
//	addSequenceToMemory(cmdSeq, _dataChannel, dwMemoryIndex);
//	addSequenceToMemory(clkSeq, 0, dwMemoryIndex);
//	dwMemoryIndex += 8 * cmdLength;
//	// Add the ending byte
//	addBuffer(false, dwMemoryIndex);
//	dwMemoryIndex += 8;
//
//}

//void MarvinCommand::addSequenceToMemory(unsigned int* seq, unsigned int _channel, unsigned int _cmdPosition) {
//	// TODO: Change to size of array sequence
//	for (unsigned int i = 0; i < 9; i++) {
//		unsigned int bitmask = 0x80;
//		unsigned int addBit = 1 << _channel;
//		for (int j = 0; j < 8; j++) {
//			unsigned int bitOffset = i * 8 + j;
//			dwMemory[_cmdPosition + bitOffset] = seq[i] & bitmask ? addBit : 0;
//			bitmask = bitmask >> 1;
//		}
//	}
//}
//
//void MarvinCommand::addCMDSingleToMemory(unsigned int value, unsigned int _channel, unsigned int _cmdPosition) {
//
//	unsigned int bitmask = 0x80;
//	unsigned int addBit = 1 << _channel;
//	for (int i = 0; i < 8; i++) { // Loop through a single byte (8 bits) on a channel
//		dwMemory[_cmdPosition + i] = value & bitmask ? dwMemory[_cmdPosition + i] + addBit : dwMemory[_cmdPosition + i];
//		bitmask = bitmask >> 1;
//	}
//
//}



void MarvinCommand::ShowMemory(DWORD* _memory, DWORD posStart, DWORD posEnd) {

	for (DWORD i = posStart; i < posEnd; i++) {
		std::bitset<32> bit(_memory[i]);
		std::cout << bit << "\n";
	}
}





// Set board state Halt to state Pause
void MarvinCommand::ctrlArm() {
	DioArm(nHandle, &nStatus);
	CheckStatus(nStatus);
}
// Set board state Run/Pause to Halt
void MarvinCommand::ctrlHalt() {
	DioHalt(nHandle, &nStatus);
	CheckStatus(nStatus);
}
// Set board state Run/Pause to Halt
void MarvinCommand::ctrlPause() {
	DioPause(nHandle, &nStatus);
	CheckStatus(nStatus);
}
// Set board state Pause to state Run
void MarvinCommand::ctrlTrig() {
	DioTrig(nHandle, &nStatus);
	CheckStatus(nStatus);
}





void MarvinCommand::CheckStatus(SHORT nStatus) {
	
	// Check if nStatus = 0:success
	if (!nStatus) return;

	// Create the temporary Error Char String
	CHAR szError[512];
	DioGetErrorString(nStatus, szError, sizeof(szError)); // Display the error message
	std::cout << "Error Code: " << nStatus << "\t";
	std::cout << szError << "\n";

	std::cout << "Aborting Program \n";
	//exit(nStatus);
}
