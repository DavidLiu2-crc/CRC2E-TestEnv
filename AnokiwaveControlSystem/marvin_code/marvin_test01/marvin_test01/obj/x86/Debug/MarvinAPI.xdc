<?xml version="1.0"?><doc>
<members>
<member name="M:MarvinAPI.cmd_SetupInterface(System.Int16,System.Int16,System.Int16,System.Int16)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="43">
<summary>
Simple function to initialize the card locating in nSlotNum with connector of type interfaceType.
<param name="nSlotNum"> unsigned int defining the slot number. See PXI/PCI Explorer. </param>
<param name="interfaceType"> int representing the connector type, 0:TTL, 1:LVDS </param>
</summary>
</member>
<member name="M:MarvinAPI.cmd_StartConnection" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="50">
<summary>
Starts connection with Marvin Card located at nSlotNum.
Connects to board at nSlotNum, gets the board to check if recognized (0x70 GX5292 default)
Sets up the input interface, operating mode (most importantly)
IO configuration (channel width), channel output state, remainder output state.
</summary>
</member>
<member name="M:MarvinAPI.cmd_StartDIOLoad(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="61">
<summary>
Create a DIO File and set the number of steps for that file
</summary>
<param name="_numSteps"></param>
</member>
<member name="M:MarvinAPI.cmd_SetupInterface(System.Int16,System.Int16,System.Int16,System.Int16)" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\src\MarvinAPI.cpp" line="20">
<summary>
Simple function to initialize the card locating in nSlotNum with connector of type interfaceType.
<param name="nSlotNum"> unsigned int defining the slot number. See PXI/PCI Explorer. </param>
<param name="interfaceType"> int representing the connector type, 0:TTL, 1:LVDS </param>
</summary>
</member>
</members>
</doc>