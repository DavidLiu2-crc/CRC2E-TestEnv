/**
	File name: AnokiAPI.cpp

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

*/
#pragma once

// Include corresponding header file
#include "..\include\AnokiAPI.h"


// ---------------- DEFINE BASIC COMMANDS ----------------
void AnokiAPI::cmd_readFromCSV(char* pnInputFile) {
	
	// Copy the csv input file name
	pnInputFilename = std::string(pnInputFile);
	pnInputFilename = pnInputFilename.substr(0, pnInputFilename.find('.'));

	std::ifstream file;
	// --- Try and catch file opening exception --------------------------------
	try {
		file.open(pnInputFile, std::ios::in);

	} catch(std::ios_base::failure& e) {
		std::cout << "Exception: " << e.code() << " gave " << e.what() << "\n";
		nInputCSVFileRead = false;
	}
	std::string line = "";

	// --- Read through each line of the file while possible --------------------
	while (std::getline(file, line)) {

		// Set up vector placeholder for numbers in current line
		std::vector<float> angleLine;
		// Find the first comma splice
		std::size_t commaIndex = line.find(',');
		
		// Parse any number of values more that 2 columns
		while (commaIndex != std::string::npos) {
			// Grab the digits in the first number up to comma
			std::string strNum = line.substr(0, commaIndex);
			// Remove digts from character string
			line = line.erase(0, commaIndex + 1);
			commaIndex = line.find(',');
			// Append the digits as a float to vector placeholder
			angleLine.push_back(std::stof(strNum));
		}
		// Parse the remaining string as a number
		std::string strNum = line;
		// Append the last digit as a float to vector placeholder
		angleLine.push_back(std::stof(strNum));

		// (Debugging) Check the values 
		//std::cout << strNum.c_str() << "\n";
		//std::cout << angleLine.size() << "\n";

		// Append each line of values to nVectorANGLE
		nVectorANGLE.push_back(angleLine);
	}

	// Add try catch block here if no nVectorANGLE were read from csv
	// Like opening csv file, but no commas were found to seperate them

	// --- Remove the header information ----------------------------------------------
	unsigned int numberHeaderLines = 3;
	for (unsigned int i = 0; i < numberHeaderLines; i++) {
		nVectorAnokiHead.push_back( nVectorANGLE.at(i) );
	}
	nVectorANGLE.erase(nVectorANGLE.begin(), nVectorANGLE.begin()+numberHeaderLines);

	// Tells other functions that the csv file was read and to proceed
	nInputCSVFileRead = true;
	// Close the file handler / opens up the file for other processes.
	file.close();

	//show_message("Importing angles from CSV file", pnInputFilename);
	std::cout << "AnokiAPI: Importing angle CSV File : " << pnInputFile << "\n";
}

void AnokiAPI::cmd_generateCommandSequenceFromFile(unsigned int _beamMode, unsigned short _freq) {

	// --- Generate a sequence of objects defining the commands to send --------------------------
	// Start the connection on the anokiwave with a beam mode and frequency
	cmd_StartBeam(_beamMode, _freq);
	// Read the angles to generate an anokiObj that contains the command information
	cmd_steerAngle();
	// End the connection to the anokiwave
	cmd_EndBeam();

	convertObjToASCII();

}

void AnokiAPI::cmd_maskedReadMemory() {

	// How many byte segments to read
	size_t numReadSegments = nVectorINDEX.size();

	for (unsigned int index = 1; index < numReadSegments; index++) {
		// How many bytes to read depends on last anokiobj.readLength
		unsigned char readLength = nVectorAnokiOBJ.at(index - 1).get_CmdReadLength();
		unsigned int indexToRead = nVectorINDEX.at(index) + 8;
		std::vector<unsigned char> readSequence;

		// Iterate through expected byte length
		for (unsigned char j = 0; j < readLength; j++) {
			// Mask through each 8 bit at each index
			unsigned char byte = 0;
			unsigned char maskByte = 0x80;
			for (unsigned char k = 0; k < 8; k++) {
				unsigned char currentStep = commandSequence[indexToRead] & 0x00000004;
				currentStep == 0x04 ? byte + maskByte : byte;
				maskByte = maskByte >> 1;
			}
			readSequence.push_back(byte);
		}

		// Check the acknowledgement of the response
		bool responseACK = false;
		responseACK = anokiCMD.read_commandResponse(readSequence.data(), readLength, nVectorAnokiOBJ.at(index - 1));
		if (!responseACK) {
			counter_NAK++;
		}

		nVectorReadByte.push_back(readSequence);
	}


}

