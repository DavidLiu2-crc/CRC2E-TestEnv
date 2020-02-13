#pragma once

// General C++ modules
#include <iostream>
#include <cstdio>
#include <cmath>
#include <string>
#include <vector>

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
// --- 2. Call cmd_*** functions to convert object attributes to command sequence
// --- 3. Call get_*** functions to pass local command sequence to external variables
class AnokiCommand {

	public:
		// Define configuration of PAA
		int ack = 0, summary = 0;
		int addressIP[4] = { 0 };
		int scratchRegister[4] = { 0 };
		int fixedRegister[4] = { 0 };
		int tempCurrent[5] = { 0 };
	
		// Define parameters of PAA
		bool paramBeamEnable = 0;	// 0:Disable, 1:Enable
		bool paramModeTXRX = 0;		// 0:RX Mode, 1:TX Mode
		bool paramFactoryReset = 0;	// 0:Nothing, 1:Reset
		int paramModeBeam = 0;		// 0:Beam 0; 1:TBD; 2:TBD; 3:Spoil
		double paramDirection[3] = { 0, 0, 28000 }; // [theta, phi, frequency]
		
		unsigned int dirSequence[6] = { 0 }; // [ theta1 theta2 phi1 phi2 freq1 freq2]

		// Define variable to store command sequence in
		unsigned int commandOutByte[ANOKI_counterMaxWrite];	// Max send command byte length
		unsigned int sizeOfOutByte = sizeof(commandOutByte) / sizeof(unsigned int); // Define the array size of commandOutByte
		
		char commandOutCalled[256];	// Character array containing the command sequence in readable language

		unsigned int commandInByte[ANOKI_counterMaxRead];	// Max read command byte length
		unsigned int sizeOfInByte = sizeof(commandInByte) / sizeof(unsigned int); // Define the array size of commandOutByte

		unsigned int cmdSeq_index = 0;			// Defines the index pointer of commandSequence
		unsigned int commandSequence[1024];		// Defines an array the defines the command sequence


		// ---------------- DEFINE BASIC COMMANDS ----------------

		// Sets the command sequence to set scratch value
		void cmd_SetScratchValue(long unsigned nscratchValue);
		// Sets the command sequence to read the scratch value
		void cmd_ReadScratchRequest();
		// Sets the command sequence to read the fixed value
		void cmd_RequestFixedSequence();
		// Sends the command to point the beam with mode, angles and frequency
		void cmd_PAAPointingCommand(); // Needs mode flag, mode beam, with angles and freq already set to hexa
		// Sends the command to return the configuration status
		void cmd_ArrayConfigurationRequest();
		// Sends the command to reset the PAA device to factory
		void cmd_FactoryReset();
		/* void cmd_ConfigureIPAddress(); // Cannot configure over LVDS */
		// Sends the command to enable the beam
		void cmd_EnableBeam();
		// Sends the command to return the summary status
		void cmd_StatusSummaryRequest();
		// Sends the command to return the summary detail
		void cmd_StatusDetailRequest();
		

		// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

		// Set the frequency parameter of the PAA
		void set_PointingFreq(double _freq);
		// Set the beam pointing angles of the PAA
		void set_PointingAngle(double _theta, double _phi);
		// Set the beam pointing angles of the PAA (Azimuth and Elevation)
		void set_PointingAngleAE(double _azimuth, double _elevation);

		// Returns the command sequence through the array pointer
		void get_commandSequence(unsigned int* cmdSeq);
		void get_commandSequence(unsigned int* cmdSeq, std::vector<std::string>& buffer);
		// Returns the command sequence length through the array pointer
		void get_commandLength(unsigned int* cmdLength);


		// ---------------- DEFINE DISPLAY FUNCTIONS ---------------

		// Print the hex command in windows console
		void show_hexCMD(int * pCmd);

	private:
		unsigned int numResponseLast = 0;	// How many bytes expected from last
		unsigned int cmdIndex = 0;			// How many bytes in current command
		unsigned int numResponseNext = 0;	// How many bytes to expect nexttime


		// ------------ DEFINE PRIVATE HELPER FUNCTIONS ------------

		// Returns the checksum byte of the hexadecimal in pCmd
		int checksum(unsigned int* pCmd, int len_);
		// Convert the theta decimal value to equivalent hexadecimal in command sequence
		void theta_uint16ToPointer(double value);
		// Convert the phi decimal value to equivalent hexadecimal in command sequence
		void phi_uint16ToPointer(double value);
		// Convert the frequency decimal value to equivalent hexadecimal in command sequence
		void freq_uint16ToPointer(double value);

		void cleanCommandOutArray();
		void cleanCommandInArray();

		void uint16ToBinInt(unsigned int value, unsigned int* cmdBit);
};

