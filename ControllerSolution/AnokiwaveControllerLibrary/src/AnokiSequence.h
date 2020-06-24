#pragma once

#include <string>
#include <array>
#include <vector>
#include <fstream>
#include <iostream>


class AnokiSequence
{
public:
	/// <summary>
	/// Load a CSV file containing two column of values, theta and phi for each line
	/// </summary>
	/// <param name="pnInputCSVFile">String representing the relative path of input csv file</param>
	/// <param name="generateClock">Boolean to generate clock pulse</param>
	void LoadAnglePoints(std::string pnInputCSVFile, bool generateClock);

	/// <summary>
	/// Assumes that float pointer contains angle information [theta, phi] directions of dimension length = 2 x angles
	/// </summary>
	/// <param name="angleArray"></param>
	/// <param name="angleLength"></param>
	/// <param name="generateClock"></param>
	void LoadAnglePoints(float* angleArray, unsigned long angleLength, bool generateClock);

	/// <summary>
	/// Sets the dwell time after a command is sent (combines phase computation and PXA scan time)
	/// </summary>
	/// <param name="freq"></param>
	/// <param name="delayTime"></param>
	void setDwellTime(float freq, float delayTime);

	/// <summary>
	/// Command to generate command bit sequence
	/// </summary>
	void GenerateCommandSequence();
	
	/// <summary>
	/// Export the steps generated to a binary file of name pnOutputCSVFile
	/// </summary>
	/// <param name="pnOutputCSVFile"></param>
	void ExportCommandSequence(std::string pnOutputCSVFile);

	/// <summary>
	/// Returns the pointer address to bit sequence and size
	/// </summary>
	/// <param name="pSeq"></param>
	/// <param name="len_"></param>
	void GetCommandSequence(unsigned char** pSeq, unsigned long* len_);

protected:

	struct command {
		std::string CommandLog;
		unsigned char* CommandHex = new unsigned char[10]; 
		int sendByteLength = 0;
		int readByteLength = 0;

		bool genDoubleClock = false;

		command(unsigned char* cmd, int sendByteLength, int readByteLength, std::string cmdLog, bool genClock) {
			this->sendByteLength = sendByteLength;
			memcpy_s(CommandHex, 10, cmd, this->sendByteLength);

			this->readByteLength = readByteLength;
			
			this->CommandLog = cmdLog;
			this->genDoubleClock = genClock;
		}

		/// <summary>
		/// Generate LVDS bit sequence from hex command sequence
		/// </summary>
		/// <param name="pCmd"></param>
		/// <param name="len_"></param>
		void ConvertSequence(unsigned char** pCmd, unsigned int* len_);
		
	};

private:
	unsigned long MaxAngles = 10000;
	unsigned long CtrAngles = 0;
	float* PtrAngles = new float[MaxAngles];
	
	unsigned long MaxSequence = 10000000;
	unsigned long CtrSequence = 0;
	unsigned char* PtrSequence = new unsigned char[MaxSequence];

	bool generateClock = true;
	unsigned long dwellSteps = 0;

	std::array<unsigned char, 10> cmd;
	std::array<char, 100> cmdLog;

	/// <summary>
	/// Add the command object to the command step sequence
	/// </summary>
	/// <param name="cmd"></param>
	void AddCommandToSequence(command cmd);

	/// <summary>
	/// Sets the command sequence to write a value into the scratch register.
	/// <para>Header byte + double to 4 bytes + checksum.</para>
	/// </summary>
	/// <param name="_nScratchValue">Hexadecimal value to load onto register</param>
	/// <returns><c>AnokiObj</c> command object</returns>
	command cmd_SetScratchValue(unsigned long _nscratchValue);

	/// <summary>
	/// Sets the command sequence to read the scratch value
	/// </summary>
	/// <returns><c>AnokiObj</c> command object</returns>
	command cmd_ReadScratchRequest();

	/// <summary>
	/// Sets the command sequence to read the fixed value
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_RequestFixedSequence();

	/// <summary>
	/// Sends the command to point the beam with mode, angles and frequency of current instance setting.
	/// Takes <c>paramModeTXRX</c> as operation mode, and <c>paramModeBeam</c> as beam mode.
	/// Assumes <c>paramDirection</c> and <c>paramFrequency</c> are set appropriately
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_PAAPointingCommand(bool paramBeamTXRX, int paramBeamMode, float paramTheta, float paramPhi, long paramFreq);

	/// <summary>
	/// Sends the command to return the configuration status. Returns IP, Serial Number, Revision Number.
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_ArrayConfigurationRequest();

	/// <summary>
	/// Sends the command to reset the PAA device to factory settings.
	/// Takes value from <c>paramFactoryReset</c> as reset flag.
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_FactoryReset(bool paramFactoryReset);

	/* void cmd_ConfigureIPAddress(); // Cannot configure over LVDS */

	/// <summary>
	/// Sends the command to enable the beam. Takes value from <c>paramBeamEnable</c> as enable flag.
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_EnableBeam(bool paramBeamEnable);

	/// <summary>
	/// Sends the command to return the summary status
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_StatusSummaryRequest();

	/// <summary>
	/// Sends the command to return the summary detail
	/// </summary>
	/// <returns><c> AnokiObj </c> command object </returns>
	command cmd_StatusDetailRequest();

	/// <summary>
	/// Add the dwell time (after command is sent)
	/// </summary>
	void AddDwellTime();

	/// <summary>
	/// Computes the checksum of a sequence of bytes (XOR)
	/// </summary>
	/// <param name="pCmd">Unsigned char pointer to sequence of bytes</param>
	/// <param name="len_">length of unsigned char array containign sequence</param>
	/// <returns></returns>
	int checksum(unsigned char* pCmd, int len_);

	/// <summary>
	/// 
	/// </summary>
	/// <param name="_value"></param>
	/// <param name="pnSequence"></param>
	void theta_uint16ToPointer(float _value, unsigned char* pnSequence);

	/// <summary>
	/// 
	/// </summary>
	/// <param name="_value"></param>
	/// <param name="pnSequence"></param>
	void phi_uint16ToPointer(float _value, unsigned char* pnSequence);

	/// <summary>
	/// 
	/// </summary>
	/// <param name="_value"></param>
	/// <param name="pnSequence"></param>
	void freq_uint16ToPointer(unsigned int _value, unsigned char* pnSequence);

	
};

