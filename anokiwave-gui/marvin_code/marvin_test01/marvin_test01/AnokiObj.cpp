#include "AnokiObj.h"



void AnokiObj::convertSeqToASCII() {
	unsigned char index = 0;

	// Loop through each element in commandSequence for send length times.
	for (unsigned char i = 0; i < cmdSend; i++) {
		unsigned char commandByte = cmdSeqHex[i];
		unsigned char maskByte = 0x80;
		unsigned char addByte = 1 << ANOKI_SDI;

		// Loop through each of the 8 bits
		for (unsigned char j = 0; j < 8; j++) {
			bool setBit = commandByte & maskByte;
			cmdSeqRaw[index] = setBit ? addByte : 0;

			maskByte = maskByte >> 1;
			index++;
		}

	}

}

void AnokiObj::setCommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, std::string _log) {
	
	// Set the read and send counter length
	cmdSend = _sendLength;
	cmdRead = _readLength;
	cmdLog = _log;


	int copyState = memcpy_s(cmdSeqHex, cmdSend, pCmdSeq, cmdSend);
	// Catch in case copy command not able to copy all the values
	if (copyState > 0) {
		std::cout << "Error occured, not able to copy contents of pointed array to object";
	}

	// Convert the sequence to ASCII binary steps
	convertSeqToASCII();
}

unsigned char* AnokiObj::getCmdHex() {
	return cmdSeqHex;
}
unsigned char* AnokiObj::getCmdRaw() {
	return cmdSeqRaw;
}
unsigned char AnokiObj::getCmdSendLength() {
	return cmdSend;
}
unsigned char AnokiObj::getCmdReadLength() {
	return cmdRead;
}

void AnokiObj::showCommandHex() {
	// Iterate through each element in pointer
	for (unsigned char i = 0; i < cmdSend; i++) {
		std::cout << " " << cmdSeqHex[i];
	}std::cout << "\n";
}

void AnokiObj::showCommandRaw() {
	// Iterate through each element in ascii pointer
	for (unsigned char i = 0; i < cmdSend * 8; i++) {
		//Iterate through each position in byte
		unsigned char maskByte = 0x80;
		for (unsigned char i = 0; i < 8; i++) {
			bool showBit = maskByte & cmdSeqRaw[i];
			std::cout << showBit ? 1 : 0;
		}std::cout << "\n";
	}
}

void AnokiObj::showReadable() {
	std::cout << cmdLog.c_str();
}

