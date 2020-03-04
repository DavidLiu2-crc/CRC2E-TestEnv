			***********************
			**** Read Me First ****
			***********************

Version: 1.4.0.0		March 2019

Introducing the AgXSAnBasic IVI Driver for the Keysight AgXSAnBasic X-Series Spectrum Analyzer
---------------------------------------------------------------------------
  This instrument driver provides access to the functionality of the 
  X-Series Spectrum Analyzer IQ Analyzer (Basic) applicationthrough a COM server 
  or ANSI C API which also complies with the IVI specifications. This driver works
  in any development environment which supports COM or C programming including Microsoft
  Visual C++, Microsoft .NET, Keysight VEE Pro, National Instruments LabView, 
  LabWindows CVI, MATLAB (32 and 64 bit) and others.


Supported Instruments
---------------------
N9000A
N9010A
N9020A
N9030A
M9290A
N9040B
N9041B
N9038A 
M9420A
M9421A
N9000B
N9010B
N9020B
N9030B
SPN9003A
SPN9026A
N8973B
N8974B
N8975B
N8976B
M8920A
M90XA
 
Installation
-------------

  AgXSAn driver
   This driver is a IQ Analyzer (Basic) measurement applications
   driver that works in conjunction with the AgXSAn driver which
   contains functionality common across all measurement application. 
   Before this driver can be installed, you must have the AgXSAn driver installed. 
   You can download the latest version from
   http://www.keysight.com/find/sa-ivi

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
  using "Add or Remove Programs" in Win XP or "Programs and Features" in 
  Windows Vista/Windows 7/Windows 8. 

  The IVI Shared Components may also be uninstalled like any other software from
  the Control Panel using "Add or Remove Programs" in Win XP and "Program & 
  Features" in Windows Vista/Windows 7/Windows 8.

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
  Keysight Instrument Drivers, IVI-COM-C Drivers, AgXSAnBasic group.  It contains
  "Getting Started"   information on using the driver in a variety of programming 
  environments as   well as documentation on IVI and instrument specific  methods and
  properties.

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
  to use the latest numbered IAgXSAnBasic[n] interface rather than the IAgXSAnBasic 
  interface.  The IAgXSAnBasic[n].<interface> property will return a pointer
  to the new IAgXSAnBasic<interface>[n] interface.  The IAgXSAnBasic<interface>[n] 
  interface contains the methods and properties for the new functionality and 
  inherits all prior interface functionality.  The new interfaces were 
  introduced rather than modifying the existing interfaces for backwards 
  compatibility.  The interfaces that were previously shipped have not been 
  changed.
  
  Pre-existing .NET client applications must be re-build before using the new 
  version of the driver.

  
Revision History
----------------
  Version     Date     Notes
  -------   --------   -----
  1.4.0.0     Mar 2019   Status and System interface added.Also, MATLAB 64-bit support added.
  1.3.3.0     Aug 2018   Added SCPIs based on latest FW 19.5 and Added Support of M8920A, M90XA.
  1.2.1.0     Nov 2015   Modified the implementation logic of Initialize method for M9420A and M9290A modules, in case of PXI address, 
	                 it check for module name and then take the correct installation path of LaunchModularSA.exe path based on the module name. 
  1.2.0.0     Aug 2015   Added Support of N9000B, N9010B, N9020B, N9030B, SPN9003A, SPN9026A, N8973B, N8974B, N8975B, N8976B
  1.1.0.0     May 2015   Added support of Cannon(M9420A)
  1.0.9.0     Jan 2015   Added support of UXA(N9040B) and MXE(N9038A)
  1.0.8.0     Jan 2015   Previous versions of this driver contained COM GUID's that conflicted with the AgilentSAn IVI driver. 
		         If both drivers were installed, the drivers could become unusable. 
                         This issue has been fixed by replacing the conflicting COM GUID's in this driver.
  1.0.7.0     DEC 2014   Updated help file, added IVI-2014 Compliance, Rebranded Keysight Technologies, Added M9290A model support.
  1.0.6.0     Oct 2012   Initial Public Release
  

IVI Compliance 
--------------
IVI-COM/IVI-C Instrument Specific Driver 

IVI Generation: 	IVI-2014
IVI Instrument Class: 	None
IviSpecAn: 		IVI-4.8   
Revision: 		2.0 

Group Capabilities Supported:
  IviSpecAnBase  		  Yes 
  IviSpecAnMultitrace  		  Yes 
  IviSpecAnMarker  		  Yes 
  IviSpecAnTrigger  	    	  Yes 
  IviSpecAnExternalTrigger  	  Yes 
  IviSpecAnSoftwareTrigger  	  Yes
  IviSpecAnVideoTrigger      	  Yes 
  IviSpecAnDisplay  	    	  Yes 
  IviSpecAnMarkerType  	    	  Yes 
  IviSpecAnDeltaMarker  	  Yes 
  IviSpecAnExternalMixer  	  Yes
  IviSpecAnPreselector  	  Yes  

Optional Features: 
  Interchangeability Checking     No
  State Caching                   No
  Coercion Recording              No

Driver Identification: 
  Vendor:                         Keysight Technologies 
  Description:                    IQ Analyzer Basic measurement application for the AgXSAn host driver.
  Revision:                       1.4.0.0
  Component Identifier:           AgXSAnBasic.AgXSAnBasic

Hardware Information: 
  Instrument Manufacturer:        Keysight Technologies
  Supported Instrument Models:    N9000A, N9010A, N9020A, N9030A, N9040B, N9041B, N9038A, M9420A, M9421A, N9000B, N9010B, N9020B, N9030B,
				  SPN9003A, SPN9026A, N8973B, N8974B, N8975B, N8976B, M8920A,M90XA.
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


Unit Testing
------------
Test Setup Instrument:
  Instrument Models (FW Revision):	N9020A (A.20.10), N9030B (A.20.10), M9420A (M.20.10), M9421A (M.20.10), N9020B (A.20.10), 
					N9000B (A.20.10), N9000A (A.20.10), N9010B (A.20.10), N9010A (A.20.10), N9038A (A.20.10),
					N9041B (A.20.10), N9040B (A.20.10), N8974B (A.20.10), M8920A (M.20.34), M90XA (M.20.10).
  Bus Interface:			TCPIP
  Operating System (Service Pack):	Windows 10 (SP1)
  OS Bitness/Application Bitness:	64-bit/32-bit
  VISA Vendor and Version:		Keysight VISA-COM (IO Libraries 18.0)
  IVI Shared Components Version:	2.4.2

Test Setup Simulation: 
  Instrument Models: (FW Rev N/A)	N9020A
  Bus Interface:			N/A
  Operating System (Service Pack):	Windows 10 (SP1)
  OS Bitness/Application Bitness:	64-bit/32-bit, 64-bit/64-bit
  VISA Vendor and Version:		N/A
  IVI Shared Components Version:	2.4.2

Driver Installation Testing:
  Operating System (Service Pack): 	Windows 7 32-bit, Windows 8 32-bit, Windows 10 32-bit
  OS Bitness:			        32-bit, 64-bit

Driver Buildability:
  Operating System (Service Pack): 	Windows 7 32-bit, Windows 8 32-bit, Windows 10 32-bit
  OS Bitness:			        32-bit, 64-bit
  Visual Studio Version:	    	VS2010

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

Copyright Keysight Technologies 2012-2019
