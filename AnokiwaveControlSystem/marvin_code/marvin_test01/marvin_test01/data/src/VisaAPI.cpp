#pragma once

// Include corresponding header file
#include "..\include\VisaAPI.h"

void VisaAPI::cmd_SearchForVisaResource() {
	// Start a default Visa Resource Manager
	nStatus = viOpenDefaultRM(&defaultRM);
	CheckErrorMsg("Could not open a VI Session");

	// Find all visa resources connected to machine
	nStatus = viFindRsrc(defaultRM, "?*INSTR", &searchFindList, &searchNumInstrs, searchInstrDescriptor);
	CheckErrorMsg("Error occured when searching for VISA resources");

	// Show how many visa resources were found
	std::cout << "VisaAPI: Found " << searchNumInstrs << " resources connected to machine\n";
	unsigned int i = 1;
	while (searchNumInstrs--) {
		std::cout << "Instr " << i++ <<": " << searchInstrDescriptor << "\n";
		nStatus = viFindNext(searchFindList, searchInstrDescriptor);
	}

	// Of all the visa resources connected to machine
	nStatus = viFindRsrc(defaultRM, nFindHostname, &searchFindList, &searchNumInstrs, searchInstrDescriptor);
	CheckErrorMsg("Could not find any visa resources with host name");
}

bool VisaAPI::cmd_StartVisaConnection() {
	

	// Start the NI Visa Session
	nStatus = viOpenDefaultRM(&defaultRM);
	CheckErrorMsg("Could not open a VI Session");

	// Connect to the resource found by host name
	nStatus = viOpen(defaultRM, searchInstrDescriptor, VI_NULL, VI_NULL, &instr);
	CheckErrorMsg("Could not open any visa resources with host name");

	if (nStatus < VI_SUCCESS) {
		return false;
	}

	std::cout << "VisaAPI: Connected to Visa resource." << searchInstrDescriptor << "\n";
	return true;
}

void VisaAPI::cmd_EndVisaConnection() {
	nStatus = viClose(instr);
	nStatus = viClose(defaultRM);

	//fflush(stdin);
	//getchar();
}

// different from viQuery because this can perform actions after writing / before reading
void VisaAPI::cmd_sendString(ViConstString _command, ViConstString _response) {
	ViUInt32 writeCounter, readCounter;
	ViUInt32 readNumOfBytes = 1024;
	ViUInt16 statusByte = 0;

	char* pCommand = (char*) _command;
	char* queryBit = strchr(pCommand, '?');

	nStatus = viWrite(instr, (ViBuf)_command, (ViUInt32)strlen(_command), &writeCounter);
	CheckErrorMsg("Could not write command.");

	// If not a query command, simply read status
	if (queryBit == NULL) {
		viReadSTB(instr, &statusByte);
	}
	// If there is query command, then write and read from the PXA
	else if (queryBit > 0) {
		nStatus = viRead(instr, (ViBuf)_response, readNumOfBytes, &readCounter);
		CheckErrorMsg("Could not read command.");
		std::cout << "Read: " << _response << "\n";
	}
	// Perform check on nStatus after writing
	// TODO: Add exception

	// Display to user what was sent and received
	//std::cout << "\n";
	//std::cout << "Sent: " << _command << "\n";
	//std::cout << "Read: " << _response << "\n";
	//std::cout << "\n";
}

// TODO: find why this sometimes happen NMI_HARDWARE_FAILURE?

void VisaAPI::cmd_fetchData(ViReal32* pRawDataPointer, ViUInt32 _bufferSize) {
	
	viWrite(instr, ":INIT:FCAP", 1024, &writeCounter);

	viQueryf(instr, "")
}

void VisaAPI::set_VisaFindHostname(ViConstString _hostname) {
	nFindHostname = _hostname;
}

//void VisaAPI::set_VisaTCPIP(char* _VisaIPAddr) {
//	VisaIPAddr = std::string(_VisaIPAddr);
//}

void VisaAPI::set_VisaAttributes() {
	nAttributeStatus = VI_TRUE;
	nStatus = viSetAttribute(instr, VI_ATTR_TCPIP_NODELAY, nAttributeStatus);
	CheckErrorMsg("Could not set attribute");

	nStatus = viGetAttribute(instr, VI_ATTR_TCPIP_ADDR, &VisaIPAddr);
	CheckErrorMsg("Could not get TCPIP Addr");
	std::cout << "Visa IP Address: " << VisaIPAddr << "\n";

	nStatus = viGetAttribute(instr, VI_ATTR_TCPIP_HOSTNAME, &VisaIPHostname);
	CheckErrorMsg("Could not get TCPIP Hostname");
	std::cout << "Visa IP Hostname: " << VisaIPHostname << "\n";

	nStatus = viGetAttribute(instr, VI_ATTR_TCPIP_PORT, &VisaIPPort);
	CheckErrorMsg("Could not get TCPIP Port");
	std::cout << "Visa IP Port: " << VisaIPPort << "\n";	
}

//void VisaAPI::CheckStatus(ViStatus nStatus) {
//	if (nStatus < VI_SUCCESS) {
//		std::cout << "VisaAPI: Error thrown " << nStatus << "\n";
//		// TODO: Add exception here
//	}
//}

void VisaAPI::CheckErrorMsg(std::string errorMsg) {
	if (nStatus < VI_SUCCESS) {
		std::cout << "VisaAPI: Error thrown " << std::hex << nStatus << std::dec << "\n";
		std::cout << "VisaAPI: " << errorMsg.c_str() << "\n";
		// TODO: Add exception here
	}
}