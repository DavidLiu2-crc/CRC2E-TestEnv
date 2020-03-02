<?xml version="1.0"?><doc>
<members>
<member name="T:AnokiObj" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="1">
	File name: AnokiCommand.h
	
	Summary: User defined class that returns a AnokiObj object that contains command control information
			 referenced in Anokiwave ECCN: 5E991

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Description: Simply initialize this class, calling set_ functions to set the values of parameters, and call cmd_
				 to obtain the AnokiObj that contains the command information. Currently allows writing command byte,
				 will attempt to implement read command byte capabilities later.

	Usage:  1. Create an object variable of type AnokiCommand. Use constructor AnokiCommand xxxAnoki(true) to 
			2. Use AnokiCommand.set_**** functions to set the configuration of the PAA
			3. Use AnokiCommand.cmd_**** functions to return an AnokiObj containing all the command information

			4. Use the AnokiObj.cmd_memcpy() function to copy the equivalent memory into a heap array to be loaded into Marvin Card


	File name: AnokiObj.h

	Summary: User-defined object that contains information about Anokiwave Command

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Usage:  1. Initialize the object. Use constructor AnokiObj xxxAnoki(true) to set up double clock step implementation
			2. Call set_CommandSequence to set the command information
			3. Return or push the object into vector storage

	See also document: Anokiwave USB Documents
	ECCN: 5E991 - NLR : Table 4.1 page 8


</member>
<member name="M:AnokiObj.set_CommandSequence(System.Byte*,System.Byte,System.Byte,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="53">
<summary>
Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence.
</summary>
<param name="pCmdSeq">Pointer to the command sequence hex array</param>
<param name="_sendLength">Counter for number of bytes to send</param>
<param name="_readLength">Counter for number of bytes to expect to read</param>
<param name="_log"> std::string containing function called information (readable format)</param>
</member>
<member name="M:AnokiObj.cmd_memcpy(System.UInt32!System.Runtime.CompilerServices.IsLong*,System.UInt32*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="64">
<summary>
Copy the contents of binary sequence to an external pointer pCmd. For loop implementation
</summary>
<param name="pCmd">Unsigned long pointer to store the binary command steps</param>
<param name="_numberOfStepsCopied">Unsigned int pointer to store the number of steps copied</param>
<returns>Returns 0 if copy complete, or -1 if number of values copied is invalid</returns>
</member>
<member name="M:AnokiObj.cmd_memcpy(System.Byte*,System.UInt32*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="71">
<summary>
Copy the contents of binary sequence to an external pointer pCmd. memcpy_s implementation
</summary>
<param name="pCmd">Unsigned long pointer to store the binary command steps</param>
<param name="_numberOfStepsCopied">Unsigned int pointer to store the number of steps copied</param>
<returns>Returns 0 if copy complete, or -1 if number of values copied is invalid</returns>
</member>
<member name="M:AnokiObj.get_CmdSendLength" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="81">
<summary>
Returns the length of the send byte command
</summary>
<returns>unsigned char representing length of command</returns>
</member>
<member name="M:AnokiObj.get_CmdReadLength" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="86">
<summary>
Returns the length of the read byte command
</summary>
<returns>unsigned char representing length of expected command</returns>
</member>
<member name="M:AnokiObj.get_CmdLog" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="91">
<summary>
Returns the string of the readable command
</summary>
<returns></returns>
</member>
<member name="M:AnokiObj.show_CommandHex" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="99">
<summary>
Display the hex command sequence
</summary>
</member>
<member name="M:AnokiObj.show_CommandRaw" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="103">
<summary>
Display the ascii command sequence
</summary>
</member>
<member name="M:AnokiObj.show_CommandLog" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="107">
<summary>
Display the string containing command information
</summary>
</member>
<member name="M:AnokiObj.convertSeqToASCII" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiObj.h" line="130">
<summary>
Converts the hex values in commandSequence and transposes them into binary ascii steps
</summary>
<returns>None
<para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
</member>
<member name="T:AnokiCommand" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="38">
<summary>

</summary>
<param name=""></param>
<returns><c> </c></returns>
<example><code>