void AnokiAPI::export_MemoryToASCII() {
	// Copy the ASC output file name
	pnOutputASCIIFile = pnInputFilename + ".asc";

	std::ofstream ascFile;
	ascFile.open(pnOutputASCIIFile, std::ios::out);

	// For every line in command sequence
	for (unsigned int i = 0; i < commandSequenceIndex; i++) {

		unsigned char line = commandSequence[i];
		unsigned char maskbyte = 0x10;

		ascFile << std::string(27, '0');

		for (unsigned char i = 0; i < 5; i++) {
			bool showBit = maskbyte & line;
			ascFile << showBit ? 1 : 0;
			maskbyte = maskbyte >> 1;
		}
		ascFile << "\n";
	}

	ascFile.close();
	std::cout << "AnokiAPI: Exporting memory : " << pnOutputASCIIFile << "\n";
}

void AnokiAPI::export_MemoryToReadable() {
	// Copy the txt output file name
	pnOutputTXTFile = pnInputFilename + ".txt";

	std::ofstream txtFile;
	txtFile.open(pnOutputTXTFile, std::ios::out);

	// For every line in command sequence
	size_t numberOfCommands = nVectorAnokiOBJ.size();
	for (unsigned int i = 0; i < numberOfCommands; i++) {

		std::string currentCommand = nVectorAnokiOBJ.at(i).get_CmdLog();
		unsigned int currentIndex = nVectorINDEX.at(i);

		txtFile << "Step " << currentIndex << "\tCMD: " << currentCommand << "\n";
	}

	txtFile.close();
	std::cout << "AnokiAPI: Exporting command log : " << pnOutputTXTFile << "\n";
}

void AnokiAPI::export_ReadMemoryHEXSequence() {
	// Copy the txt output file name
	std::string pnReadbackTXTFile = pnInputFilename + "_read.txt";

	std::ofstream txtFile;
	txtFile.open(pnReadbackTXTFile, std::ios::out);

	// For every line in command sequence
	size_t numberOfCommands = nVectorReadByte.size();
	for (unsigned int i = 0; i < numberOfCommands; i++) {
		
		// For every byte in responded line
		for (size_t j = 0; j < nVectorReadByte.at(i).size(); j++) {
			txtFile << nVectorReadByte.at(i).at(j);
		}
		txtFile << "\n";
	}

	txtFile.close();
	std::cout << "AnokiAPI: Exporting command log : " << pnReadbackTXTFile << "\n";
}
// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------
void AnokiAPI::set_CurrentCommand(AnokiObj anokiObj) {
	nVectorAnokiOBJ.push_back(anokiObj);
}

void AnokiAPI::set_CreateClockFlag(bool _flagClock) {
	flag_genClock = _flagClock;
	anokiCMD.set_generateClock(_flagClock);
}

// ---------------- DEFINE GET PARAMETER FUNCTIONS ---------
unsigned long AnokiAPI::get_numberOfSteps() {
	// Equivalent to number of steps so far
	return commandSequenceIndex;
}

unsigned char* AnokiAPI::get_commandPointer() {
	return commandSequence;
	//return commandSequence.data();
}

unsigned char* AnokiAPI::get_controlPointer() {
	return controlSequence;
	//return controlSequence.data();
}

// ---------------- DEFINE READ PARAMETER FUNCTIONS ---------


