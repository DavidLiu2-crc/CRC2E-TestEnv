#pragma once

#include <Windows.h>
#include "GTDIO.h"

#include <iostream>
#include <chrono>
#include <bitset>

// --- Defines MarvinCommand as C++ class with function and 
// properties of the Marvin GX5292 DIO command set
class MarvinCommand {


	// Convention usage list:
	// prefix n[variablename] means public attribute
	// prefix pn[variablename] points to a public attribute
	// prefix _[variablename] means an external value that is passed
	public:
		// Define public attributes
		unsigned int nSlotNum, nInterfaceType, nExpectedBoard, nOperatingMode;

		SHORT nHandle, nFileHandle, nBoardType; // Defining the location of the handlers
		SHORT nDensity, nBanks, nStatus;
		SHORT nBoardFrequency;

		DWORD dwSize = 4096;		// Defines number of steps
		DWORD dwMemory[4096] = { 0 };	// Defines the data memory
		DWORD dwControl[4096] = { 0 };	// Defines the controller memory
		

		CHAR szFileNameInput[128];	// Defines the name of the input file
		CHAR szFileNameOutput[128];	// Defines the name of the output file

		// Define Public functions here

		// Initializes the card connected at nSlotNum as nExpectBoard type, of interfaceType connection with operating mode
		void SetupInterface(unsigned int _nSlotNum, unsigned int _nInterfaceType, unsigned int _nExpectBoard, unsigned int _nOperatingMode);
		// Start communicating with the card
		void StartConnection();
		/* // Initialize IO Channels to Data Format for easier bit flipping (GX5055 only)
		// void SetupChannelAnoki(SHORT handle); */
		// Opens DIOEasy handle and loads the memory and control content of this instance
		void LoadCard();
		// Opens DIOEasy handle and loads _memory and _control onto card
		void LoadCardWith(DWORD* _memory, DWORD* _control);
		// Loads the Data Memory and Control Memory with random information
		void GenerateExampleMemory();
		// Set Marvin Card to Run state 
		void RunProgram(DWORD _milliseconds);
		// Read the Marvin Card memory as .DI file
		void ReadFromCard();

		// Adds a latch high, strobe low to current memory index and post-increments
		void addBuffer(bool byteHeader, unsigned int _memoryIndex);
		// Adds a block bit flip to channel 0 at current memory index and post-increments
		void addClock(unsigned int _memoryIndex);
		// Adds command sequence with proper Header and End bytes
		void addCMDToMemory(unsigned int* seq, unsigned int _dataChannel, unsigned int cmdLength);
		// Adds command sequence with proper Header and End bytes and latches high for some delaytime
		void addCMDToMemoryWithSkip(unsigned int* seq, unsigned int _dataChannel, unsigned int cmdLength, double _delayTime);
		// Adds a vector pointed by seq of length _cmdLength to IO memory _channel at _cmdPosition index
		void addSequenceToMemory(unsigned int* seq, unsigned int _cmdLength, unsigned int _channel, unsigned int _cmdPosition);
		// Adds a byte of information to IO memory _channel at _cmdPosition index
		void addByteToMemory(unsigned int value, unsigned int _channel, unsigned int _cmdPosition);
		
		// Show the memory from starting index to end
		void ShowMemory(DWORD* _memory, DWORD posStart, DWORD posEnd);

		// Simple Set ARM state
		void ctrlArm();
		// Simple Set HALT state
		void ctrlHalt();
		// Simple Set PAUSE state
		void ctrlPause();
		// Simple Set TRIG state
		void ctrlTrig();

		

	private:
		DWORD dwMemoryIndex = 0;		// Defines the memory index

		void CheckStatus(SHORT nStatus);
};