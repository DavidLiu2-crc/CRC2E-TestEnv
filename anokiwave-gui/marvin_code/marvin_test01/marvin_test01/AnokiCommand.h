#pragma once

// Class object that generates the binary command
class AnokiCommand {
// Global define the anokiwave connection channel
#define ANOKI_CLK				0
#define ANOKI_SDI				1
#define ANOKI_SDO				2
#define ANOKI_LAT				3
#define ANOKI_STB				4
#define ANOKI_numChannels		5	// Defines the number of channels
#define ANOKI_numCommandByte	15	// Defines the maximum number of command bytes
#define ANOKI_numCommandBits	124	// Defines the maximum number of command bits

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
		int paramBeamMode = 0;		// 0:Beam 0; 1:TBD; 2:TBD; 3:Spoil
		int paramDirection[3] = { 0 }; // [theta, phi, frequency]
		
		int dirSequence[6] = { 0 }; // [ theta1 theta2 phi1 phi2 freq1 freq2]
		unsigned int commandVector[ANOKI_numChannels][ANOKI_numCommandBits] = {}; // Define a maximum command sequence

		// Define method prototypes
		void cmd_SetScratchValue(long int nscratchValue);
		void cmd_ReadScratchRequest();
		void cmd_RequestFixedSequence();
		void cmd_PAAPointingCommand(); //Send command
		void cmd_ArrayConfigurationRequest();
		void cmd_FactoryReset();
		// void cmd_ConfigureIPAddress(); // Cannot configure over LVDS
		void cmd_EnableBeam();
		void cmd_StatusSummaryRequest();
		void cmd_StatusDetailRequest();
		
		// Define helper prototypes
		int checksum(int * pCmd, int len_);
		void commandToVector(int len_);

		// Define display prototypes
		void show_hexCMD(int * pCmd, int len_);

	private:
		// Define variable to store command sequence in
		int commandOutByte[9];		// Max send command byte length
		unsigned int commandOutBits[72];
		int commandInByte[14];		// Max read command byte length
		unsigned int commandInBits[72];

		// Define private helper functions
		void theta_uint16ToPointer(double value);
		void phi_uint16ToPointer(double value);
		void freq_uint16ToPointer(double value);

		void cleanCommandOutArray();
		void cleanCommandMemory();
		void generateClock(unsigned int* channel);
		void uint16ToBinInt(unsigned int value, unsigned int* cmdBit);
};

