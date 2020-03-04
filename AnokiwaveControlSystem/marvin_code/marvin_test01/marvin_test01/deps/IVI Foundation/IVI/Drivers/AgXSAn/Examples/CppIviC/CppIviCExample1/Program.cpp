/******************************************************************************
*                                                                         
* Copyright  Keysight Technologies 2011-2015
*****************************************************************************/
#include "stdafx.h"
#include <stdio.h>
#include "AgXSAn.h"
#include <windows.h>
// Link to: <Program Files>\IVI Foundation\IVI\Lib\msc\AgXSAn.lib

///
/// Keysight IVI-C Driver Example Program
/// 
/// Initializes the driver, reads a few Identity interface properties, and checks the instrument error queue.
/// May include additional instrument specific functionality.
/// 
/// See driver help topic "Programming with the IVI-C Driver in Various Development Environments"
/// for additional programming information.
///
/// Runs in simulation mode without an instrument.
/// 

int _tmain(int argc, _TCHAR* argv[])
{
	ViStatus status;
	ViSession session;
	ViChar str[128];
	ViInt32 ErrorCode;
	ViChar ErrorMessage[256];
	ViBoolean simulate;
	ViReal64 tracedata[100];
	ViInt32 ActualSize;
	ViReal64 pstdata[100];
	ViInt32 pstActualSize;
	int idx;
	int idx1;
	char pName[] = "BASIC"; // Before using, make sure that your instrument has the said personality installed else use a different personality name here.

	ViReal64 fPeakExcursion = 0;
	ViReal64 fMarkerPosition = 0;
	ViReal64 fMarkerAmplitude = 0;
	// Edit resource and options as needed.  resource is ignored if option Simulate=true
	char resource[] = "TCPIP0::<ip or host name>::INSTR";
	 //resource = "TCPIP0::<ip or hostname>::INSTR";

	char options[]  = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut";

	ViBoolean idQuery = VI_TRUE;
	ViBoolean reset   = VI_TRUE;

	printf("  C_Example1\n\n");

	// Initialize the driver.  See driver help topic "Initializing the IVI-C Driver" for additional information
	status = AgXSAn_InitWithOptions(resource, idQuery, reset, options, &session);
	if(status)
	{
		// Initialization failed
		AgXSAn_GetError(session, &ErrorCode, 255, ErrorMessage);
		printf("** InitWithOptions() Error: %d, %s\n", ErrorCode, ErrorMessage);
		printf("\nDone - Press Enter to Exit");
		getchar();  
		return ErrorCode;
	}
	assert(session != VI_NULL);
	printf("Driver Initialized \n");

	// Read and output a few attributes
	// Return status checking omitted for example clarity
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_SPECIFIC_DRIVER_PREFIX, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_PREFIX:      %s\n", str);
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_SPECIFIC_DRIVER_REVISION, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_REVISION:    %s\n", str);
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_SPECIFIC_DRIVER_VENDOR, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_VENDOR:      %s\n", str);
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_SPECIFIC_DRIVER_DESCRIPTION, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_DESCRIPTION: %s\n", str);
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_INSTRUMENT_MODEL, 127, str);
	assert(status == VI_SUCCESS);
	printf("INSTRUMENT_MODEL:   %s\n", str);
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_INSTRUMENT_FIRMWARE_REVISION, 127, str);
	assert(status == VI_SUCCESS);
	printf("FIRMWARE_REVISION:  %s\n", str);
	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_SYSTEM_SERIAL_NUMBER, 127, str);
	assert(status == VI_SUCCESS);
	printf("SERIAL_NUMBER:      %s\n", str);
	status = AgXSAn_GetAttributeViBoolean(session, "", AGXSAN_ATTR_SIMULATE, &simulate);
	assert(status == VI_SUCCESS);
	if (simulate == VI_TRUE)
		wprintf(L"\nSIMULATE:           True\n\n");
	else
		wprintf(L"SIMULATE:           False\n\n");


	status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_INSTRUMENT_MODEL, 127, str);
	if(strcmp(str,"M9420A") != 0 && strcmp(str,"M9421A") != 0 && strcmp(str,"M90XA") != 0 && strcmp(str,"M8920A") != 0 && strcmp(str,"M9410A") != 0)
	{
		wprintf(L"\n");
		wprintf(L"\n\n-------- DEMO MARKER MEASUREMENT -------");
		wprintf(L"\n");

		//Set the analyzer center frequency to 50MHZ
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_FREQUENCY_CENTER, 50000000);
		//Set the analyzer span to 50MHZ
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_FREQUENCY_SPAN, 50000000);
		//Turn on the 50 MHz calibrator signal
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_INPUT_AMPLITUDE_REFERENCE, 0);
		//Set analyzer to continuous sweep mode
		status = AgXSAn_SetAttributeViBoolean(session, "", AGXSAN_ATTR_SWEEP_MODE_CONTINUOUS, VI_TRUE);
		//User enters the peak excursion value

		wprintf(L"\nEnter PEAK EXCURSION in dB: ");
		wscanf_s(L"%lf", &fPeakExcursion);
		fflush(stdin);
		//Set the peak excursion
		status = AgXSAn_SetAttributeViReal64(session, "", AGXSAN_ATTR_SA_MARKER_PEAK_EXCURSION, fPeakExcursion);
		//Set the peak thresold
		status = AgXSAn_SetAttributeViReal64(session, "", AGXSAN_ATTR_SA_MARKER_THRESHOLD, -90);
		//Trigger a sweep and wait for completion
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_TRIGGER_SOURCE, 2);
		Sleep(2000);
		//Set the marker to the maximum peak
		status = AgXSAn_SAMarkerSearch(session, 1);
		//Query, read and display the marker frequency
		status = AgXSAn_GetAttributeViReal64(session, "", AGXSAN_ATTR_SA_MARKER_POSITION, &fMarkerPosition);
		wprintf(L"\nRESULT: Marker Frequency is: %f Hz", fMarkerPosition);
		status = AgXSAn_GetAttributeViReal64(session, "", AGXSAN_ATTR_SA_MARKER_AMPLITUDE, &fMarkerAmplitude);
		wprintf(L"\nRESULT: Marker Amplitude is: %f DB ", fMarkerAmplitude);

		wprintf(L"\n");
		wprintf(L"\n\n-------- DEMO INTERNAL ALIGNMENT -------");
		wprintf(L"\n");
		wprintf(L"\nPerforming self-alignment...");
		//Initiate self-alignment
		status = AgXSAn_CalibrationCalibrate(session);

		wprintf(L"\nAlignment successful");


		wprintf(L"\n");
		wprintf(L"\n\n-------- DEMO TRACE DATA READ -------");
		wprintf(L"\n");

		//Set the analyzer center frequency to 50MHZ
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_FREQUENCY_CENTER, 50000000);
		//Set the analyzer span to 50MHZ
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_FREQUENCY_SPAN, 50000000);
		//Turn on the 50 MHz calibrator signal
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_INPUT_AMPLITUDE_REFERENCE, 0);
		//Set analyzer to continuous sweep mode
		status = AgXSAn_SetAttributeViBoolean(session, "", AGXSAN_ATTR_SWEEP_MODE_CONTINUOUS, VI_TRUE);
		status = AgXSAn_SetAttributeViReal64(session, "", AGXSAN_ATTR_DISPLAY_Y_SCALE, 10);

		status = AgXSAn_ReadYTrace(session, "TRACE1", 10000, 100, &ActualSize, tracedata);
		wprintf(L"\nTrace Data : ");
		for (idx=0; idx< ActualSize; idx++)
		{
			wprintf(L"\n%f", tracedata[idx]);
		}

		wprintf(L"\n");
		wprintf(L"\n\n-------- DEMO POWER SUITE MEASUREMENT-------");
		wprintf(L"\n");

		//Set the analyzer center frequency to 50MHZ
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_FREQUENCY_CENTER, 50000000);
		//Set the analyzer span to 50MHZ
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_FREQUENCY_SPAN, 50000000);
		//Turn on the 50 MHz calibrator signal
		status = AgXSAn_SetAttributeViInt32(session, "", AGXSAN_ATTR_INPUT_AMPLITUDE_REFERENCE, 0);
		//Set analyzer to continuous sweep mode
		status = AgXSAn_SetAttributeViBoolean(session, "", AGXSAN_ATTR_SWEEP_MODE_CONTINUOUS, VI_TRUE);
		status = AgXSAn_SetAttributeViReal64(session, "", AGXSAN_ATTR_DISPLAY_Y_SCALE, 10);
		status = AgXSAn_SAPowerStatisticsConfigure(session);
		status = AgXSAn_SAPowerStatisticsTracesInitiate(session);
		status = AgXSAn_SAPowerStatisticsTraceRead(session, "PST_Results", 40000, 100, pstdata, &pstActualSize);
		wprintf(L"\nCCDF Data : ");
		for (idx1=0; idx1< pstActualSize; idx1++)
		{
			wprintf(L"\n%f", pstdata[idx1]);
		}
	}
	else
	{
		wprintf(L"\n M9420A, M9421A, M8920A, M9410A and M90XA doesn't supports the SA application, they only supports few basic SA common commands, so this example will not work fully with this model.\n");
	}

	// Check instrument for errors
	ErrorCode = -1;
	printf("\n");
	while(ErrorCode!=0)
	{
		status = AgXSAn_error_query( session, &ErrorCode, ErrorMessage);
		assert(status == VI_SUCCESS);
		printf("error_query: %d, %s\n", ErrorCode, ErrorMessage);
	}

	// Close the driver
	status = AgXSAn_close(session);
	assert(status == VI_SUCCESS);
	session = VI_NULL;
	printf("Driver Closed \n");

	printf("\nDone - Press Enter to Exit");
	getchar();

	return 0;
}