void AnokiAPI::show_AnokiCommandSequence(unsigned int _len) {
	for (unsigned int index = 0; index < _len; index++) {
		unsigned char maskByte = 0x80;
		/*for (unsigned int i = 0; i < 8; i++) {
			bool showBit = (commandSequenceIndex + index) & maskByte;

			std::cout << showBit;

			maskByte = maskByte >> 1;
		}

		std::cout << "\n";*/

	}
}


// ---------------- DEFINE PRIVATE PARAMETER FUNCTIONS ---------

/// <summary>
/// Calls cmd PAA point for each line in nVectorHeader. Will check the <c>nInputFileRead</c> flag before proceeding
/// </summary>
/// <example><code>
/// cmd_readFromCSV('anglePoint.csv');
/// if (nInputFileRead) {
///     cmd_CallSteerFromFile();
/// }
/// </code></example>
void AnokiAPI::cmd_steerAngle() {

	// Check if csv has already been read first before proceeding
	if (!nInputCSVFileRead) {
		std::cout << "CSV file not previously read before calling this function...";
		return;
	}

	// Get the number of lines of angles to sweep
	size_t numCommandObjects = nVectorANGLE.size();
	for (unsigned int i = 0; i < numCommandObjects; i++) {

		// TODO: Add support for 3 column file with theta, phi, frequency if necessary.
		if (nVectorANGLE.at(i).size() > 2) {
			//paramFrequency = nVectorANGLE[i,2];
			paramFrequency = nVectorANGLE.at(i).at(2);
		}
		// Otherwise, in all cases
		// Grab the corresponding line of float values in temp placeholders
		float theta, phi;
		//theta = nVectorANGLE[i,0];
		//phi   = nVectorANGLE[i,1];
		theta = nVectorANGLE.at(i).at(0);
		phi = nVectorANGLE.at(i).at(1);

		// Point the anokiwave phased array antenna
		anokiCMD.set_PointingFreq(paramFrequency);
		anokiCMD.set_PointingAngle(theta, phi);

		// Append the anokiObj containing pointing command information to nVectorAnokiOBJ
		nVectorAnokiOBJ.push_back( anokiCMD.cmd_PAAPointingCommand() );
	}

	std::cout << "AnokiAPI: Each line of angles converted to AnokiObj.\n" ;
}

/// <summary>
/// Calls Enable Beam and PAA point toward normal before beginning sweep.
/// </summary>
/// <param name="_beamMode"> Unsigned int value between 0, 1, 2, 3</param>
/// <param name="_freq"> Unsigned int value denoting PAA frequency set between [27500 - 30000] MHz </param>
void AnokiAPI::cmd_StartBeam(unsigned int _beamMode, unsigned int _freq) {
	
	// Send the command to enable the beam
	anokiCMD.set_enableBeam(true);
	set_CurrentCommand( anokiCMD.cmd_EnableBeam() );

	// Send the command to point from the normal
	anokiCMD.set_modeTXRX(0);
	paramBeamMode = _beamMode;
	anokiCMD.set_beamMode(_beamMode);
	paramFrequency = _freq;
	anokiCMD.set_PointingFreq(_freq);
	//anokiCMD.set_PointingAngle(60.0235, 288.0934);
	anokiCMD.set_PointingAngle(0, 0);
	set_CurrentCommand( anokiCMD.cmd_PAAPointingCommand() );

}

void AnokiAPI::cmd_EndBeam() {

	// Send the command to disable the beam
	anokiCMD.set_enableBeam(false);
	set_CurrentCommand( anokiCMD.cmd_EnableBeam() );
}