</code></example>
<seealso></seealso>
</member>
<member name="M:AnokiCommand.cmd_SetScratchValue(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="64">
<summary>
Sets the command sequence to write a value into the scratch register.
<para>Header byte + double to 4 bytes + checksum.</para>
</summary>
<param name="_nScratchValue">Hexadecimal value to load onto register</param>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_ReadScratchRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="72">
<summary>
Sets the command sequence to read the scratch value
</summary>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_RequestFixedSequence" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="78">
<summary>
Sets the command sequence to read the fixed value
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_PAAPointingCommand" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="84">
<summary>
Sends the command to point the beam with mode, angles and frequency of current instance setting.
Takes <c>paramModeTXRX</c> as operation mode, and <c>paramModeBeam</c> as beam mode.
Assumes <c>paramDirection</c> and <c>paramFrequency</c> are set appropriately
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_ArrayConfigurationRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="92">
<summary>
Sends the command to return the configuration status. Returns IP, Serial Number, Revision Number.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_FactoryReset" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="98">
<summary>
Sends the command to reset the PAA device to factory settings.
Takes value from <c>paramFactoryReset</c> as reset flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_EnableBeam" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="107">
<summary>
Sends the command to enable the beam. Takes value from <c>paramBeamEnable</c> as enable flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusSummaryRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="113">
<summary>
Sends the command to return the summary status
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusDetailRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiCommand.h" line="119">
<summary>
Sends the command to return the summary detail
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiAPI.cmd_readFromCSV(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiAPI.h" line="66">
<summary>
Opens the .csv file and adds the angles into a (m x n) matrix. Assumes csv file contain 2 column theta, phi values.
<para>
Checks if the file refered to by <c>pnInputCSVFile</c> can be opened. If not throw an exception
Iterates through each line, adding all the characters as float values, then appending to <c>nVectorAngle</c>.
Sets the <c>nInputFileRead</c> flag as true.
</para>
</summary>
<param name="pnInputCSVFile"> Pointer to a character array refering to the (relative) file path.</param>
<returns>None
<para> - Does set nVectorANGLE, nInputFileRead to appropriate values</para></returns>
<example><code>
char filePath = 'anglePoint.csv';
cmd_readFromCSV( filePath );
</code></example>
</member>
<member name="M:AnokiAPI.cmd_generateCommandSequenceFromFile(System.UInt32,System.UInt16)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiAPI.h" line="83">
<summary>
Group function caller fills nVectorAnokiObj with objects containing Anokiwave Commands and copies to local memory heap
</summary>
<param name="_beamMode">unsigned int that denotes the beam mode 0, 1, 2, 3</param>
<param name="_freq">unsigned short that denotes the center frequency of the PAA to point/TX at</param>
</member>
<member name="M:AnokiAPI.export_MemoryToASCII" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiAPI.h" line="93">
<summary>
Opens and writes the local memory heap array into ASC
</summary>
</member>
<member name="M:AnokiAPI.export_MemoryToReadable" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiAPI.h" line="98">
<summary>
Opens and writes the command log into txt file
</summary>
</member>
<member name="M:AnokiAPI.set_CurrentCommand(AnokiObj)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiAPI.h" line="107">
<summary>
Adds an anokiObj to nVectorAnokiOBJ
</summary>
<param name="anokiObj">Returned AnokiObj from AnokiCommand with command information</param>
</member>
<member name="M:AnokiAPI.set_CreateClockFlag(System.Boolean)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\AnokiAPI.h" line="112">
<summary>
Set all the commands to include the clock bit in its step (Double length)
</summary>
<param name="_flagClock">Boolean flag that tells the AnokiObj to generate clock sequence at each step</param>
</member>
<member name="T:_EXCEPTION_DISPOSITION" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\data\include\MarvinAPI.h" line="1">
	File name: MarvinAPI.h

	Summary: User defined class that returns a Marvin object that contains command control information
			 and memory storage, referenced in GTDIO Programmer's Ref Guide

	Author: David Liu - david.liu2@canada.ca - MC2 2020 COOP

	Description: ...

	Usage: ...


</member>
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
</members>
</doc>