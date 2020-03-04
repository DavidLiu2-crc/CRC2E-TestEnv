/******************************************************************************
*                                                                         
* Copyright  Keysight Technologies 2011-2015
*****************************************************************************/
#include "stdafx.h"
#include <atlstr.h>
#include <atlsafe.h>
#include <windows.h>
#import "GlobMgr.dll"			no_namespace // VISA-COM I/O funtionality
#import "IviDriverTypeLib.dll"	no_namespace // IVI inherent functionality
#import "IviSpecAnTypeLib.dll"     no_namespace // IVI SpecAn functionality
#import "AgXSAn.dll"		no_namespace // Keysight driver functionality

///
/// Keysight IVI-COM Driver Example Program
/// 
/// Creates a driver object, reads a few Identity interface properties, and checks the instrument error queue.
/// May include additional instrument specific functionality.
/// 
/// See driver help topic "Programming with the IVI-COM Driver in Various Development Environments"
/// for additional programming information.
///
/// Runs in simulation mode without an instrument.
/// 

int _tmain(int argc, _TCHAR* argv[])
{
	::CoInitialize(NULL);
	printf("  Cpp_Example1\n\n");

	try
	{
		// Create an instance of the driver.
		IAgXSAnPtr spDriver(__uuidof(AgXSAn));

		try
		{
			// Edit resource and options as needed.  Resource is ignored if option Simulate=true
			CString strResourceDesc = "MyAlias";
			//strResourceDesc = "TCPIP0::<ip or hostname>::INSTR";

			CString strInitOptions = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut";

			VARIANT_BOOL idQuery = VARIANT_TRUE;
			VARIANT_BOOL reset   = VARIANT_TRUE;

			// Initialize the driver.  See driver help topic "Initializing the IVI-COM Driver" for additional information
			spDriver->Initialize(LPCTSTR(strResourceDesc), idQuery, reset, LPCTSTR(strInitOptions));	
			printf("Driver Initialized\n");

			// Print a few IIviDriverIdentity properties
			wprintf(L"Identifier:  %s\n", spDriver->Identity->Identifier.GetBSTR());
			wprintf(L"Revision:    %s\n", spDriver->Identity->Revision.GetBSTR());
			wprintf(L"Vendor:      %s\n", spDriver->Identity->Vendor.GetBSTR());
			wprintf(L"Description: %s\n", spDriver->Identity->Description.GetBSTR());
			wprintf(L"Model:       %s\n", spDriver->Identity->InstrumentModel.GetBSTR());
			wprintf(L"FirmwareRev: %s\n", spDriver->Identity->InstrumentFirmwareRevision.GetBSTR());
			wprintf(L"Serial #:    %s\n", spDriver->System->SerialNumber.GetBSTR());
			VARIANT_BOOL boolSimulate = spDriver->DriverOperation->Simulate;
			if (boolSimulate == VARIANT_TRUE)
				wprintf(L"\nSimulate:    True\n\n");
			else
				wprintf(L"Simulate:    False\n\n");

			CString _Model = spDriver->Identity->InstrumentModel.GetBSTR();
			if(_Model != _T("M9420A") && _Model != _T("M9421A") && _Model != _T("M90XA") && _Model != _T("M8920A") && _Model != _T("M9410A"))
			{
				wprintf(L"\n");
				wprintf(L"\n\n-------- DEMO MARKER MEASUREMENT -------");
				wprintf(L"\n");

				//Set the analyzer center frequency to 50MHZ
				spDriver->Frequency->Center = 50000000.0;
				//Set the analyzer span to 50MHZ
				spDriver->Frequency->Span = 50000000.0;
				//Turn on the 50 MHz calibrator signal
				spDriver->Input->AmplitudeReference = AgXSAnInputAmplitudeReference50;
				//Set analyzer to continuous sweep mode
				spDriver->Acquisition->ContinuousSweepModeEnabled = VARIANT_TRUE;
				//User enters the peak excursion value
				double fPeakExcursion = 0;
				wprintf(L"\nEnter PEAK EXCURSION in dB: ");
				wscanf_s(L"%lf", &fPeakExcursion);
				fflush(stdin); 
				//Set the peak excursion
				spDriver->SA->Marker->PeakExcursion = fPeakExcursion;
				//Set the peak thresold
				spDriver->SA->Marker->Threshold = -90;
				//Trigger a sweep and wait for completion
				spDriver->Trigger->Source = AgXSAnTriggerSourceImmediate;
				Sleep(2000);
				//Set the marker to the maximum peak
				spDriver->SA->Marker->Search(AgXSAnMarkerSearchHighest);
				//Query, read and display the marker frequency
				wprintf(L"\nRESULT: Marker Frequency is: %f Hz ", spDriver->SA->Marker->Position);
				//Query, read and display the marker amplitude
				wprintf(L"\nRESULT: Marker Amplitude is: %f DB ", spDriver->SA->Marker->Amplitude);

				wprintf(L"\n");
				wprintf(L"\n\n-------- DEMO INTERNAL ALIGNMENT -------");
				wprintf(L"\n");
				wprintf(L"\nPerforming self-alignment...");
				//Initiate self-alignment
				spDriver->Calibration->Calibrate();

				wprintf(L"\nAlignment Successful");


				wprintf(L"\n");
				wprintf(L"\n\n-------- DEMO REAL64 TRACE DATA READ -------");
				wprintf(L"\n");

				//Set the analyzer center frequency to 50MHZ
				spDriver->Frequency->Center = 50000000.0;
				//Set the analyzer span to 50MHZ
				spDriver->Frequency->Span = 50000000.0;
				//Turn on the 50 MHz calibrator signal
				spDriver->Input->AmplitudeReference = AgXSAnInputAmplitudeReference50;
				//Set analyzer to continuous sweep mode
				spDriver->Acquisition->ContinuousSweepModeEnabled = VARIANT_TRUE;
				//Specify 10 dB per division for the amplitude scale.
				spDriver->Display->YScale = 10;

				//Trigger a sweep and wait for sweep to complete Query the trace data
				int idx;
				CComSafeArray<double> TraceData;
				TraceData.Attach(spDriver->Traces->GetItem("TRACE1")->ReadY(10000));
				wprintf(L"\nTrace Data : ");
				for (idx=TraceData.GetLowerBound(); idx<= TraceData.GetUpperBound(); idx++)
				{
					wprintf(L"\n%f", TraceData[idx]);
				}
				TraceData.Destroy();

				wprintf(L"\n");
				wprintf(L"\n\n-------- DEMO POWER SUITE MEASUREMENT -------");
				wprintf(L"\n");

				//Set the analyzer center frequency to 50MHZ
				spDriver->Frequency->Center = 50000000.0;
				//Set the analyzer span to 50MHZ
				spDriver->Frequency->Span = 50000000.0;
				//Turn on the 50 MHz calibrator signal
				spDriver->Input->AmplitudeReference = AgXSAnInputAmplitudeReference50;
				//Set analyzer to continuous sweep mode
				spDriver->Acquisition->ContinuousSweepModeEnabled = VARIANT_TRUE;
				//Specify 10 dB per division for the amplitude scale.
				spDriver->Display->YScale = 10;
				// Initiate CCDF pwer suite measurment
				//Trigger a sweep and wait for sweep to complete
				//Trigger a sweep and wait for completion
				spDriver->SA->PowerStatistics->ConfigureNoPreset();
				spDriver->SA->PowerStatistics->Traces->Initiate();
				//Query the trace data 
				int idx1;
				CComSafeArray<double> CCDFData;
				CCDFData.Attach(spDriver->SA->PowerStatistics->Traces->GetItem("PST_results")->Read(10000));
				wprintf(L"\nCCDF Data : ");
				for (idx1=CCDFData.GetLowerBound(); idx1<= CCDFData.GetUpperBound(); idx1++)
				{
					wprintf(L"\n%f", CCDFData[idx1]);
				}
				CCDFData.Destroy();

				// Check instrument for errors.

				wprintf(L"\n");
				wprintf(L"\n\n-------- DEMO QUERY INSTR ERROR QUEUE -------");
				wprintf(L"\n");

			}
			else
			{
				wprintf(L"\nM9420A, M9421A, M8920A, M9410A and M90XA doesn't supports the SA application, they only supports few basic SA common commands, so this example will not work fully with this model.\n");
			}
			// Check instrument for errors
			long lErrorNum = -1;
			_bstr_t bstrErrorMsg;
			wprintf(L"\n");
			while (lErrorNum != 0)
			{
				spDriver->Utility->ErrorQuery(&lErrorNum, bstrErrorMsg.GetAddress());
				wprintf(L"ErrorQuery: %d, %s\n", lErrorNum, bstrErrorMsg.GetBSTR());
			}
		}
		catch (_com_error& e)
		{
			wprintf(e.Description(), e.ErrorMessage(), MB_ICONERROR);
		}

		if (spDriver != NULL && spDriver->Initialized)
		{
			// Close the driver
			spDriver->Close();
			printf("Driver Closed\n");
		}
	}
	catch (_com_error& e)
	{
		wprintf(e.Description(), e.ErrorMessage(), MB_ICONERROR);
	}

	::CoUninitialize();

	printf("\nDone - Press Enter to Exit");
	getchar();


	return 0;
}
