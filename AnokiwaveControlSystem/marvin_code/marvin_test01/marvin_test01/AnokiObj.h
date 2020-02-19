#pragma once

#include <iostream>
#include <string>

// Global define the anokiwave connection channel
#define ANOKI_CLK				0
#define ANOKI_SDI				1
#define ANOKI_SDO				2
#define ANOKI_LAT				3
#define ANOKI_STB				4

// User defined class for holding each Anokiwave PAA command
class AnokiObj {

public:
	bool createClockCycle = false;

	// General constructor
	AnokiObj() {
		// Define the max bit size of char array
		cmdSeqRaw = new unsigned char[72];
		// Nothing else happens
	}
	AnokiObj(bool _doubleStep) {
		createClockCycle = _doubleStep;

		// Define the max bit size of char array depending on create clock flag
		cmdSeqRaw = createClockCycle ? new unsigned char[144] : new unsigned char[72];
		
	}

	// String placeholder for the function called information
	std::string		cmdLog = " ";

	/// <summary>
	/// Converts the hex values in commandSequence and transposes them into binary ascii steps
	/// </summary>
	/// <returns>None
	/// <para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
	void convertSeqToASCII();
	/// <summary>
	/// Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence
	/// </summary>
	/// <param name="pCmdSeq"> Pointer to the command sequence hex array</param>
	/// <param name="_sendLength"> Counter for number of bytes to send</param>
	/// <param name="_readLength"> Counter for number of bytes to expect to read</param>
	/// <param name="_log"> std::string containing function called information (readable format)</param>
	void setCommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, std::string _log);
	
	// --- Definition of get functions

	// Returns the pointer to the hex command sequence
	unsigned char* getCmdHex();
	// Returns the pointer to the binary command sequence
	unsigned char* getCmdRaw();
	// Returns the value of sent length
	unsigned char getCmdSendLength();
	// Returns the value of read length
	unsigned char getCmdReadLength();

	// --- Definition of show to windows console

	// Display the hex command sequence
	void showCommandHex();
	// Display the ascii command sequence
	void showCommandRaw();
	// Display the string containing command information
	void showReadable();	

private:
	unsigned char	cmdSeqHex[9] = { 0 };	// Pointer to the hex command sequence
	unsigned char*	cmdSeqRaw;	// Pointer to the ascii command sequence
	unsigned char	cmdSend = 0;			// Counter for number of bytes to send for given command
	unsigned char	cmdRead = 0;			// Counter for number of bytes to receive in next configuration
};

