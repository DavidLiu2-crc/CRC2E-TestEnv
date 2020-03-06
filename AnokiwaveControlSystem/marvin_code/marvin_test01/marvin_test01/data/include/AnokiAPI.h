/**
	File name: AnokiAPI.h

	Summary: User defined class that returns a AnokiObj object that contains command control information
			 and memory storage, referenced in Anokiwave ECCN: 5E991

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Description: Simply initialize this class, calling set_ functions to set the values of parameters, and call cmd_
				 to obtain the AnokiObj that contains the command information. Currently allows writing command byte,
				 will attempt to implement read command byte capabilities later.

	Usage:  1. Create an object variable of type AnokiCommand. Use constructor AnokiCommand xxxAnoki(true) to
			2. Use AnokiCommand.set_**** functions to set the configuration of the PAA
			3. Use AnokiCommand.cmd_**** functions to return an AnokiObj containing all the command information

			4. Use the AnokiObj.cmd_memcpy() function to copy the equivalent memory into a heap array to be loaded into Marvin Card

	Specifics: Theta resolution of 0.0219 degrees. Phi resolution of 0.08789 degrees. Frequency in 1Mhz increments.
			   Max array size is set to 500000 steps, for 25x25 angles, 100MHz, 27uS dwell time. Adjust if necessary if out of stack
*/
#pragma once

#include <iostream>
#include <fstream>
#include <sstream>
#include <exception>
#include <string>
#include <array>
#include <vector>
#include <cmath>

//#include "AnokiObj.h"
#include "AnokiCommand.h"


class AnokiAPI {

public:
	// ---------------------------------------------------
	// Proper indexing types depending on length of command sequence
	// unsigned char:		[0 - 255 ff]
	// unsigned short:		[0 - 65 535 ffff]
	// unsigned int:		[0 - 4 294 967 295 ffff ffff]
	// unsigned long long:	[0 - 18 446 744 073 709 551 615 ffff ffff ffff ffff]

	// float : 3.4E+- 38
	// double: 1.7E+- 308
	// ---------------------------------------------------

	// ------ Constructor ----------------------------------------
	AnokiAPI(unsigned long _cardFreq) {
		// Use card frequency to set the dwell time for PAA pointing
		float delay_PAAPointTime = (float)0.0000012;
		numStepsPAADelay = unsigned int(ceil(delay_PAAPointTime * _cardFreq));

		// Calculate number of steps to delay for PXA scanning.
		float delay_PXAScanTime = (float)0.0000015;
		numStepsScanDelay = unsigned int(ceil(delay_PXAScanTime * _cardFreq));

		clearMemoryHeap();
		// Nothing else happens when constructed
	}


	// ---------------- DEFINE BASIC COMMANDS ----------------
	/// <summary>
	/// Opens the .csv file and adds the angles into a (m x n) matrix. Assumes csv file contain 2 column theta, phi values.
	/// <para>
	/// Checks if the file refered to by <c>pnInputCSVFile</c> can be opened. If not throw an exception
	/// Iterates through each line, adding all the characters as float values, then appending to <c>nVectorAngle</c>.
	/// Sets the <c>nInputFileRead</c> flag as true.
	/// </para>
	/// </summary>
	/// <param name="pnInputCSVFile"> Pointer to a character array refering to the (relative) file path.</param>
	/// <returns>None
	/// <para> - Does set nVectorANGLE, nInputFileRead to appropriate values</para></returns>
	/// <example><code>
	/// char filePath = 'anglePoint.csv';
	/// cmd_readFromCSV( filePath );
	/// </code></example>
	int cmd_readFromCSV(char* pnInputCSVFile);

	/// <summary>
	/// Group function caller fills nVectorAnokiObj with objects containing Anokiwave Commands and copies to local memory heap
	/// </summary>
	/// <param name="_beamMode">unsigned int that denotes the beam mode 0, 1, 2, 3</param>
	/// <param name="_freq">unsigned short that denotes the center frequency of the PAA to point/TX at</param>
	void cmd_generateCommandSequenceFromFile(unsigned int _beamMode, unsigned short _freq);

	// Reads the memory channel and adds to the nVectorReadByte vector storage
	void cmd_maskedReadMemory();

	/// <summary>
	/// Opens and writes the local memory heap array into ASC
	/// </summary>
	void export_MemoryToASCII();

	/// <summary>
	/// Opens and writes the command log into txt file
	/// </summary>
	void export_MemoryToReadable();

	void export_ReadMemoryHEXSequence();

	// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

	/// <summary>
	/// Adds an anokiObj to nVectorAnokiOBJ
	/// </summary>
	/// <param name="anokiObj">Returned AnokiObj from AnokiCommand with command information</param>
	void set_CurrentCommand(AnokiObj anokiObj);
	/// <summary>
	/// Set all the commands to include the clock bit in its step (Double length)
	/// </summary>
	/// <param name="_flagClock">Boolean flag that tells the AnokiObj to generate clock sequence at each step</param>
	void set_CreateClockFlag(bool _flagClock);

