/**
	AnokiObj.h
	Purpose: User-defined object that contains information about Anokiwave Command
	
	See also document: ECCN: 5E991 - NLR : Table 4.1 page 8

*/
#pragma once

#include <iostream>
#include <array>
#include <string>

// Global define the anokiwave connection channel
#define ANOKI_CLK				0	// Defines the channel for CLK
#define ANOKI_SDI				1	// Defines the channel for SDI
#define ANOKI_SDO				2	// Defines the channel for SDO
#define ANOKI_LAT				3	// Defines the channel for LATCH
#define ANOKI_STB				4	// Defines the channel for STROBE

// Global define constants for number of bytes possible to write and read
#define ANOKI_numChannels		5	// Defines the number of channels
#define ANOKI_numCommandByte	17	// Defines the maximum number of command bytes
#define ANOKI_numMaxWrite	9		// Defines the maximum number of command bytes to send
#define ANOKI_numMaxRead	15		// Defines the maximum number of command bytes to read

// User defined class for holding each Anokiwave PAA command
class AnokiObj {

public:
	// General constructor
	AnokiObj() {
		// Nothing else happens
	}
	AnokiObj(bool _generateClock) {
		// Set the clock flag
		flag_generateClock = _generateClock;
	}

	/// <summary>
	/// Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence
	/// </summary>
	/// <param name="pCmdSeq">Pointer to the command sequence hex array</param>
	/// <param name="_sendLength">Counter for number of bytes to send</param>
	/// <param name="_readLength">Counter for number of bytes to expect to read</param>
	/// <param name="_log"> std::string containing function called information (readable format)</param>
	void setCommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, std::string _log);
	void setCommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, char* _log);

	// --- Definition of get functions
	int memcpy(unsigned long* pCmd, unsigned int* _numberOfStepsCopied);

	// Returns the value of sent length
	unsigned char getCmdSendLength();
	// Returns the value of read length
	unsigned char getCmdReadLength();
	// Returns the string of the readable command
	std::string getCmdLog();

	// --- Definition of show to windows console

	// Display the hex command sequence
	void showCommandHex();
	// Display the ascii command sequence
	void showCommandRaw();
	// Display the string containing command information
	void showReadable();	

private:
	// --- Define struct members of AnokiObj class ------------------------------------------------------------------------

	std::string		cmdLog = " ";			// String placeholder for the function called information
	std::array<unsigned char, 9>	cmdSeqHex = { 0 };	// Pointer to the hex command sequence
	std::array<unsigned char, 144>	cmdSeqRaw;			// Pointer to the ascii command sequence
	unsigned char	cmdSend = 0;			// Counter for number of bytes to send for given command
	unsigned char	cmdRead = 0;			// Counter for number of bytes to receive in next configuration
	bool flag_generateClock = false;		// Boolean flag for generating own clock implementation

	/// <summary>
	/// Converts the hex values in commandSequence and transposes them into binary ascii steps
	/// </summary>
	/// <returns>None
	/// <para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
	void convertSeqToASCII();

};

