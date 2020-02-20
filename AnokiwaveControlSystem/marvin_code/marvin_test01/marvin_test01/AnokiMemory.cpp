#pragma once

#include "AnokiMemory.h"



void AnokiMemory::readFromCSV(char* pnInputCSVFile) {
	
	std::ifstream file;
	// Try and catch file opening exception
	try {
		file.open(pnInputCSVFile);

	} catch(std::ios_base::failure e) {
		nInputFileRead = false;
	}
	std::string line = "";

	// Read through each line of the file while possible
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

	// Remove the header information
	nVectorHeader.push_back(nVectorANGLE[0]);
	nVectorHeader.push_back(nVectorANGLE[1]);
	nVectorHeader.push_back(nVectorANGLE[2]);
	nVectorANGLE.erase(nVectorANGLE.begin(), nVectorANGLE.begin()+3);

	// Tells other functions that the csv file was read and to proceed
	nInputFileRead = true;
	// Close the file handler / opens up the file for other processes.
	file.close();

	std::cout << "AnokiMemory: CSV File angle input read.\n";
}

void AnokiMemory::set_CurrentCommand(AnokiObj anokiObj) {
	nVectorAnokiOBJ.push_back(anokiObj);
}

/// <summary>
/// Calls cmd PAA point for each line in nVectorHeader. Will check the <c>nInputFileRead</c> flag before proceeding
/// </summary>
/// <example><code>
/// readFromCSV('anglePoint.csv');
/// if (nInputFileRead) {
///     cmd_CallSteerFromFile();
/// }
/// </code></example>
void AnokiMemory::cmd_steerAngle() {

	// Check if csv has already been read first before proceeding
	if (!nInputFileRead) {
		std::cout << "CSV file not previously read before calling this function...";
		return;
	}

	// Get the number of lines of angles to sweep
	size_t numCommandObjects = nVectorANGLE.size();
	for (unsigned int i = 0; i < numCommandObjects; i++) {
		// Grab the corresponding line of float values in temp placeholders
		float theta, phi;
		theta = nVectorANGLE[i][0];
		phi = nVectorANGLE[i][1];

		// Currently supports CSV file with 2 columns
		// TODO: Add support for 3 column file with theta, phi, frequency if necessary.

		// Point the anokiwave phased array antenna
		anokiCMD.set_PointingFreq(paramFrequency);
		anokiCMD.set_PointingAngle(theta, phi);

		// Append the anokiObj containing pointing command information to nVectorAnokiOBJ
		nVectorAnokiOBJ.push_back(anokiCMD.cmd_PAAPointingCommand());
	}

	std::cout << "AnokiMemory: Each line of angles converted to AnokiObj.\n" ;
}

/// <summary>
/// Calls Enable Beam and PAA point toward normal before beginning sweep.
/// </summary>
/// <param name="_beamMode"> Unsigned int value between 0, 1, 2, 3</param>
/// <param name="_freq"> Unsigned int value denoting PAA frequency set between [27500 - 30000] MHz </param>
void AnokiMemory::cmd_StartBeam(unsigned int _beamMode, unsigned short _freq) {
	
	// Send the command to enable the beam
	anokiCMD.set_enableBeam(true);
	set_CurrentCommand( anokiCMD.cmd_EnableBeam() );

	// Send the command to point from the normal
	anokiCMD.set_modeTXRX(0);
	paramBeamMode = _beamMode;
	anokiCMD.set_beamMode(_beamMode);
	paramFrequency = _freq;
	anokiCMD.set_PointingFreq(_freq);
	anokiCMD.set_PointingAngle(60.0235, 288.0934);
	set_CurrentCommand( anokiCMD.cmd_PAAPointingCommand() );

}

void AnokiMemory::cmd_EndBeam() {

	// Send the command to disable the beam
	anokiCMD.set_enableBeam(false);
	set_CurrentCommand( anokiCMD.cmd_EnableBeam() );
}

