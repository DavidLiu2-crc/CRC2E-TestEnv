#pragma once

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

//#include "AnokiObj.h"
#include "AnokiCommand.h"

class AnokiMemory {

public:
	std::vector< AnokiObj > nVectorAnokiOBJ;
	std::vector< std::vector< float > > nVectorANGLE;
	std::vector< std::vector< float > > nVectorHeader;
	AnokiCommand anokiCMD;

	char * pnInputCSVFile;
	bool nInputFileRead = false;

	unsigned int paramFrequency = 28000;
	unsigned int paramBeamMode = 0;

	int commandSequenceIndex = 0;
	// Max heap 2147483647?
	unsigned char* commandSequence = new unsigned char[1000000];

	void readFromCSV(char* pnInputCSVFile);

	
	void set_CurrentCommand(AnokiObj anokiObj);
	void cmd_FromCSV();
	void cmd_StartBeam(unsigned int _beamMode, unsigned short _freq);
	void cmd_EndBeam();

	void generateCommandSequence();
	void convertAnokiObjToCommandSequence(int _index);
};
