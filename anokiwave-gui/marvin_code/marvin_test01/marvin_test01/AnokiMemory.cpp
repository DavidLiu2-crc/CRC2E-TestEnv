#pragma once

#include "AnokiMemory.h"


// Can only hand two column numbers
void AnokiMemory::readFromCSV(char* pnInputCSVFile) {
	
	std::ifstream file;
	// Try and catch file opening exception
	try {
		file.open(pnInputCSVFile);

	} catch(std::ios_base::failure e) {
		nInputFileRead = false;
	}
	std::string line = "";

	while (std::getline(file, line)) {

		std::size_t commaIndex = line.find(',');
		std::string strFirst = line.substr(0, commaIndex);
		line = line.erase(0, commaIndex + 1);
		std::string strSecond = line;

		//std::cout << strFirst.c_str() << "\t" << numSecond.c_str() << "\n";

		std::vector<float> angleLine = { std::stof(strFirst), std::stof(strSecond) };
		nVectorANGLE.push_back(angleLine);

	}

	// Remove the header information
	nVectorHeader.push_back(nVectorANGLE[0]);
	nVectorHeader.push_back(nVectorANGLE[1]);
	nVectorHeader.push_back(nVectorANGLE[2]);
	nVectorANGLE.erase(nVectorANGLE.begin(), nVectorANGLE.begin()+3);

	nInputFileRead = true;
	file.close();

}

// 
void AnokiMemory::set_CurrentCommand(AnokiObj anokiObj) {
	nVectorAnokiOBJ.push_back(anokiObj);
}

void AnokiMemory::cmd_FromCSV() {
	size_t numCommandObjects = nVectorANGLE.size();
	for (unsigned int i = 0; i < numCommandObjects; i++) {
		float theta, phi;
		theta = nVectorANGLE[i][0];
		phi = nVectorANGLE[i][1];

		anokiCMD.set_PointingAngle(theta, phi);
		AnokiObj anokiObj = anokiCMD.cmd_PAAPointingCommand();

		nVectorAnokiOBJ.push_back(anokiObj);
	}

}

void AnokiMemory::cmd_StartBeam(unsigned int _beamMode, unsigned short _freq) {

	anokiCMD.set_enableBeam(true);
	anokiCMD.set_modeTXRX(0);
	anokiCMD.set_beamMode(_beamMode);
	anokiCMD.set_PointingFreq(_freq);

}

void AnokiMemory::cmd_EndBeam() {
	anokiCMD.set_enableBeam(false);
}

void AnokiMemory::generateCommandSequence() {

	// Clear existing sequence memory and sets latch line always high, and everything else low
	for (int i = 0; i < sizeof(commandSequence); i++) {
		commandSequence[i] = 0b00001000;
	}

	// Scan through each Anoki object
	size_t numberVectorObj = nVectorAnokiOBJ.size();
	//for (unsigned int i = 0; i < numberVectorObj; i++) {
		//
	//}

}

void AnokiMemory::convertAnokiObjToCommandSequence(int _index) {
	
	unsigned char numOfSendByte = nVectorAnokiOBJ[_index].commandSendLength;
	
	for (unsigned char i = 0; i < numOfSendByte; i++) {
		unsigned char commandByte = nVectorAnokiOBJ[_index].commandSequence[i];
		unsigned char maskByte = 0x80;
		unsigned char addByte = 2; // SDI channel 1

		for (unsigned char j = 0; j < 8; j++) {
			unsigned char maskIndex = commandSequenceIndex + j;
			unsigned char currentByte = commandSequence[maskIndex];
			bool setBit = maskByte & commandByte;
			commandSequence[maskIndex] = maskByte & commandByte ? currentByte + addByte : currentByte;
		}

	}


}