void AnokiMemory::generateCommandSequenceFromFile() {

	//for (unsigned int i = 0; i < maxCommandSequence; i++) {
	//	commandSequence[i] = 0x08;
	//}

	// Scan through each Anoki object
	size_t numberVectorObj = nVectorAnokiOBJ.size();
	// First object probably is the Enable beam command
	addIndexObjToCommandSequence(0);
	addIndexObjToCommandSequence(1);
	addSteerTiming();

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
	std::cout << "AnokiMemory: Number of angles commanded: " << numberVectorObj << "\n";
	std::cout << "AnokiMemory: Number of steps processed: " << commandSequenceIndex-3 << "\n";
}

void AnokiMemory::addIndexObjToCommandSequence(int _index) {

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
	
	// Get the number of bits in command sequence to copy from corresponding anoki obj
	rsize_t numBitsToCopy = nVectorAnokiOBJ[_index].getCmdSendLength() * 8;
	numBitsToCopy = flag_genClock ? numBitsToCopy * 2 : numBitsToCopy;
	unsigned char* pnCMDMemory = nVectorAnokiOBJ[_index].getCmdRaw();

	// Memory copy directly
	for (unsigned char i = 0; i < numBitsToCopy; i++) {
		commandSequence[commandSequenceIndex] = pnCMDMemory[i];
		commandSequenceIndex++;
	}
	
	// Add the ending byte
	addDelayStep(numEndBit, holdStep);
}

// Iterates the cmdseq index counter 
void AnokiMemory::addDelayStep(unsigned int _numSteps, unsigned char stepValue) {

	// Set the value of the next _numSteps as stepValue
	for (unsigned int i = 0; i < _numSteps; i++) {
		commandSequence[commandSequenceIndex] = stepValue;
		commandSequenceIndex++;
	}
	//memcpy_s(&commandSequence[commandSequenceIndex], _numSteps*4, message, _numSteps*4);
	//memset(&commandSequence[commandSequenceIndex], unsigned int(stepValue), _numSteps);
	//commandSequenceIndex = commandSequenceIndex + _numSteps*4;
}

void AnokiMemory::addSteerTiming() {
	// Add delay time for PAA calculation
	addDelayStep(numStepsPAADelay, 0x08);
	// Add delay time for strobe set
	addDelayStep(numStepsStrobeBit, 0x18);
	// Add delay time for PXA scanning block time
	addDelayStep(numStepsScanDelay, 0x08);
}

void AnokiMemory::exportMemoryToASCII() {
	std::ofstream ascFile;
	ascFile.open("commandseq.asc");

	// For every line in command sequence
	for (unsigned int i = 0; i < commandSequenceIndex; i++) {
		
		unsigned char line = commandSequence[i];
		unsigned char maskbyte = 0x10;

		ascFile << "000000000000000000000000000";

		for (unsigned char i = 0; i < 5; i++) {
			bool showBit = maskbyte & line;
			ascFile << showBit ? 1 : 0;
			maskbyte = maskbyte >> 1;
		}
		ascFile << "\n";
	}

	ascFile.close();
	std::cout << "AnokiMemory: Exporting memory to ASC \n";
}

void AnokiMemory::exportMemoryToReadable() {
	std::ofstream ascFile;
	ascFile.open("commandseq.txt");

	// For every line in command sequence
	size_t numberOfCommands = nVectorAnokiOBJ.size();
	for (unsigned int i = 0; i < numberOfCommands; i++) {

		std::string currentCommand = nVectorAnokiOBJ[i].getCmdLog();
		unsigned int currentIndex = nVectorINDEX[i];

		ascFile << "Step " << currentIndex << "\tCMD: " << currentCommand << "\n";
	}

	ascFile.close();
	std::cout << "AnokiMemory: Exporting memory to text log \n";
}

void AnokiMemory::showAnokiCommandSequence(unsigned int _len) {
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

void AnokiMemory::set_CreateClockFlag(bool _flagClock) {
	flag_genClock = _flagClock;
	anokiCMD.set_generateClock(_flagClock);
}