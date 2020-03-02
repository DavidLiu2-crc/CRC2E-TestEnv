/**
	File name: AnokiObj.h

	Summary: User-defined object that contains information about Anokiwave Command

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Usage:  1. Initialize the object. Use constructor AnokiObj xxxAnoki(true) to set up double clock step implementation
			2. Call set_CommandSequence to set the command information
			3. Return or push the object into vector storage

	See also document: Anokiwave USB Documents
	ECCN: 5E991 - NLR : Table 4.1 page 8

*/

// Include corresponding header file
#include "..\include\AnokiObj.h"

// -------------------- DEFINE SET FUNCTION DEFINITION -----------------------------------------------------

void AnokiObj::set_CommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, std::string _log) {
	
	// Set the read and send byte counter length
	cmdSend = _sendLength;
	cmdRead = _readLength;
	cmdLog = _log;

	// Copy memory content from external pCmdSeq array to local std::array
	int copyState = memcpy_s(cmdSeqHex.data(), cmdSend, pCmdSeq, cmdSend);
	// Catch in case copy command not able to copy all the values
	if (copyState != 0) {
		std::cout << "Error occured, not able to copy all of the contents from pointed array into object";
	}

	// Convert the sequence to ASCII binary steps
	convertSeqToASCII();
}

void AnokiObj::set_ResponseFlags(bool _flagACK, float _tempMax, float _tempMin, float _gainRXAvg, float _powerTXAvg) {
	flag_ackResponse = _flagACK;
	tempMax = _tempMax;
	tempMin = _tempMin;
	gainRXAvg = _gainRXAvg;
	powerTXAvg = powerTXAvg;
}


int AnokiObj::cmd_memcpy(unsigned long* pCmd, unsigned int* _numberOfStepsCopied) {
	// Get the number of steps to create from cmdHex
	unsigned int numBitsToCopy = cmdSend * 8;
	numBitsToCopy = flag_generateClock ? numBitsToCopy * 2 : numBitsToCopy;
	unsigned int index = 0;

	// --- Memory copy directly
	for (unsigned char i = 0; i < numBitsToCopy; i++) {
		// TODO: Add more memory leak protection
		// Only copy a value if the memory content has been cleared
		if (pCmd[i] != 0) {
			return -1;
		}
		// Otherwise keep copying memory content
		pCmd[i] = cmdSeqRaw.at(i);
		index++;
	}

	// Pass the number of bytes back to caller
	*_numberOfStepsCopied = numBitsToCopy;
	return 0;
}

int AnokiObj::cmd_memcpy(unsigned char* pCmd, unsigned int* _numberOfStepsCopied) {
	// Get the number of steps to create from cmdHex
	unsigned int numBitsToCopy = cmdSend * 8;
	numBitsToCopy = flag_generateClock ? numBitsToCopy * 2 : numBitsToCopy;
	unsigned int index = 0;

	// --- Memory copy directly
	int cpyError = memcpy_s(pCmd, sizeof(pCmd) * numBitsToCopy, cmdSeqRaw.data(), sizeof(char) * numBitsToCopy);

	// Pass the number of bytes back to caller
	*_numberOfStepsCopied = numBitsToCopy;
	return 0;
}

// -------------------- DEFINE GET FUNCTION DEFINITION -----------------------------------------------------

unsigned char AnokiObj::get_CmdSendLength() {
	return cmdSend;
}
unsigned char AnokiObj::get_CmdReadLength() {
	return cmdRead;
}
std::string AnokiObj::get_CmdLog() {
	return cmdLog;
}

// -------------------- DEFINE SHOW FUNCTION DEFINITION -----------------------------------------------------
void AnokiObj::show_CommandHex() {
	// Iterate through each element in pointer
	for (unsigned char i = 0; i < cmdSend; i++) {
		std::cout << " " << cmdSeqHex.at(i);
	}std::cout << "\n";
}

void AnokiObj::show_CommandRaw() {
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

void AnokiObj::show_CommandLog() {
	std::cout << cmdLog.c_str();
}

// -------------------- DEFINE PRIVATE HELPER FUNCTION DEFINITION -------------------------------------------

void AnokiObj::convertSeqToASCII() {
	unsigned char index = 0;

	// Loop through each element in commandSequence for send length times.
	for (unsigned char i = 0; i < cmdSend; i++) {
		// Set local variables
		unsigned char commandByte = cmdSeqHex.at(i);
		unsigned char maskByte = 0x80;
		unsigned char addByte = 1 << ANOKI_SDI;

		// Loop through each of the 8 bits
		for (unsigned char j = 0; j < 8; j++) {
			bool setBit = commandByte & maskByte;

			// Add atleast one command
			cmdSeqRaw.at(index) = setBit ? addByte : 0;
			index++;

			// Add a second bit if clock sequence requires it
			if (flag_generateClock) {
				cmdSeqRaw.at(index) = setBit ? addByte + 1 : 1;
				index++;
			}

			// Right shift the mask byte to scan next binary position
			maskByte = maskByte >> 1;
		}

	}

}