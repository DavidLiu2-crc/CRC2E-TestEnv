#pragma once

// --- Defines AnokiCommand as C++ class with function and 
// properties of the AWMF-0129 antenna command set
class AnokiCommand {

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
		// void cmd_ConfigureIPAddress(); // Cannot configure over LVDS
		// Sends the command to enable the beam *IRRADIATING*
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
		// Returns the command sequence through the array pointer
		void get_commandSequence(unsigned int * cmdSeq);


		// ---------------- DEFINE HELPER FUNCTIONS ----------------

		// Returns the checksum byte of the hexadecimal in pCmd
		int checksum(unsigned int * pCmd, int len_);
		// Appends the current command to commmand sequence array.
		void addToCommandSequence();


		// ---------------- DEFINE DISPLAY FUNCTIONS ---------------

		// Print the hex command in windows console
		void show_hexCMD(int * pCmd, int len_);

	private:
		int numResponseLast = 0;	// How many bytes expected now
		int numResponseCurrent = 0;	// How many bytes to expect next


		// ------------ DEFINE PRIVATE HELPER FUNCTIONS ------------

		void theta_uint16ToPointer(double value);
		void phi_uint16ToPointer(double value);
		void freq_uint16ToPointer(double value);

		void cleanCommandOutArray();
		void cleanCommandInArray();

		void uint16ToBinInt(unsigned int value, unsigned int* cmdBit);
};

