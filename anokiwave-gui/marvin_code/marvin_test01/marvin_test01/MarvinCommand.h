#pragma once

#include <Windows.h>
#include "GTDIO.h"

#include <iostream>
#include <chrono>
#include <bitset>

// --- Defines MarvinCommand as C++ class with function and 
// properties of the Marvin GX5292 DIO command set
class MarvinCommand {


	// Convention that the prefix n[variablename] means public attribute
	// Convention that the prefix pn[variablename] points to a public attribute
	public:
		// Define public attributes
		SHORT nHandle, nFileHandle, nBoardType; // Defining the location of the handlers
		SHORT nDensity, nBanks, nStatus;
		SHORT nBoardFrequency;

		DWORD dwSize = 4096;		// Defines number of steps
		DWORD dwMemory[4096] = { 0 };	// Defines the data memory
		DWORD dwControl[4096] = { 0 };	// Defines the controller memory
		DWORD dwMemoryIndex = 0;		// Defines the memory index

		CHAR szFileNameInput[128];	// Defines the name of the input file
		CHAR szFileNameOutput[128];	// Defines the name of the output file

		// Define Public functions here

		/// Initializes the card connected at nSlotNum as nExpectBoard type, of interfaceType connection with operating mode.
		void SetupCard(unsigned int nSlotNum, int interfaceType, unsigned int nExpectBoard, int operatingMode);
		void SetupChannelAnoki(SHORT handle);
		void LoadCard(DWORD* _memory, DWORD* _control, DWORD _frequency);
		void GenerateExampleMemory();
		void RunProgram(DWORD _milliseconds);
		void ReadFromCard();

		void addBuffer(bool byteHeader, unsigned int _memoryIndex);
		void addClock(unsigned int _memoryIndex);
		void addCMDToMemory(unsigned int* seq, unsigned int _dataChannel, unsigned int cmdLength);
		void addSequenceToMemory(unsigned int* seq, unsigned int _cmdLength, unsigned int _channel, unsigned int _cmdPosition);
		void addCMDSingleToMemory(unsigned int value, unsigned int _channel, unsigned int _cmdPosition);
		

		void ShowMemory(DWORD* _memory, DWORD posStart, DWORD posEnd);

		void ctrlArm();
		void ctrlHalt();
		void ctrlPause();
		void ctrlTrig();

		

	private:
		void CheckStatus(SHORT nStatus);
};