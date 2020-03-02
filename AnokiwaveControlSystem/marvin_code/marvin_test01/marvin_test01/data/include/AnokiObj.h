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
#pragma once

// General C++ modules import
#include <iostream>
#include <array>
#include <string>

// Global define the Anokiwave connection channel
#define ANOKI_CLK				0	// Defines the channel for CLK
#define ANOKI_SDI				1	// Defines the channel for SDI
#define ANOKI_SDO				2	// Defines the channel for SDO
#define ANOKI_LAT				3	// Defines the channel for LATCH
#define ANOKI_STB				4	// Defines the channel for STROBE

// Global define constants for number of bytes possible to write and read
#define ANOKI_numChannels		5	// Defines the number of channels
#define ANOKI_numCommandByte	17	// Defines the maximum number of command bytes
#define ANOKI_numMaxWrite		9	// Defines the maximum number of command bytes to send
#define ANOKI_numMaxRead		15	// Defines the maximum number of command bytes to read


// Defines AnokiObj as C++ class with command information of the AWMF-0129 antenna command set
// 1. Call set_CommandSequence functions to assign the object attributes of this Anokiwave class
class AnokiObj {

public:
	// ------ Constructor ----------------------------------------
	AnokiObj() {
		// Nothing else happens
	}
	AnokiObj(bool _generateClock) {
		// Set the clock flag
		flag_generateClock = _generateClock;
	}

	// -------------------- DEFINE SET FUNCTION DEFINITION -----------------------------------------------------

	/// <summary>
	/// Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence.
	/// </summary>
	/// <param name="pCmdSeq">Pointer to the command sequence hex array</param>
	/// <param name="_sendLength">Counter for number of bytes to send</param>
	/// <param name="_readLength">Counter for number of bytes to expect to read</param>
	/// <param name="_log"> std::string containing function called information (readable format)</param>
	void set_CommandSequence(unsigned char* pCmdSeq, unsigned char _sendLength, unsigned char _readLength, std::string _log);

	void set_ResponseFlags(bool _flagACK, float _tempMax, float _tempMin, float _gainRXAvg, float _powerTXAvg);

	/// <summary>
	/// Copy the contents of binary sequence to an external pointer pCmd. For loop implementation
	/// </summary>
	/// <param name="pCmd">Unsigned long pointer to store the binary command steps</param>
	/// <param name="_numberOfStepsCopied">Unsigned int pointer to store the number of steps copied</param>
	/// <returns>Returns 0 if copy complete, or -1 if number of values copied is invalid</returns>
	int cmd_memcpy(unsigned long* pCmd, unsigned int* _numberOfStepsCopied);
	/// <summary>
	/// Copy the contents of binary sequence to an external pointer pCmd. memcpy_s implementation
	/// </summary>
	/// <param name="pCmd">Unsigned long pointer to store the binary command steps</param>
	/// <param name="_numberOfStepsCopied">Unsigned int pointer to store the number of steps copied</param>
	/// <returns>Returns 0 if copy complete, or -1 if number of values copied is invalid</returns>
	int cmd_memcpy(unsigned char* pCmd, unsigned int* _numberOfStepsCopied);

	// -------------------- DEFINE GET FUNCTION DEFINITION -----------------------------------------------------

	/// <summary>
	/// Returns the length of the send byte command
	/// </summary>
	/// <returns>unsigned char representing length of command</returns>
	unsigned char get_CmdSendLength();
	/// <summary>
	/// Returns the length of the read byte command
	/// </summary>
	/// <returns>unsigned char representing length of expected command</returns>
	unsigned char get_CmdReadLength();
	/// <summary>
	/// Returns the string of the readable command
	/// </summary>
	/// <returns></returns>
	std::string get_CmdLog();

	// -------------------- DEFINE SHOW FUNCTION DEFINITION -----------------------------------------------------

	/// <summary>
	/// Display the hex command sequence
	/// </summary>
	void show_CommandHex();
	/// <summary>
	/// Display the ascii command sequence
	/// </summary>
	void show_CommandRaw();
	/// <summary>
	/// Display the string containing command information
	/// </summary>
	void show_CommandLog();	

private:
	// --- Define struct members of AnokiObj class --------------------------------------------------------------

	std::string		cmdLog = " ";			// String placeholder for the function called information
	std::array<unsigned char, 9>	cmdSeqHex = { 0 };	// Pointer to the hex command sequence
	std::array<unsigned char, 144>	cmdSeqRaw;			// Pointer to the ascii command sequence
	unsigned char	cmdSend = 0;			// Counter for number of bytes to send for given command
	unsigned char	cmdRead = 0;			// Counter for number of bytes to receive in next configuration
	bool flag_generateClock = false;		// Boolean flag for generating own clock implementation

	// --- Define struct members for response support -----------------------------------------------------------
	bool flag_ackResponse = false;
	float tempMax = 0;
	float tempMin = 0;
	float gainRXAvg = 0;
	float powerTXAvg = 0;

	// -------------------- DEFINE PRIVATE HELPER FUNCTION DEFINITION -------------------------------------------
	/// <summary>
	/// Converts the hex values in commandSequence and transposes them into binary ascii steps
	/// </summary>
	/// <returns>None
	/// <para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
	void convertSeqToASCII();

};