	// ---------------- DEFINE GET PARAMETER FUNCTIONS ---------

	// Get length of command sequence
	unsigned long get_numberOfSteps();
	// Get length of command sequence
	unsigned char* get_commandPointer();
	// Get length of control sequence
	unsigned char* get_controlPointer();

	// ---------------- DEFINE READ PARAMETER FUNCTIONS ---------
	// Displays a subsegment of the command sequence binary steps of a certain length from 0
	void show_AnokiCommandSequence(unsigned int _len);

private:
	// ---------------- DEFINE INITIAL CONDITIONS OF ANOKIWAVE ANTENNA CONFIGURATION ---------
	AnokiCommand anokiCMD;					// AnokiCommand Handler to create AnokiObj easily
	unsigned int paramBeamMode = false;		// Beam Mode: 0, 1, 2, 3
	bool paramBeamEnable = false;			// Beam Enable: true:Enable, false:Disable
	unsigned int paramFrequency = 28000;	// Beam Frequency: [27500 - 30000]
	bool flag_genClock = false;	// Flag for two step if creating own clock implementation

	// ---------------- DEFINE OBJECT ATTRIBUTES PARAMETER  ------------------
	std::vector< AnokiObj > nVectorAnokiOBJ;					// Vector containing AnokiObj
	std::vector< std::vector <float> > nVectorAnokiHead;		// Vector containing csv Header information
	std::vector< std::vector <float> > nVectorANGLE;			// Vector containing values of each line
	std::vector< unsigned int > nVectorINDEX;					// Vector containing the indexes of corresponding command
	std::vector< std::vector<unsigned char> > nVectorReadByte;	// Vector containing the byte information during read back
	unsigned int counter_NAK = 0;

	// ---------------- DEFINE LOCAL MEMORY HEAP FOR DATA MEMORY AND DATA CONTROL  ------------------
	unsigned long commandSequenceIndex = 0; // Index counter for where commandSequenceIndex is located currently
	unsigned long controlSequenceIndex = 0; // Index counter for where controlSequenceIndex is located currently
	unsigned long maxCommandSequence = 500000; // Index counter for max number of command sequences to traverse
	//std::array< unsigned long, 10000000> commandSequence = { 0 };	// Heap array declaration for commandSequence
	unsigned char* commandSequence = new unsigned char[maxCommandSequence];	// Heap declaration for commandSequence
	//std::array< unsigned long, 10000000> controlSequence = { 0 };	// Heap array declaration for controlSequence
	unsigned char* controlSequence = new unsigned char[maxCommandSequence];	// Heap declaration for controlSequence

	//unsigned int cardFrequency;		// Operating card frequency of the object to delay for
	unsigned int numStepsPAADelay = 0;	// Number of steps for PAA calculation delay
	unsigned int numStepsStrobeBit = 10;// Number of steps for Strobe high
	unsigned int numStepsScanDelay = 0; // Number of steps for PXA scan time

	// ---------------- DEFINE FILE HANDLING PARAMETER  ------------------

	std::string pnInputFilename = " ";	// Relative path of the input angle CSV file
	bool nInputCSVFileRead = false;			// Flag for input file read into memory

	std::string pnOutputASCIIFile = " ";	// Relative path of the output ASCII file
	bool nOutputASCFileRead = false;		// Flag for output file written

	std::string pnOutputTXTFile = " ";	// Relative path of the output ASCII file
	bool nOutputTXTFileRead = false;		// Flag for output file written

	// TODO: Implement variable heap size definition to allow larger sweep patterns
	unsigned char channelWidth;	// Defines the channel width. 0:32 bit, 1:16 bit, 2:8 bit, 3:4 bit, 4:2 bit, 5:1 bit

	// ---------------- DEFINE PRIVATE PARAMETER FUNCTIONS ---------
	// Adds calls the PAA command with each line of angle values
	void cmd_steerAngle();
	// Adds the enable beam call to nVectorAnokiOBJ
	void cmd_StartBeam(unsigned int _beamMode, unsigned int _freq);
	// Adds the disable beam call to nVectorAnokiOBJ
	void cmd_EndBeam();
	// Larger function that converts the csv file to raw binary steps
	void convertObjToASCII();
	// Transposes the command sequence to binary steps
	void addIndexObjToCommandSequence(int _index);
	// Appends empty steps to the end of a binary steps to account for delayTime
	void addDelayStep(unsigned int _numSteps, unsigned char stepValue);
	// Append appropriate number of steps for PAA point steering timing
	void addSteerTiming();

	void clearMemoryHeap();

	void tryOpeningFile(std::string fileName, int fileMode);
	
};
