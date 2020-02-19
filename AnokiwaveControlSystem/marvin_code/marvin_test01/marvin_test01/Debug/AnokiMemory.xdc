<?xml version="1.0"?><doc>
<members>
<member name="T:AnokiObj" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="1">
	File name: AnokiCommand.h
	
	Summary: User defined class that returns a AnokiObj object that contains command control information
			 referenced in Anokiwave ECCN: 5E991

	Author: David Liu - david.liu2@canada.ca
	PandA - MC2

	Description: Simply initialize this class, calling set_ functions to set the values of parameters, and call cmd_
				 to obtain the AnokiObj that contains the command information. Currently allows writing command byte,
				 will attempt to implement read command byte capabilities later.


</member>
<member name="M:AnokiObj.convertSeqToASCII" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiObj.h" line="36">
<summary>
Converts the hex values in commandSequence and transposes them into binary ascii steps
</summary>
<returns>None
<para>Sets <c>commandRaw</c> to appropriate ascii steps </para></returns>
</member>
<member name="M:AnokiObj.setCommandSequence(System.Byte*,System.Byte,System.Byte,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiObj.h" line="42">
<summary>
Sets the object attributes of to appropriate values and calls convertSeqToASCII to generate the binary sequence
</summary>
<param name="pCmdSeq"> Pointer to the command sequence hex array</param>
<param name="_sendLength"> Counter for number of bytes to send</param>
<param name="_readLength"> Counter for number of bytes to expect to read</param>
<param name="_log"> std::string containing function called information (readable format)</param>
</member>
<member name="T:AnokiCommand" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="42">
<summary>

</summary>
<param name=""></param>
<returns><c> </c></returns>
<example><code>

</code></example>
<seealso></seealso>
</member>
<member name="M:AnokiCommand.cmd_SetScratchValue(System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="67">
<summary>
Sets the command sequence to write a value into the scratch register.
<para>Header byte + double to 4 bytes + checksum.</para>
</summary>
<param name="_nScratchValue">Hexadecimal value to load onto register</param>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_ReadScratchRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="75">
<summary>
Sets the command sequence to read the scratch value
</summary>
<returns><c>AnokiObj</c> command object</returns>
</member>
<member name="M:AnokiCommand.cmd_RequestFixedSequence" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="81">
<summary>
Sets the command sequence to read the fixed value
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_PAAPointingCommand" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="87">
<summary>
Sends the command to point the beam with mode, angles and frequency of current instance setting.
Takes <c>paramModeTXRX</c> as operation mode, and <c>paramModeBeam</c> as beam mode.
Assumes <c>paramDirection</c> and <c>paramFrequency</c> are set appropriately
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_ArrayConfigurationRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="95">
<summary>
Sends the command to return the configuration status. Returns IP, Serial Number, Revision Number.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_FactoryReset" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="101">
<summary>
Sends the command to reset the PAA device to factory settings.
Takes value from <c>paramFactoryReset</c> as reset flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_EnableBeam" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="109">
<summary>
Sends the command to enable the beam. Takes value from <c>paramBeamEnable</c> as enable flag.
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusSummaryRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="115">
<summary>
Sends the command to return the summary status
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiCommand.cmd_StatusDetailRequest" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiCommand.h" line="121">
<summary>
Sends the command to return the summary detail
</summary>
<returns><c> AnokiObj </c> command object </returns>
</member>
<member name="M:AnokiMemory.readFromCSV(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="true" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiMemory.h" line="78">
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
<para> -Does set nVectorANGLE, nInputFileRead to appropriate values</para></returns>
<example><code>
char filePath = 'anglePoint.csv';
readFromCSV( filePath );
</code></example>
</member>
<member name="M:AnokiMemory.cmd_steerAngle" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiMemory.cpp" line="68">
<summary>
Calls cmd PAA point for each line in nVectorHeader. Will check the <c>nInputFileRead</c> flag before proceeding
</summary>
<example><code>
readFromCSV('anglePoint.csv');
if (nInputFileRead) {
    cmd_CallSteerFromFile();
}
</code></example>
</member>
<member name="M:AnokiMemory.cmd_StartBeam(System.UInt32,System.UInt16)" decl="false" source="C:\Users\crcuser.TOSHIBA-A50E-1\Documents\CRC2E-TestEnv\AnokiwaveControlSystem\marvin_code\marvin_test01\marvin_test01\AnokiMemory.cpp" line="107">
<summary>
Calls Enable Beam and PAA point toward normal before beginning sweep.
</summary>
<param name="_beamMode"> Unsigned int value between 0, 1, 2, 3</param>
<param name="_freq"> Unsigned int value denoting PAA frequency set between [27500 - 30000] MHz </param>
</member>
</members>
</doc>