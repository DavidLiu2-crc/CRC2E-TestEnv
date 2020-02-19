/**
	File name: AnokiCommand.h
	
	Summary: User defined class that returns a AnokiObj object that contains command control information
			 referenced in Anokiwave ECCN: 5E991

	Author: David Liu - david.liu2@canada.ca
	PandA - MC2

	Description: Simply initialize this class, calling set_ functions to set the values of parameters, and call cmd_
				 to obtain the AnokiObj that contains the command information. Currently allows writing command byte,
				 will attempt to implement read command byte capabilities later.

*/

#pragma once

// General C++ modules import
#include <iostream>
#include <cstdio>
#include <cmath>
#include <string>
#include <vector>

// Import user-defined AnokiObj custom object
#include "AnokiObj.h"

// Global define constants for number of bytes possible to write and read
#define ANOKI_numChannels		5	// Defines the number of channels
#define ANOKI_numCommandByte	17	// Defines the maximum number of command bytes
#define ANOKI_counterMaxWrite	9	// Defines the maximum number of command bytes to send
#define ANOKI_counterMaxRead	15	// Defines the maximum number of command bytes to read

// Global define a matlab degree version of trig functions
#define M_PI		3.14159265358979323846   // pi
#define sind(x)		(sin(fmod((x), 360) * M_PI / 180))
#define cosd(x)		(cos(fmod((x), 360) * M_PI / 180))
#define acosd(x)	acos(x) * 180 / M_PI
#define asind(x)	asin(x) * 180 / M_PI
#define atan2d(y,x) atan2(y,x) * 180 / M_PI

/// <summary>
///
/// </summary>
/// <param name=""></param>
/// <returns><c> </c></returns>
/// <example><code>
///
/// </code></example>
/// <seealso></seealso>

// --- Defines AnokiCommand as C++ class with function and properties of the AWMF-0129 antenna command set
// --- 1. Call set_*** functions to assign the object attributes of this Anokiwave class
// --- 2. Call cmd_*** functions to convert object attributes to command sequence, automatically returns the command object
class AnokiCommand {

public:
	AnokiCommand() {
		// Nothing happens
	}
	AnokiCommand(bool _flagGenClock) {
		flag_generateClock = _flagGenClock;
	}

	// ---------------- DEFINE BASIC COMMANDS ----------------

	/// <summary>
	/// Sets the command sequence to write a value into the scratch register.
	/// <para>Header byte + double to 4 bytes + checksum.</para>
	/// </summary>
	/// <param name="_nScratchValue">Hexadecimal value to load onto register</param>
	/// <returns><c>AnokiObj</c> command object</returns>
	AnokiObj cmd_SetScratchValue(unsigned long _nscratchValue);

	/// <summary>
	/// Sets the command sequence to read the scratch value
	/// </summary>
	/// <returns><c>AnokiObj</c> command object</returns>
	AnokiObj cmd_ReadScratchRequest();
	
	/// <summary>
	/// Sets the command sequence to read the fixed value
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_RequestFixedSequence();

	/// <summary>
	/// Sends the command to point the beam with mode, angles and frequency of current instance setting.
	/// Takes <c>paramModeTXRX</c> as operation mode, and <c>paramModeBeam</c> as beam mode.
	/// Assumes <c>paramDirection</c> and <c>paramFrequency</c> are set appropriately
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_PAAPointingCommand();

	/// <summary>
	/// Sends the command to return the configuration status. Returns IP, Serial Number, Revision Number.
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_ArrayConfigurationRequest();

	/// <summary>
	/// Sends the command to reset the PAA device to factory settings.
	/// Takes value from <c>paramFactoryReset</c> as reset flag.
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_FactoryReset();
	/* void cmd_ConfigureIPAddress(); // Cannot configure over LVDS */

	/// <summary>
	/// Sends the command to enable the beam. Takes value from <c>paramBeamEnable</c> as enable flag.
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_EnableBeam();

	/// <summary>
	/// Sends the command to return the summary status
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_StatusSummaryRequest();

	/// <summary>
	/// Sends the command to return the summary detail
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	AnokiObj cmd_StatusDetailRequest();
		

	// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

	// Set the frequency parameter of the PAA
	void set_PointingFreq(float _freq);
	// Set the beam pointing angles of the PAA
	void set_PointingAngle(float _theta, float _phi);
	// Set the beam pointing angles of the PAA (Azimuth and Elevation)
	void set_PointingAngleAE(float _azimuth, float _elevation);
	// Set the beam enable parameter, 0:Disable, 1:Enable
	void set_enableBeam(bool _beamOn);
	// Set the beam transceiver mode, 0:RX Mode, 1:TX Mode
	void set_modeTXRX(bool _mode);
	// Set the beam mode / width, 0:Beam 0; 1:TBD; 2:TBD; 3:Spoil
	void set_beamMode(unsigned char _modeBeam);
	// Set the factory reset flag, 0:Nothing, 1:Reset
	void set_factoryFlag(bool _factoryReset);

	void set_generateClock(bool _flagGenClock);


private:
	// ---------------- Define parameters of PAA ----------------
	bool paramBeamEnable = 0;	// 0:Disable, 1:Enable
	bool paramBeamTXRX = 0;		// 0:RX Mode, 1:TX Mode
	bool paramFactoryReset = 0;	// 0:Nothing, 1:Reset
	unsigned char paramBeamMode = 0;		// 0:Beam 0; 1:TBD; 2:TBD; 3:Spoil
	unsigned short paramFrequency = 28000;	// Frequency [27500 - 30000] MHz;
	bool flag_generateClock = false;
	float paramTheta = 0;		// Theta angle [0 - 90]
	float paramPhi = 0;			// Phi angle [0 - 360]

	unsigned char dirSequence[6] = { 0 }; // [ theta1 theta2 phi1 phi2 freq1 freq2]

	// ---------------- Define read configuration of PAA -------
	// TODO : Add read byte capabilities to assign parameters in class
	unsigned char readACK = 0;		// Acknowledgement byte, expect 0xC~ 0xE~
	unsigned char readSummary = 0;	// Status byte, expect 0x00
	unsigned char readAddressIP[4] = { 0 };		//IP Address of PAA configuration
	unsigned char readScratchRegister[4] = { 0 }; // Value stored in scratch register
	unsigned char readFixedRegister[4] = { 0 };	// Value stored in fixed register
	unsigned char readTempCurrent[5] = { 0 };		// Value stored in temperature sensors

	// ------------ DEFINE PRIVATE HELPER FUNCTIONS ------------

	// Returns the checksum byte of the hexadecimal in pCmd
	int checksum(unsigned char* pCmd, int len_);
	// Convert the theta decimal value to equivalent hexadecimal in command sequence
	void theta_uint16ToPointer(float value, unsigned char* pnSequence);
	// Convert the phi decimal value to equivalent hexadecimal in command sequence
	void phi_uint16ToPointer(float value, unsigned char* pnSequence);
	// Convert the frequency decimal value to equivalent hexadecimal in command sequence
	void freq_uint16ToPointer(float value, unsigned char* pnSequence);

	// TODO: Add support to read value from dirSequence pointer to value.
};

