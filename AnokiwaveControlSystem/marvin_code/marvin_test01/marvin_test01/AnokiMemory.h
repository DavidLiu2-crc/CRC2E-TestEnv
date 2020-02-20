#pragma once

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <cmath>

//#include "AnokiObj.h"
#include "AnokiCommand.h"

class AnokiMemory {

public:
	// Command Object to assign the attributes and create the command object
	AnokiCommand anokiCMD;
	std::vector< AnokiObj > nVectorAnokiOBJ;			// Vector that stores AnokiObj objects
	std::vector< std::vector< float > > nVectorANGLE;	// Vector that stores the angles to sweep
	std::vector< std::vector< float > > nVectorHeader;	// Vector that stores the header information of the csv file
	std::vector< unsigned int >			nVectorINDEX;	// Vector that stores the index of the corresponding command sequence

	unsigned int paramFrequency = 28000;	// Parameter for the PAA frequency [27500 - 30000];
	unsigned int paramBeamMode = 0;			// Parameter for the Beam Mode| 0:Mode 0, 1:Mode 1, 2:Mode 2, 3:Mode 4
	
	// ---------------------------------------------------
	// Proper indexing types depending on length of command sequence
	// unsigned char:	[0 - 255 ff]
	// unsigned short:	[0 - 65 535 ffff]
	// unsigned int:	[0 - 4 294 967 295 ffffff]
	// unsigned long long:[0 - 18 446 744 073 709 551 615 ffffffff]

	// float : 3.4E+- 38
	// double: 1.7E+- 308
	// ---------------------------------------------------

	char channelWidth;

	unsigned int maxCommandSequence = 10000000; // Index counter for max number of command sequences to traverse
	unsigned int commandSequenceIndex = 0; // Index counter for where commandSequenceIndex is located currently
	unsigned int controlSequneceIndex = 0; // Index counter for where controlSequenceIndex is located currently
	unsigned int* commandSequence = new unsigned int[10000000];	// Heap declaration for commandSequence
	unsigned int* controlSequence = new unsigned int[10000000];	// Heap declaration for controlSequence
	
	//unsigned int cardFrequency;// Operating card frequency of the object to delay for
	
	unsigned int numStepsPAADelay = 0;	// Number of steps for PAA calculation delay
	unsigned int numStepsStrobeBit = 10;// Number of steps for Strobe high
	unsigned int numStepsScanDelay = 0; // Number of steps for PXA scan time

	char* pnInputCSVFile;		// Relative path of the input angle CSV file
	bool nInputFileRead = false;// Flag for input file read into memory

	char* pnOutputASCIIFile;		// Relative path of the output ASCII file
	bool nOutputFileRead = false;// Flag for output file written

	bool flag_genClock = false;	// Flag for two step if creating own clock implementation

	// General constructor
	AnokiMemory() {
		// Set the card frequency 
		//cardFrequency = 1000000;
		numStepsPAADelay = 20;
		numStepsScanDelay = 20;
		// Assume all channels used
		channelWidth = 32;
		// Nothing else happens when constructed
	}
	// Constructor if card operating frequency passed as argument
	AnokiMemory(unsigned int _cardFreq, char _channelWidth) {
		// Check if the input frequency is reasonably bounded by 100MHz
		//_cardFreq > 1e8 ? cardFrequency = unsigned int(100000000): cardFrequency = _cardFreq;

		// Calculate number of steps to delay for PAA point calculation
		float delay_PAAPointTime = 12e-6;
		numStepsPAADelay = unsigned int( ceil(delay_PAAPointTime * _cardFreq) );

		// Calculate number of steps to delay for PXA scanning.
		float delay_PXAScanTime = 15e-6;
		numStepsScanDelay = unsigned int( ceil(delay_PXAScanTime * _cardFreq) );

		// Set the channel width 
		
	}


	// --- Begin definition user-defined functions

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
	/// <para> -Does set nVectorANGLE, nInputFileRead to appropriate values</para></returns>
	/// <example><code>
	/// char filePath = 'anglePoint.csv';
	/// readFromCSV( filePath );
	/// </code></example>
	void readFromCSV(char* pnInputCSVFile);
	// Adds calls the PAA command with each line of angle values
	void cmd_steerAngle();
	// Adds an anokiObj to nVectorOBJ
	void set_CurrentCommand(AnokiObj anokiObj);
	// Adds the enable beam call to nVectorAnokiOBJ
	void cmd_StartBeam(unsigned int _beamMode, unsigned short _freq);
	// Adds the disable beam call to nVectorAnokiOBJ
	void cmd_EndBeam();
	// Larger function that converts the csv file to raw binary steps
	void generateCommandSequenceFromFile();
	// Transposes the command sequence to binary steps
	void addIndexObjToCommandSequence(int _index);
	// Appends empty steps to the end of a binary steps to account for delayTime
	void addDelayStep(unsigned int _numSteps, unsigned char stepValue);
	// Append appropriate number of steps for PAA point steering timing
	void addSteerTiming();
	// Set all the commands to include the clock bit in its step (Double length)
	void set_CreateClockFlag(bool _flagClock);

	void exportMemoryToASCII();
	void exportMemoryToReadable();

	// Displays a subsegment of the command sequence binary steps of a certain length from 0
	void showAnokiCommandSequence(unsigned int _len);
};