void AnokiAPI::convertObjToASCII() {

	//for (unsigned int i = 0; i < maxCommandSequence; i++) {
	//	commandSequence[i] = 0x08;
	//}

	// Scan through each Anoki object
	size_t numberVectorObj = nVectorAnokiOBJ.size();
	// First object probably is the Enable beam command
	addIndexObjToCommandSequence(0);
	addIndexObjToCommandSequence(1);
	addSteerTiming();

	// Iterate through from 3rd index to second last index
	// BIG ASSUMPTION: cmd_StartBeam and cmd_EndBeam wraps this function call
	for (unsigned int i = 2; i < numberVectorObj - 1; i++) {
		addIndexObjToCommandSequence(i);
		addSteerTiming();
	}

	// Last object probably is the disable beam command
	addIndexObjToCommandSequence(numberVectorObj-1);

	// Clear the step to set all
	commandSequence[commandSequenceIndex] = 0x08;
	commandSequenceIndex++;

	for (unsigned int i = 0; i < commandSequenceIndex; i++) {
		controlSequence[i] = 0x00000004;
	}

	// Show the user how many angles and steps were processed
	std::cout << "AnokiAPI: Number of angles commanded: " << numberVectorObj << "\n";
	std::cout << "AnokiAPI: Number of steps processed: " << commandSequenceIndex-3 << "\n";
}

void AnokiAPI::addIndexObjToCommandSequence(int _index) {

	// TODO: Learn to throw exception here
	// Leak memory protection
	if ((commandSequenceIndex + 1000) > maxCommandSequence) {
		throw std::exception( "Risk of memory leak. Will not add to command sequence.\n" );
		return;
	}

	// number of start bits to write
	unsigned char numStartBit = 5;
	// number of end bits to write
	unsigned char numEndBit = 5;
	// set the bit format for holding steps
	unsigned char holdStep = 0x08;

	// Append the corresponding commandSequenceIndex of this _index to nVectorIndex
	nVectorINDEX.push_back(commandSequenceIndex);

	// Add the starting byte
	addDelayStep(numStartBit, holdStep);

	// --- Copy the command sequence to message memory -------------------------------
	unsigned int numBitsCopied = 0;
	nVectorAnokiOBJ.at(_index).cmd_memcpy(&commandSequence[commandSequenceIndex], &numBitsCopied);
	commandSequenceIndex = commandSequenceIndex + numBitsCopied;
	
	
	// Add the ending byte
	addDelayStep(numEndBit, holdStep);
}

// Iterates the cmdseq index counter 
void AnokiAPI::addDelayStep(unsigned int _numSteps, unsigned char stepValue) {

	// Set the value of the next _numSteps as stepValue
	for (unsigned int i = 0; i < _numSteps; i++) {
		commandSequence[commandSequenceIndex] = stepValue;
		commandSequenceIndex++;
	}
	//cmd_memcpy_s(&commandSequence[commandSequenceIndex], _numSteps*4, message, _numSteps*4);
	//memset(&commandSequence[commandSequenceIndex], unsigned int(stepValue), _numSteps);
	//commandSequenceIndex = commandSequenceIndex + _numSteps*4;
}

void AnokiAPI::addSteerTiming() {
	// Add delay time for PAA calculation
	addDelayStep(numStepsPAADelay, 0x08);
	// Add delay time for strobe set
	addDelayStep(numStepsStrobeBit, 0x18);
	// Add delay time for PXA scanning block time
	addDelayStep(numStepsScanDelay, 0x08);
}

void AnokiAPI::show_message(std::string message) {
	std::cout << "AnokiAPI: " << message.c_str() << "\n";
}

void AnokiAPI::show_message(std::string message, char* message2) {
	std::cout << "AnokiAPI: " << message.c_str() << " " << message2 << "\n";
}

void AnokiAPI::show_message(char* message1, char* message2) {
	std::cout << "AnokiAPI: " << message1 << "  " << message2 << "\n";
}

void AnokiAPI::clearMemoryHeap() {
	for (unsigned long i = 0; i < maxCommandSequence; i++) {
		// Set each value to zero instead of indeterminate state
		commandSequence[i] = 0;
		controlSequence[i] = 0;
	}
}

void AnokiAPI::tryOpeningFile(std::string fileName, int fileMode) {
	std::ifstream file;
	// --- Try and catch file opening exception --------------------------------
	try {
		file.open(fileName, fileMode);
	}
	catch (std::ios_base::failure & e) {
		std::cout << "Exception: " << e.code() << " gave " << e.what() << "\n";;
	}
}


