			***********************
			**** Read Me First ****
			***********************

Version: 3.6.1.0		Jan 2019

Introducing the AgXSAn IVI Driver for the Keysight X series analyzers
---------------------------------------------------------------------------
  This instrument driver provides access to the functionality of the 
  Spectrum Analyzer(Common functionalities and SA personality specifics) through a COM server or
  ANSI C API which also complieswith the IVI specifications. This driver works in any development
  environment which supports COM or C programming including Microsoft Visual C++, Microsoft
  .NET, Keysight VEE Pro, National Instruments LabView, LabWindows CVI, MATLAB(32
  bit only) and others.


Supported Instruments
---------------------
N9000A
N9000B
N9010A
N9010B
N9020A
N9020B
N9030A
N9030B
N9038A
M9290A
N9040B
N9041B
M9420A
M9421A
SPN9003A
SPN9026A
N8973B
N8974B
N8975B
N8976B
M90XA 
M8920A
M9410A
 
Installation
-------------
  System Requirements: The driver installation will check for the following 
  requirements.  If not found, the installer will either abort, warn, or 
  install the required component as appropriate.

  Supported Operating Systems:
    Windows 7 32-bit, 64-bit
    Windows 8 32-bit, 64-bit
    Windows 10 32-bit, 64-bit

  Shared Components
    Before this driver can be installed, your computer must already have:
    IVI Shared Components Version: 2.4.2 or newer installed
    
    The IVI Shared Components installers are available from: 
    http://www.ivifoundation.org/shared_components/Default.aspx
   

  VISA-COM
    Any compliant implementation is acceptable. Typically, VISA-COM is installed
    with VISA and other I/O library modules.  The latest version of Keysight's IO
    Libraries is recommended and includes VISA-COM.
    You can download the latest version from:
    http://www.keysight.com/find/iosuite 

	
Uninstall
---------
  This driver can be uninstalled like any other software from the Control Panel 
  using "Add or Remove Programs" or "Programs and Features" dialog.

  The IVI Shared Components may also be uninstalled like any other software from
  the Control Panel using the "Add or Remove Programs" or "Program & 
  Features" dialog.

  Note: All IVI-COM/C drivers require the IVI Shared Components to function. To 
  completely remove IVI components from your computer, uninstall all drivers and
  then uninstall the IVI Shared Components.

  
Source Code
-----------
  Driver source code is available by enabling the "Source Code" option in the
  "Custom Setup" dialog when installing the driver.  This code is provided as
  is for informational purposes only.  Modification of this code is not 
  supported.  Code is a Visual Studio 2010 C++ project and may be updated to new
  versions of Visual Studio.

  Caution: Once you have installed version 2.x of the IVI Shared Components, 
  you will not be able to build IVI drivers and applications developed with 
  earlier versions. You will need to upgrade those drivers/applications to the 
  new IVI Shared Components and to build on Visual Studio 2010 or higher or you 
  will need to build those drivers/applications on a different machine that does
  not have version 2.x of the IVI Shared Components.

  
Start Menu Help File 
--------------------
  A shortcut to the driver help file is added to the Start Menu, All Programs, 
  Keysight IVI Drivers, AgXSAn group.  It contains   "Getting Started" 
  information on using the driver in a variety of programming environments as 
  well as documentation on IVI and instrument specific  methods and properties.

  You will also see shortcuts to the Readme and Introduction files and 
  programming examples for this driver.


Additional Setup
----------------
  .NET Framework
  The .NET Framework itself is not required by this driver. If you plan to use 
  the driver with .NET, the minimal .NET framework version is: 2.0

  The .NET Framework requires an interop assembly for a COM server. A Primary
  Interop Assembly, along with an XML file for IntelliSense is installed with
  the driver. The driver's PIA along with IVI PIAs are installed by default in:
  drive:\<Program Files>\IVI Foundation\IVI\Bin\Primary Interop Assemblies

  The PIA is also installed into the Global Assembly Cache (GAC) if you have the
  .NET framework installed.


Using a New Version of the Driver
---------------------------------
  New versions of this Keysight IVI-COM/C driver may have a new ProgId.

  If you use the version dependent ProgId in CoCreateInstance, you will need to 
  modify and recompile your code to use the new ProgID once you upgrade to the 
  next version of the driver.  Doing a side-by-side installation of the driver 
  to use multiple versions of the driver is not supported.  If you need to go 
  back to an older version of the driver, you need to uninstall the later
  version and install the older version.

  If you use the version independent ProgId in CoCreateInstance, you will not 
  need to modify and recompile your code.  The new version of the driver has 
  been tested to be backwards compatible with previous versions.

  To access the new functionality in a new version of the driver you will need 
  to use the latest numbered IAgXSAn[n] interface rather than the IAgXSAn 
  interface.  The IAgXSAn[n].<interface> property will return a pointer
  to the new IAgXSAn<interface>[n] interface.  The IAgXSAn<interface>[n] 
  interface contains the methods and properties for the new functionality and 
  inherits all prior interface functionality.  The new interfaces were 
  introduced rather than modifying the existing interfaces for backwards 
  compatibility.  The interfaces that were previously shipped have not been 
  changed.
  
  Pre-existing .NET client applications must be re-build before using the new 
  version of the driver.

  
