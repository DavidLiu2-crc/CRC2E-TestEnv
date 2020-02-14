#pragma once

// General C++ modules
#include <iostream>
#include <cstdio>
#include <cmath>
#include <string>
#include <vector>

#include "AnokiObj.h"

// Global define the anokiwave connection channel
#define ANOKI_CLK				0
#define ANOKI_SDI				1
#define ANOKI_SDO				2
#define ANOKI_LAT				3
#define ANOKI_STB				4

#define ANOKI_numChannels		5	// Defines the number of channels
#define ANOKI_numCommandByte	17	// Defines the maximum number of command bytes
#define ANOKI_counterMaxWrite	9
#define ANOKI_counterMaxRead	15

// Global define a matlab degree version of trig functions
#define M_PI		3.14159265358979323846   // pi
#define sind(x)		(sin(fmod((x), 360) * M_PI / 180))
#define cosd(x)		(cos(fmod((x), 360) * M_PI / 180))
#define acosd(x)	acos(x) * 180 / M_PI
#define asind(x)	asin(x) * 180 / M_PI
#define atan2d(y,x) atan2(y,x) * 180 / M_PI


// --- Defines AnokiCommand as C++ class with function and properties of the AWMF-0129 antenna command set
// --- 1. Call set_*** functions to assign the object attributes of this Anokiwave class
// --- 2. Call cmd_*** functions to convert object attributes to command sequence, automatically returns the command object
class AnokiCommand {

public:
	// Define configuration of PAA
	int ack = 0, summary = 0;
	int addressIP[4] = { 0 };
	int scratchRegister[4] = { 0 };
	int fixedRegister[4] = { 0 };
	int tempCurrent[5] = { 0 };
	
	// ---------------- DEFINE BASIC COMMANDS ----------------

	// Sets the command sequence to set scratch value
	AnokiObj cmd_SetScratchValue(unsigned long _nscratchValue);
	// Sets the command sequence to read the scratch value
	AnokiObj cmd_ReadScratchRequest();
	// Sets the command sequence to read the fixed value
	AnokiObj cmd_RequestFixedSequence();
	// Sends the command to point the beam with mode, angles and frequency
	AnokiObj cmd_PAAPointingCommand(); // Needs mode flag, mode beam, with angles and freq already set to hexa
	// Sends the command to return the configuration status
	AnokiObj cmd_ArrayConfigurationRequest();
	// Sends the command to reset the PAA device to factory
	AnokiObj cmd_FactoryReset();
	/* void cmd_ConfigureIPAddress(); // Cannot configure over LVDS */
	// Sends the command to enable the beam
	AnokiObj cmd_EnableBeam();
	// Sends the command to return the summary status
	AnokiObj cmd_StatusSummaryRequest();
	// Sends the command to return the summary detail
	AnokiObj cmd_StatusDetailRequest();
		

	// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

	// Set the frequency parameter of the PAA
	void set_PointingFreq(float _freq);
	// Set the beam pointing angles of the PAA
	void set_PointingAngle(float _theta, float _phi);
	// Set the beam pointing angles of the PAA (Azimuth and Elevation)
	void set_PointingAngleAE(float _azimuth, float _elevation);
	// Set the beam enable parameter
	void set_enableBeam(bool _beamOn);
	// Set the beam transceiver mode
	void set_modeTXRX(bool _mode);
	// Set the beam mode / width
	void set_beamMode(unsigned char _modeBeam);
	// Set the factory reset flag
	void set_factoryFlag(bool _factoryReset);


	// ---------------- DEFINE DISPLAY FUNCTIONS ---------------

	// Print the hex command in windows console
	void show_hexCMD(int * pCmd);

private:
	// ---------------- Define parameters of PAA ----------------
	bool paramBeamEnable = 0;	// 0:Disable, 1:Enable
	bool paramModeTXRX = 0;		// 0:RX Mode, 1:TX Mode
	bool paramFactoryReset = 0;	// 0:Nothing, 1:Reset
	unsigned char paramModeBeam = 0;		// 0:Beam 0; 1:TBD; 2:TBD; 3:Spoil
	unsigned short paramFrequency = 28000; // Frequency [27500, 30000];
	float paramDirection[2] = { 0, 0 }; // [theta, phi]

	unsigned char dirSequence[6] = { 0 }; // [ theta1 theta2 phi1 phi2 freq1 freq2]

	// ------------ DEFINE PRIVATE HELPER FUNCTIONS ------------

	// Returns the checksum byte of the hexadecimal in pCmd
	int checksum(unsigned char* pCmd, int len_);
	// Convert the theta decimal value to equivalent hexadecimal in command sequence
	void theta_uint16ToPointer(float value);
	// Convert the phi decimal value to equivalent hexadecimal in command sequence
	void phi_uint16ToPointer(float value);
	// Convert the frequency decimal value to equivalent hexadecimal in command sequence
	void freq_uint16ToPointer(float value);

	void uint16ToBinInt(unsigned int value, unsigned int* cmdBit);
};

