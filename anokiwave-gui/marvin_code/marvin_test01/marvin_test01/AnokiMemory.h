#pragma once

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

class AnokiMemory {

public:
	unsigned int nCmdSeqIndex = 0;	// Defines the index of command sequence
	unsigned int nCmdMemIndex = 0;	// Defines the index of the data memory 
	unsigned int nCmdCtlIndex = 0;	// Defines the index of the control memory

	std::vector<std::string> vsCommandLog;
	std::vector< unsigned int [10] > nCmdSeq;
	std::vector < std::vector<double> > nCmdAngle;
	unsigned int nCmdMem[4096], nCmdCtl[4096];

	unsigned int nCurrentCmd[10];
	char pzAngleFile[256], pzMemoryFile[256];

	/// <summary>
	/// 
	/// </summary>
	/// <param name="_nCurrentCmd"></param>
	/// <param name="_length"></param>
	/// <returns></returns>
	int set_currentCMD(unsigned int *_nCurrentCmd, unsigned int _length);

	void readFromCSV();
	

private:

};