Revision History
----------------
  Version      Date       Notes
  -------   -----------   -----
  3.6.1.0   Jan 2019     Model support M9410A added. Attribute AGXSAN_ATTR_INPUT_TYPE, AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_TYPE, AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_FORMAT, AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_WAVEFORM_TYPE, AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_WAVEFORM_TYPE, AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_FORMAT  enum values corrected.						 function AgXSAn_SSRFGeneratorModulationDigitalConfigureModulationFormatTestPattern, AgXSAn_SSRFGeneratorModulationDigitalQueryModulationFormatTestPattern, AgXSAn_SSRFGeneratorModulationDigitalConfigureModulationFormatTestPattern, AgXSAn_SSRFGeneratorModulationDigitalQueryModulationFormatTestPattern enum values corrected.
  3.5.7.0   July 2018	 Defect fixed
  3.5.6.0   May 2018     Model support M8920A added
  3.5.2.0   Sep 2017 	 Added Model support to Modular Instrument M90XA and added new SCPIs based on FW 19.5.
  3.4.2.0   Feb 2017     Added SCPIs to for "System Preset" , "Global Center Freq" , "Extended Low Band" and "External Trigger Compensation" functionality. Incresed the installation timeout of online help. Installer issue fixed to not abort install if help3 install fails.
  3.4.0.0   Nov 2016     N9041B support added.
  3.3.0.0   Jun 2016     M9421A support added.
  3.2.3.0   Dec 2015     Model support added for N9000B,N9010B, N9020B, N9030B, SPN9003A, SPN9026A, N8973B, N8974B, N8975B, N8976B. 
  3.1.2.0   Oct 2015     Implementation of IAgXSAnSystem.GetScreenImage method is modified to store the Screen.png file at D: incase of firmware version A.14 or earlier and to C:Temp incase of firmware version A.15 and later.
  3.1.1.0   Oct 2015     i)Customer issue fixed, changed the implementation of IAgXSAnInputRf.Coupling, removed the option checking and made equivalent to version before 3.0.0.0. Any option issue would be reported as error.
			ii) Customer issue Fixed, implementation logic of IAgXSAnCalibration.Calibrate() method is changed to read the status of calibration before returning and increased the timeout to 240 seconds to cater any delays or long calibration turnaround time.
			iii) Modified the implementation logic of Initialze method for M9420A and M9290A modules, in case of PXI address, it check for module name and then take the correct installation path of   LaunchModularSA.exe path based on the module name. 
			iv) IVI-C issue fixed for some functions which are taking input as  Null value.
			v)  Implementation of IAgXSAnSystem.GetScreenImage method is modified to remove the D: driver from the path.
			vi) Added trace numbers from 13 to 17 in SEMAsk measurement. Now user can access traces from 13 to 17.
  3.1.0.0   JUN 2015	M9420A model support added.
  3.0.0.0   April 2015  Tracking Generator support added to N9000A and M9290A models.
  2.2.1.0   Nov 2014    Rebranded Keysight Technologies, added support of UXA (N9040B) and CXI (M9290A).  
  2.1.4.0   April 2014	Customer issue fixed, Change the implementation of the IAgXSAnCalibration.Calibrate method to increase the timeout of :CALibration[:ALL] SCPI.
  2.1.3.0   Dec 2013    Customer issue, related to Application crash when calling init function (IVI-COM or IVI-C) if you use an address where there is no instrument available (instrument     is turned off or LAN cable is disconnected).
  2.1.2.0   June 2013	Defect fixes and system interface revised for adding ClearIO, ReadByte(),WriteByte(),ReadString(),WriteString() methods.
  2.0.0.0   May 2011	Applied updated policy. No functionality change.
  1.0.5.0   May 2011	Initial public release.
  

IVI Compliance 
--------------
IVI-COM/IVI-C IviSpecAn Compliant Instrument Specific Driver 

IVI Generation: IVI-2014
IVI Instrument Class: IviSpecAn
IviSpecAn: IVI-4.8   Revision: 2.0 

