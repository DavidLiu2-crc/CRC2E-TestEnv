#pragma once

#include <string>

class AnokiObj {

public:
	unsigned char	commandSequence[15] = { 0 };
	unsigned char	commandSendLength = 0;
	unsigned char	commandReadLength = 0;
	std::string		commandLog = " ";

};

