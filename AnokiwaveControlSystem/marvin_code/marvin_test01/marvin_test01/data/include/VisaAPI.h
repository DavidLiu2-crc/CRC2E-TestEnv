#pragma once


#include <iostream>
#include <string>

#include "..\..\deps\NI VISA\include\visa.h"



class VisaAPI {

public:
	VisaAPI() {
		// Nothing happens constructor
	}

	// Searches for Visa resource by opening VISA Resource Manager
	void cmd_SearchForVisaResource();
	bool cmd_StartVisaConnection();
	void cmd_EndVisaConnection();
	void cmd_fetchData(ViReal32* pRawDataPointer, ViUInt32 _bufferSize);
	void cmd_sendString(ViConstString _command, ViConstString _response);

	void set_VisaFindHostname(ViConstString _hostname);
	//void set_VisaTCPIP(char* _VisaIPAddr);
	void set_VisaAttributes();

	

private:
	ViStatus nStatus = VI_SUCCESS;		// Error status placeholder
	ViSession defaultRM;				// VI Session for default RM
	ViSession instr;					// VI Session for actual instrument

	char searchInstrDescriptor[VI_FIND_BUFLEN]; // character placeholder for instrument description
	ViFindList searchFindList;			// Numerated list of instruments found connected to machine
	ViUInt32 searchNumInstrs = 0;

	std::string instrumentModel = "N9030A";
	ViConstString nFindHostname = "TCPIP?*inst0::INSTR";
	ViChar VisaIPAddr[VI_FIND_BUFLEN];		// IP address of the VISA instrument
	ViChar VisaIPHostname[VI_FIND_BUFLEN];	// Hostname of the Visa Instrument
	ViUInt16 VisaIPPort = 0;				// IP Port of the VISA instrument


	unsigned char outputBuffer[VI_FIND_BUFLEN];
	ViUInt32 nCounter = 0;
	ViAttrState nAttributeStatus;

	// Create memory heap for read buffer
	ViUInt64 maxRawReadSize = 100000;
	ViReal32* rawReadBuffer = new ViReal32[maxRawReadSize];
	
	void CheckStatus(ViStatus nStatus);
	void CheckErrorMsg(std::string errorMsg);
};