/**
	File name: MarvinAPI.h

	Summary: User defined class that returns a Marvin object that contains command control information
			 and memory storage, referenced in GTDIO Programmer's Ref Guide

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Description: ...

	Usage: ...

*/
#pragma once

// Include GTDIO Marvin Test Solution header files
#include <Windows.h>
#include "GTDIO.h"

// Include generally neccessary packages
#include <iostream>
#include <stdexcept>
#include <vector>
#include <chrono>
#include <bitset>


// --- Defines MarvinAPI as C++ class with function and properties of the Marvin GX52920 DIO command set
class MarvinAPI {


// Convention usage list:
// prefix n[variablename] means public attribute
// prefix pn[variablename] points to a public attribute
// prefix _[variablename] means an external value that is passed
public:
	// ---- Define public attributes ------------------------------------------------------------
	CHAR szDIOFileNameInput[128]{ ' ' };	// Defines the name of the input file
	CHAR szDIFileNameOutput[128]{ ' ' };	// Defines the name of the output file

	// --- Define Public functions here --------------------------------------------------------

	/// <summary>
	/// Simple function to initialize the card locating in nSlotNum with connector of type interfaceType.
	/// <param name='nSlotNum'> unsigned int defining the slot number. See PXI/PCI Explorer. </param>
	/// <param name='interfaceType'> int representing the connector type, 0:TTL, 1:LVDS </param>
	/// </summary>
	void cmd_SetupInterface(SHORT _nSlotNum, SHORT _nInterfaceType, SHORT _nExpectBoard, SHORT _nOperatingMode);
	
	/// <summary>
	/// Starts connection with Marvin Card located at nSlotNum.
	/// Connects to board at nSlotNum, gets the board to check if recognized (0x70 GX5292 default)
	/// Sets up the input interface, operating mode (most importantly)
	/// IO configuration (channel width), channel output state, remainder output state.
	/// </summary>
	void cmd_StartConnection();

	/* // Initialize IO Channels to Data Format for easier bit flipping (GX5055 only)
	// void SetupChannelAnoki(SHORT handle); */

	/// <summary>
	/// Create a DIO File and set the number of steps for that file
	/// </summary>
	/// <param name="_numSteps"></param>
	void cmd_StartDIOLoad(DWORD _numSteps);

	void set_BufferValue(DWORD _value, DWORD _numSteps);
	// Opens DIOEasy handle and loads the memory and control content of this instance
	void set_CardMemory(PVOID _memory, PVOID _control, DWORD _numSteps);

	// Opens DIOEasy handle and loads _memory and _control onto card
	void cmd_LoadVectorToCard();
	// Loads the Data Memory and Control Memory with random information
	void GenerateExampleMemory();
	// Set Marvin Card to Run state 
	void cmd_RunProgram(DWORD _milliseconds);
	// Read the Marvin Card memory as .DI file
	void cmd_ReadFromCard();
	// Set the operating frequency of the Marvin Card
	void set_OperatingFrequency(unsigned long _freq);

	// Show the memory from starting index to end
	void show_Memory(PVOID _memory, DWORD posStart, DWORD posEnd);

	// Simple Set ARM state
	void ctrlArm();
	// Simple Set HALT state
	void ctrlHalt();
	// Simple Set PAUSE state
	void ctrlPause();
	// Simple Set TRIG state
	void ctrlTrig();

		

private:
	SHORT nSlotNum = 0;			// Value of slot number in chassis; 0x103 for PXI chassis
	SHORT nInterfaceType = 0;	// Value of interface type; 0:TTL, 1:LVDS
	SHORT nExpectedBoard = 0;	// Value of expected board type; 0x70 for GX5292
	SHORT nOperatingMode = 0;	// Value of the operating mode; 0:Default, 1:Real-Time Compare
	SHORT nWidth = 0;			// Value of the channel width; 0:32 bit, 1:16 bit, 2:8 bit, 3:4 bit, 4:2 bit, 5:1 bit

	SHORT nHandle = 0;		// Pointer of the card handle
	SHORT nFileHandle = 0;	// Pointer of the DIO file handle
	SHORT nBoardType = 0;	// Pointer of the board type seen by chassis
	SHORT nDensity = 0;		// Pointer of the memory bank density
	SHORT nBanks = 0;		// Pointer of the number of memory banks

	SHORT nStatus = 0;			// Pointer of the error status value
	DWORD nBoardFrequency = 1;	// Pointer of the card board frequency

	// TODO: Add std::vector to hold many vector ascii references
	DWORD dwSize = 0;	// Defines number of steps
	DWORD dwMemoryIndex = 0;		// Defines the memory index
	PVOID dwMemory;	// Defines the pointer to data memory
	PVOID dwControl;	// Defines the pointer to control memory

	std::vector<unsigned long[2]> nVectorCommandSet;

	//DWORD dwMemory[4096] = { 0 };	// Defines the data memory
	//DWORD dwControl[4096] = { 0 };	// Defines the controller memory

	void CheckStatus();
	void CheckStatus(std::string _errorMsg);

	
};