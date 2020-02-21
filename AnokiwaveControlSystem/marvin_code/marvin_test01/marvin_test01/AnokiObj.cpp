#include "AnokiObj.h"



void AnokiObj::convertSeqToASCII() {
	unsigned char index = 0;

	// Loop through each element in commandSequence for send length times.
	for (unsigned char i = 0; i < cmdSend; i++) {
		unsigned char commandByte = cmdSeqHex.at(i);
		unsigned char maskByte = 0x80;
		unsigned char addByte = 1 << ANOKI_SDI;

		// Loop through each of the 8 bits
		for (unsigned char j = 0; j < 8; j++) {
			bool setBit = commandByte & maskByte;

			// Add atleast one command
			cmdSeqRaw.at(index)= setBit ? addByte : 0;
			index++;

			// Add a second bit if clock sequence requires it
			if (flag_generateClock) {
				cmdSeqRaw.at(index) = setBit ? addByte +1: 1;
				index++;
			}

			maskByte = maskByte >> 1;
		}

	}

}

void AnokiObj::setCommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, std::string _log) {
	
	// Set the read and send byte counter length
	cmdSend = _sendLength;
	cmdRead = _readLength;
	cmdLog = _log;

	int copyState = memcpy_s(cmdSeqHex.data(), cmdSend, pCmdSeq, cmdSend);
	// Catch in case copy command not able to copy all the values
	if (copyState != 0) {
		std::cout << "Error occured, not able to copy contents of pointed array to object";
	}

	// Convert the sequence to ASCII binary steps
	convertSeqToASCII();
}

void AnokiObj::setCommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, char* _log) {

	// Set the read and send byte counter length
	cmdSend = _sendLength;
	cmdRead = _readLength;
	cmdLog = std::string( _log );

	int copyState = memcpy_s(cmdSeqHex.data(), cmdSend, pCmdSeq, cmdSend);
	// Catch in case copy command not able to copy all the values
	if (copyState != 0) {
		std::cout << "Error occured, not able to copy contents of pointed array to object";
	}

	// Convert the sequence to ASCII binary steps
	convertSeqToASCII();
}

int AnokiObj::memcpy(unsigned long* pCmd, unsigned int* _numberOfStepsCopied) {
	unsigned int numBitsToCopy = cmdSend * 8;
	numBitsToCopy = flag_generateClock ? numBitsToCopy * 2 : numBitsToCopy;
	unsigned int index = 0;

	// Memory copy directly
	for (unsigned char i = 0; i < numBitsToCopy; i++) {
		pCmd[i] = cmdSeqRaw[i];
		index++;
	}
	
	if (index != numBitsToCopy) {
		return -1;
	}

	// Pass the number of bytes back to caller
	*_numberOfStepsCopied = numBitsToCopy;
	return 0;
}

unsigned char AnokiObj::getCmdSendLength() {
	return cmdSend;
}
unsigned char AnokiObj::getCmdReadLength() {
	return cmdRead;
}
std::string AnokiObj::getCmdLog() {
	return cmdLog;
}

void AnokiObj::showCommandHex() {
	// Iterate through each element in pointer
	for (unsigned char i = 0; i < cmdSend; i++) {
		std::cout << " " << cmdSeqHex.at(i);
	}std::cout << "\n";
}

void AnokiObj::showCommandRaw() {
	// Iterate through each element in ascii pointer
	for (unsigned char i = 0; i < cmdSend * 8; i++) {
		//Iterate through each position in byte
		unsigned char maskByte = 0x80;
		for (unsigned char i = 0; i < 8; i++) {
			bool showBit = maskByte & cmdSeqRaw.at(i);
			std::cout << showBit ? 1 : 0;
		}std::cout << "\n";
	}
}

void AnokiObj::showReadable() {
	std::cout << cmdLog.c_str();
}

