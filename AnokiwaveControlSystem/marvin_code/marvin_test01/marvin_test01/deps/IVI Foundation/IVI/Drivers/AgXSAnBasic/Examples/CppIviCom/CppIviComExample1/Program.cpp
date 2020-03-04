/***************************************************
 *     Copyright Keysight Technologies 2012-2019
 **************************************************/
#include "stdafx.h"
#include <atlstr.h>
#include <atlsafe.h>
#import "GlobMgr.dll"			no_namespace // VISA-COM I/O funtionality
#import "IviDriverTypeLib.dll"	no_namespace // IVI inherent functionality
#import "AgXSAnBasic.dll"		no_namespace // AgXSAnBasic driver functionality
#import <AgXSAn.dll>     no_namespace
bool m_nIsB40Installed;
///
/// AgXSAnBasic IVI-COM Driver Example Program
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
		IAgXSAnBasicPtr spAgXSAnBasicDriver(__uuidof(AgXSAnBasic));
		//Create an Instance of the AgXSAn host driver.
		IAgXSAnPtr spAgXSAnDriver(__uuidof(AgXSAn));
	
		try
		{
			// Edit resource and options as needed.  Resource is ignored if option Simulate=true
			//CString strResourceDesc = "TCPIP0::146.208.247.12::5025::SOCKET";
			CString strResourceDesc = "GPIB0::18::INSTR";

			//strResourceDesc = "TCPIP0::<ip or hostname>::INSTR";

			CString strInitOptions = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut";
				
			VARIANT_BOOL idQuery = VARIANT_TRUE;
			VARIANT_BOOL reset   = VARIANT_TRUE;

			// Initialize the driver.  See driver help topic "Initializing the IVI-COM Driver" for additional information
			spAgXSAnBasicDriver->Initialize(LPCTSTR(strResourceDesc), idQuery, reset, LPCTSTR(strInitOptions));	
			spAgXSAnDriver->Initialize(LPCTSTR(strResourceDesc), idQuery, reset, LPCTSTR(strInitOptions));
			printf("Driver Initialized\n");
			
			// Print a few IIviDriverIdentity properties
			wprintf(L"Identifier:  %s\n", spAgXSAnBasicDriver->Identity->Identifier.GetBSTR());
			wprintf(L"Revision:    %s\n", spAgXSAnBasicDriver->Identity->Revision.GetBSTR());
			wprintf(L"Vendor:      %s\n", spAgXSAnBasicDriver->Identity->Vendor.GetBSTR());
			wprintf(L"Description: %s\n", spAgXSAnBasicDriver->Identity->Description.GetBSTR());
			wprintf(L"Model:       %s\n", spAgXSAnBasicDriver->Identity->InstrumentModel.GetBSTR());
			wprintf(L"FirmwareRev: %s\n", spAgXSAnBasicDriver->Identity->InstrumentFirmwareRevision.GetBSTR());
			wprintf(L"Serial #:    %s\n", spAgXSAnDriver->System->SerialNumber.GetBSTR());
			VARIANT_BOOL boolSimulate = spAgXSAnBasicDriver->DriverOperation->Simulate;
			if (boolSimulate == VARIANT_TRUE)
				wprintf(L"\nSimulate:    True\n\n");
			else
				wprintf(L"Simulate:    False\n\n");


			//Set Center frequency to 2.5 GHz using AgXSAn host driver
                spAgXSAnDriver->Frequency->Center = 2.5E+9;
				wprintf(L"Center Frequency is set to : %g Hz\n",   spAgXSAnDriver->Frequency->Center);    
                //Set Input port to RF using AgXSAn host driver
                spAgXSAnDriver->Input->Port = AgXSAnInputPortRF;

//*****************************Spectrum Section Start*****************************************
				printf("\nSpectrum Measurement  \n");

                //Set frequency span to 25 MHz
                double frequencySpan = 25E+6;
                spAgXSAnBasicDriver->Spectrum->FrequencySpan = frequencySpan;
                wprintf(L"Frequency span is set to : %g Hz\n",  frequencySpan);
      
				//read Spectrum	
				SAFEARRAY *sSA;
				
				sSA = spAgXSAnBasicDriver->Spectrum->Traces->GetItem(spAgXSAnBasicDriver->Spectrum->Traces->GetName(1))->Read(5000);
                wprintf(L"Spectrum Ouput:\n ");
				CComSafeArray<double> sCSA;
				sCSA.Attach(sSA);
				int points;
				points = sCSA.GetCount();
				printf("Spectrum Points : %d : Data: ", points);
                if (points > 100) points = 100;
                for (int i = 0; i < points; i++)
                {

                    printf("%g\n",sCSA[i]);
                    if (i < points - 1)
                        printf(", ");
                }
				sCSA.Destroy();
				::SafeArrayDestroy(sSA);
 //*****************************Spectrum Section End*****************************************   

				

 //*****************************Waveform Section Start*****************************************          
				printf("\nWaveform Measurement \n");

				//Configure Waveform
                spAgXSAnBasicDriver->Waveform->Configure();


				CString _Model = spAgXSAnBasicDriver->Identity->InstrumentModel.GetBSTR();
				if((_Model != _T("M9420A")) && (_Model != _T("M9421A")) && (_Model != _T("M8920A")) && (_Model != _T("M90XA")))
				{
					//Set power attenuation using the AgXSAn host driver to 20
					double powerAttenuation = 20;        
					spAgXSAnDriver->Level->Attenuation = powerAttenuation;
					wprintf(L"Power Attenuation is set to : %g\n", spAgXSAnDriver->Level->Attenuation);
				}
                
                //Set Sweep time to 5 ms
                double sweepTime = 5E-3;
                spAgXSAnBasicDriver->Waveform->SweepTime = sweepTime;
                wprintf(L"SweepTime is set to : %g Seconds\n",  sweepTime );

                //Read waveform		
				SAFEARRAY *wSA;
				wSA = spAgXSAnBasicDriver->Waveform->Traces->GetItem(spAgXSAnBasicDriver->Waveform->Traces->GetName(1))->Read(5000);				
				wprintf(L"Waveform Ouput: \n");
				CComSafeArray<double> wCSA;
				wCSA.Attach(wSA);
				
				points = wCSA.GetCount();
				printf("Waveform Points : %d : Data: ", points);
                if (points > 100) points = 100;
                for (int i = 0; i < points; i++)
                {

                    printf("%g\n",wCSA[i]);
                    if (i < points - 1)
                        printf(", ");
                }
				
				wCSA.Destroy();
				::SafeArrayDestroy(wSA);
 //*****************************Waveform Section End*****************************************          
         


			// Check instrument for errors
			long lErrorNum = -1;
			_bstr_t bstrErrorMsg;
			wprintf(L"\n");
			while (lErrorNum != 0)
			{
				spAgXSAnBasicDriver->Utility->ErrorQuery(&lErrorNum, bstrErrorMsg.GetAddress());
				wprintf(L"ErrorQuery: %d, %s\n", lErrorNum, bstrErrorMsg.GetBSTR());
			}
		}
		catch (_com_error& e)
		{
			wprintf(e.Description(), e.ErrorMessage(), MB_ICONERROR);
		}

		if (spAgXSAnBasicDriver != NULL && spAgXSAnBasicDriver->Initialized)
		{
			// Close the driver
			spAgXSAnBasicDriver->Close();
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
