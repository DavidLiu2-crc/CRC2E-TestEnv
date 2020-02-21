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
	AnokiMemory(unsigned long _cardFreq, char _channelWidth) {
		// Check if the input frequency is reasonably bounded by 100MHz
		//_cardFreq > 1e8 ? cardFrequency = unsigned int(100000000): cardFrequency = _cardFreq;

		// Calculate number of steps to delay for PAA point calculation
		float delay_PAAPointTime = 12e-6;
		numStepsPAADelay = unsigned int( ceil(delay_PAAPointTime * _cardFreq) );

		// Calculate number of steps to delay for PXA scanning.
		float delay_PXAScanTime = 15e-6;
		numStepsScanDelay = unsigned int( ceil(delay_PXAScanTime * _cardFreq) );

		// Assume all channels used
		channelWidth = _channelWidth;
	}


	// --- Begin definition user-defined functions ---------------

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
	
	void generateCommandSequenceFromFile(unsigned int _beamMode, unsigned short _freq);

	// Adds an anokiObj to nVectorOBJ
	void set_CurrentCommand(AnokiObj anokiObj);
	// Set all the commands to include the clock bit in its step (Double length)
	void set_CreateClockFlag(bool _flagClock);

	// Get length of command sequence
	unsigned long get_numberOfSteps();
	// Get length of command sequence
	unsigned long* get_pcmdComm();
	// Get length of control sequence
	unsigned long* get_pcmdCtrl();
	// Opens and writes the local memory heap array into ASC
	void exportMemoryToASCII();
	// Opens and writes the command log into txt file
	void exportMemoryToReadable();
	// Reads the memory channel and adds to the 
	void maskedReadMemory();
	// Displays a subsegment of the command sequence binary steps of a certain length from 0
	void showAnokiCommandSequence(unsigned int _len);

private:
	// --- Define initial conditions of Anokiwave Antenna configuration ----------------------------------------------------
	AnokiCommand anokiCMD;					// AnokiCommand Handler to create AnokiObj easily
	unsigned int paramBeamMode = false;		// Beam Mode: 0, 1, 2, 3
	bool paramBeamEnable = false;			// Beam Enable: true:Enable, false:Disable
	unsigned int paramFrequency = 28000;	// Beam Frequency: [27500 - 30000]
	bool flag_genClock = false;	// Flag for two step if creating own clock implementation

	// --- Define object containers ----------------------------------------------------------------------------------------
	std::vector< AnokiObj > nVectorAnokiOBJ;					// Vector containing AnokiObj
	std::vector< std::vector <float> > nVectorAnokiHead;		// Vector containing csv Header information
	std::vector< std::vector <float> > nVectorANGLE;			// Vector containing values of each line
	std::vector< unsigned int > nVectorINDEX;					// Vector containing the indexes of corresponding command
	std::vector< std::vector<unsigned char> > nVectorReadByte;	// Vector containing the byte information during read back

	// --- Define local memory heap for data memory and data control ------------------------------------------------------
	unsigned long maxCommandSequence = 10000000; // Index counter for max number of command sequences to traverse
	unsigned long commandSequenceIndex = 0; // Index counter for where commandSequenceIndex is located currently
	unsigned long controlSequenceIndex = 0; // Index counter for where controlSequenceIndex is located currently
	//std::array< unsigned long, 10000000> commandSequence = { 0 };	// Heap array declaration for commandSequence
	unsigned long* commandSequence = new unsigned long[10000000];	// Heap declaration for commandSequence
	//std::array< unsigned long, 10000000> controlSequence = { 0 };	// Heap array declaration for controlSequence
	unsigned long* controlSequence = new unsigned long[10000000];	// Heap declaration for controlSequence

	//unsigned int cardFrequency;		// Operating card frequency of the object to delay for
	unsigned int numStepsPAADelay = 0;	// Number of steps for PAA calculation delay
	unsigned int numStepsStrobeBit = 10;// Number of steps for Strobe high
	unsigned int numStepsScanDelay = 0; // Number of steps for PXA scan time

	std::string pnInputFilename = " ";	// Relative path of the input angle CSV file
	bool nInputCSVFileRead = false;			// Flag for input file read into memory

	std::string pnOutputASCIIFile = " ";	// Relative path of the output ASCII file
	bool nOutputASCFileRead = false;		// Flag for output file written

	std::string pnOutputTXTFile = " ";	// Relative path of the output ASCII file
	bool nOutputTXTFileRead = false;		// Flag for output file written

	// TODO: Implement variable heap size definition to allow larger sweep patterns
	unsigned char channelWidth;	// Defines the channel width. 0:32 bit, 1:16 bit, 2:8 bit, 3:4 bit, 4:2 bit, 5:1 bit

	// --- Declare private function --------------------------------------------------------------------------------------
	// Adds calls the PAA command with each line of angle values
	void cmd_steerAngle();
	// Adds the enable beam call to nVectorAnokiOBJ
	void cmd_StartBeam(unsigned int _beamMode, unsigned short _freq);
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

	void tryOpeningFile();
	
};