Group Capabilities Supported:
  IviSpecAnBase  		Yes 
  IviSpecAnMultitrace  		Yes 
  IviSpecAnMarker  		Yes 
  IviSpecAnTrigger  	        Yes 
  IviSpecAnExternalTrigger  	Yes 
  IviSpecAnSoftwareTrigger  	Yes
  IviSpecAnVideoTrigger  	Yes 
  IviSpecAnDisplay  		Yes 
  IviSpecAnMarkerType  		Yes 
  IviSpecAnDeltaMarker  	Yes 
  IviSpecAnExternalMixer  	Yes
  IviSpecAnPreselector  	Yes  

Optional Features: 
  Interchangeability Checking     No
  State Caching                   No
  Coercion Recording              No

Driver Identification: 
  Vendor:                         Keysight Technologies 
  Description:                    IVI Driver for Keysight X series analyzers
  Revision:                       3.6.0.0
  Component Identifier:           AgXSAn.AgXSAn

Hardware Information:
  Instrument Manufacturer:        Keysight Technologies
  Supported Instrument Models:    N9000A, N9010A, N9020A, N9030A, N9038A, M9290A, M90XA, M9420A, M9421A, M9410A,
				  N9010B, N9020B, N9030B, N9040B, N9041B, SPN9003A, SPN9026A, N8973B, N8974B, N8975B, N8976B, M8920A. 
  Supported Bus Interfaces:       TCPIP, GPIB, USB 

32-bit Software Information:
  Supported Operating Systems:    Windows 7 32-bit, Windows 8 32-bit, Windows 10 32-bit
  Unsupported Operating System:   Windows 2000
  Support Software Required:      VISA-COM
  Source Code Availability:       Source code included with driver via custom installation option.

64-bit Software Information:
  Supported Operating Systems: 	  Windows 7 64-bit, Windows 8 64-bit, Windows 10 64-bit 
  Support Software Required:      VISA-COM
  Source Code Availability:       Source code included with driver via custom installation option.


Special Architectural Information
-------------------------------------

  The AgXSAn driver has two primary parts:
  
	Host part: 
	Consists of interfaces like the IAgXSAnSystem, IAgXSAnStatus etc., which function
	the same across different analyzer applications like the WCDMA, LTE-FDD, LTE-TDD etc. Exercising
	a method/property from the host part will not cause any change to the users' current analyzer application selection.
				   
	SA application part: 
	All interfaces in this part are scripted as IAgXSAnSA<interface name> and appear as child interfaces to the IAgXSAnSA interface in the driver hierarchy. 
	This part consists of interfaces like the IAgXSAnSAACP, IAgXSAnSABurstPower etc., which function specifically in the SA mode/application of the analyzer
	and do not work correctly for other analyzer applications/modes. Exercising a method/property from the SA application part will cause 
	the analyzer to automatically switch mode to the SA application before the intended operation is performed.


Unit Testing
------------
Test Setup Instrument:
  Instrument Models (FW Revision):	N9020B (FW 22.00)
  Bus Interface:			TCPIP
  Operating System (Service Pack):	Windows 10
  OS Bitness/Application Bitness:	64-bit/32-bit
  VISA Vendor and Version:		Keysight VISA-COM (IO Libraries 18.0)
  IVI Shared Components Version:	2.4.2

Test Setup Simulation: 
  Instrument Models: (FW Rev N/A)	M9041B
  Bus Interface:			N/A
  Operating System (Service Pack):	Windows 10
  OS Bitness/Application Bitness:	64-bit/32-bit, 64-bit/64-bit
  VISA Vendor and Version:		N/A
  IVI Shared Components Version:	2.4.2

Driver Installation Testing:
  Operating System (Service Pack): 	Windows 7 (SP1), Windows 8, Windows 10
  OS Bitness:				32-bit, 64-bit

Driver Buildability:
  Operating System (Service Pack): 	Windows 7 (SP1), Windows 8, Windows 10
  OS Bitness:				32-bit, 64-bit
  Visual Studio Version:		VS2010

Driver Test Failures - Known Issues:
  None - This driver does not have any known defects.

Keysight Technologies has evaluated and tested this driver to verify that it meets all applicable 
requirements of the IVI specifications at the time this compliance document was submitted to the 
IVI Foundation and agrees to abide by the dispute arbitration provisions in Section 7 of IVI-1.2: 
Operating Procedures, if the IVI Foundation finds this driver to be non-conformant.


More Information
----------------
  For more information about this driver and other instrument drivers and 
  software available from Keysight Technologies visit:
  http://www.keysight.com/find/drivers

  A list of contact information is available from:
    http://www.keysight.com/find/contactus

  Microsoft, Windows, MS Windows, and Windows NT are U.S. 
  registered trademarks of Microsoft Corporation.

Copyright Keysight Technologies 2011-2018
