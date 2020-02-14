#pragma once

#include <string>

class AnokiObj {

public:
	unsigned int	commandSequence[15] = { 0 };
	unsigned int	commandSendLength = 0;
	unsigned int	commandReadLength = 0;
	std::string		commandLog = " ";

};

