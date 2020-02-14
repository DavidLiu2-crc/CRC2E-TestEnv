#pragma once

#include "AnokiMemory.h"



int AnokiMemory::set_currentCMD(unsigned int* _nCurrentCmd, unsigned int _length) {
	return 0;
}

// Can only hand two column numbers
void AnokiMemory::readFromCSV() {
	std::ifstream file( "anglePoint.csv" );
	std::string line = "";

	while (std::getline(file, line)) {

		std::size_t commaIndex = line.find(',');
		std::string strFirst = line.substr(0, commaIndex);
		line = line.erase(0, commaIndex + 1);
		std::string strSecond = line;

		//std::cout << strFirst.c_str() << "\t" << numSecond.c_str() << "\n";

		std::vector<double> angleLine = { std::stod(strFirst), std::stod(strSecond) };
		nVectorANGLE.push_back(angleLine);

	}

}

// 
void AnokiMemory::setCurrentCommand() {
	return;
}

