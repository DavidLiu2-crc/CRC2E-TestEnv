/***************************************************
 *     Copyright Keysight Technologies 2012-2019
 **************************************************/
#include "stdafx.h"
#include <stdio.h>
#include "AgXSAnBasic.h"
#include "AgXSAn.h"
#include <windows.h>
/*
#include <atlstr.h>
#include <atlsafe.h>
#import "GlobMgr.dll"			no_namespace // VISA-COM I/O funtionality
#import "IviDriverTypeLib.dll"	no_namespace // IVI inherent functionality
#import "AgXSAnBasic.dll"		no_namespace // AgXSAnBasic driver functionality
#import <AgXSAn.dll>     no_namespace
*/
// Link to: <Program Files>\IVI Foundation\IVI\Lib\msc\AgXSAnBasic.lib

///
/// AgXSAnBasic IVI-C Driver Example Program
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
	ViSession sessionXSAn;
	ViChar str[128];
	ViInt32 ErrorCode;
	ViChar ErrorMessage[256];
	ViBoolean simulate;
	ViInt32 MaxTimeMilliseconds = 5000;

	ViInt32 Length = 8000;
	ViInt32 BlockSize = 2000;
	ViInt32 ValBufferSize=8000 ;
	ViReal64 Val[8000] = { 0 };
	ViInt32 ValActualSize = 0;

	ViConstString WaveformTrace = "WfmTraceRawIQ";
	ViConstString SpectrumTrace = "RawIQ";
	ViInt32 points;
	ViInt32 i;
	ViReal64 CenterFreq;
	ViReal64 Attenuation;

	// Edit resource and options as needed.  resource is ignored if option Simulate=true
	char resource[] = "GPIB0::18::INSTR";
	//char resource[] = "TCPIP0::<ip or host name>::INSTR";

	char options[]  = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut";

	ViBoolean idQuery = VI_TRUE;
	ViBoolean reset   = VI_TRUE;

	printf("  C_Example1\n\n");

	// Initialize the driver.  See driver help topic "Initializing the IVI-C Driver" for additional information
	status = AgXSAnBasic_InitWithOptions(resource, idQuery, reset, options, &session);
	status = AgXSAn_InitWithOptions(resource, idQuery, reset, options, &sessionXSAn);

	if(status)
	{
		// Initialization failed
		AgXSAnBasic_GetError(session, &ErrorCode, 255, ErrorMessage);
		printf("** InitWithOptions() Error: %d, %s\n", ErrorCode, ErrorMessage);
		printf("\nDone - Press Enter to Exit");
		getchar();  
		return ErrorCode;
	}
	assert(session != VI_NULL);
	printf("Driver Initialized \n");

	// Read and output a few attributes
	// Return status checking omitted for example clarity
	status = AgXSAnBasic_GetAttributeViString(session, "", AGXSANBASIC_ATTR_SPECIFIC_DRIVER_PREFIX, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_PREFIX:      %s\n", str);
	status = AgXSAnBasic_GetAttributeViString(session, "", AGXSANBASIC_ATTR_SPECIFIC_DRIVER_REVISION, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_REVISION:    %s\n", str);
	status = AgXSAnBasic_GetAttributeViString(session, "", AGXSANBASIC_ATTR_SPECIFIC_DRIVER_VENDOR, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_VENDOR:      %s\n", str);
	status = AgXSAnBasic_GetAttributeViString(session, "", AGXSANBASIC_ATTR_SPECIFIC_DRIVER_DESCRIPTION, 127, str);
	assert(status == VI_SUCCESS);
	printf("DRIVER_DESCRIPTION: %s\n", str);
	status = AgXSAnBasic_GetAttributeViString(session, "", AGXSANBASIC_ATTR_INSTRUMENT_MODEL, 127, str);
	assert(status == VI_SUCCESS);
	printf("INSTRUMENT_MODEL:   %s\n", str);
	status = AgXSAnBasic_GetAttributeViString(session, "", AGXSANBASIC_ATTR_INSTRUMENT_FIRMWARE_REVISION, 127, str);
	assert(status == VI_SUCCESS);
	printf("FIRMWARE_REVISION:  %s\n", str);
	status = AgXSAn_GetAttributeViString(sessionXSAn, "", AGXSAN_ATTR_SYSTEM_SERIAL_NUMBER, 127, str);
	assert(status == VI_SUCCESS);
	printf("SERIAL_NUMBER:      %s\n", str);
	status = AgXSAnBasic_GetAttributeViBoolean(session, "", AGXSANBASIC_ATTR_SIMULATE, &simulate);
	assert(status == VI_SUCCESS);
	if (simulate == VI_TRUE)
		printf("\nSIMULATE:           True\n\n");
	else
		printf("SIMULATE:           False\n\n");


	//Set Center frequency to 2.5 GHz using AgXSAn host driver
				status = AgXSAn_SetAttributeViReal64(sessionXSAn,"",AGXSAN_ATTR_FREQUENCY_CENTER,2.5E+9);
				status = AgXSAn_GetAttributeViReal64(sessionXSAn,"",AGXSAN_ATTR_FREQUENCY_CENTER,&CenterFreq);
				printf("\nCenter Frequency is set to : %g Hz\n",   CenterFreq);    
                //Set Input port to RF using AgXSAn host driver
				status = AgXSAn_SetAttributeViInt32(sessionXSAn,"",AGXSAN_ATTR_INPUT_PORT,AGXSAN_VAL_INPUT_PORT_RF);

//*****************************Spectrum Section Start*****************************************
				printf("\nSpectrum Measurement \n");

                //Set frequency span to 25 MHz
				status = AgXSAnBasic_SetAttributeViReal64(session,"",AGXSANBASIC_ATTR_SPECTRUM_FREQUENCY_SPAN ,25E+6);
                printf("Frequency span is set to : %g Hz\n",25E+6);
				
				//read Spectrum          
				status = AgXSAnBasic_SpectrumTraceRead(session, SpectrumTrace, MaxTimeMilliseconds, ValBufferSize, Val, &ValActualSize);
                printf("Spectrum Ouput: \n");
                points = ValActualSize;
				printf("Spectrum Points : %d : Data:", points);
                if (points > 100) points = 100;
                for (i = 0; i < points; i++)
                {
                    printf("%g\n",Val[i]);
                    if (i < points - 1)
                        printf(", ");
                }
 //*****************************Spectrum Section End*****************************************   
				
 //*****************************Waveform Section Start*****************************************          
				printf("\nWaveform Measurement \n");

				//Configure Waveform
				status = AgXSAnBasic_WaveformConfigure(session);
				
				status = AgXSAn_GetAttributeViString(session, "", AGXSAN_ATTR_INSTRUMENT_MODEL, 127, str);
				if((strcmp(str,"M9420A") != 0) && (strcmp(str,"M9421A") != 0) && (strcmp(str,"M8920A") != 0) && (strcmp(str,"M90XA") != 0))
				{
					//Set power attenuation using the AgXSAn host driver to 20
					status = AgXSAn_SetAttributeViReal64(sessionXSAn,"",AGXSAN_ATTR_ATTENUATION ,20.0);
					status = AgXSAn_GetAttributeViReal64(sessionXSAn,"",AGXSAN_ATTR_ATTENUATION ,&Attenuation);
					printf("Power Attenuation is set to : %g\n",Attenuation);
				}
                //Set Sweep time to 5 ms
				status = AgXSAnBasic_SetAttributeViReal64(session,"",AGXSANBASIC_ATTR_WAVEFORM_SWEEP_TIME,5E-3);
                printf("SweepTime is set to : %g Seconds\n" ,5E-3);  
                
				//read Waveforms
				status = AgXSAnBasic_WaveformTraceRead(session, WaveformTrace, MaxTimeMilliseconds, ValBufferSize, Val, &ValActualSize);               
				printf("Waveform Ouput: \n");
                points = ValActualSize;
				printf("Waveform Points : %d : Data: ", points);
                if (points > 100) points = 100;
                for (i = 0; i < points; i++)
                {
					printf("%g\n",Val[i]);
                    if (i < points - 1)
                        printf(", ");
                }
 //*****************************Waveform Section End*****************************************          
  

	// Check instrument for errors
	ErrorCode = -1;
	printf("\n");
	while(ErrorCode!=0)
	{
		status = AgXSAnBasic_error_query( session, &ErrorCode, ErrorMessage);
		assert(status == VI_SUCCESS);
		printf("error_query: %d, %s\n", ErrorCode, ErrorMessage);
	}

	// Close the driver
	status = AgXSAnBasic_close(session);
	assert(status == VI_SUCCESS);
	session = VI_NULL;
	printf("Driver Closed \n");

	printf("\nDone - Press Enter to Exit");
	getchar();

	return 0;
}
