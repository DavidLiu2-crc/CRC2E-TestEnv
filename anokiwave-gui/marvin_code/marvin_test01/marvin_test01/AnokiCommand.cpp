#pragma once

#include "AnokiCommand.h"



/*------------------------------------------------
----- Start of Basic Command List Definition -----
------------------------------------------------*/
AnokiObj AnokiCommand::cmd_SetScratchValue(unsigned long _nScratchValue) {
// void AnokiCommand::cmd_SetScratchValue(long unsigned nScratchValue) {
    /* Sets the command sequence to set scratch value
    @param
        long int nScratchValue: A value between 0 to 4294967295 to set into scratch register
    @description
    Fills in the commandOut with value nScratchValue.   */

    // --- MATLAB Implementation
    /*
    //cleanCommandOutArray();     // Reset reference command array
    //commandOutByte[0] = 0x81;   // Command Header for SetScratchValue

    // Convert long nScratchValue to 4 seperate hex values
    long unsigned tempValue = nScratchValue;
    commandOutByte[1] = floor(tempValue / 16777216);
    tempValue = tempValue - commandOutByte[1] * 16777216;
    commandOutByte[2] = floor(tempValue / 65536);
    tempValue = tempValue - commandOutByte[2] * 65536;
    commandOutByte[3] = floor(tempValue / 256);
    tempValue = tempValue - commandOutByte[3] * 256;
    commandOutByte[4] = tempValue;

    // Append checksum to end of comand sequence
    //commandOutByte[5] = checksum(commandOutByte, 5);

    //cmdIndex = 6;           // Assign the counter value for current command index
    //numResponseNext = 7;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;

    cmdOBJ.commandSequence[0] = 0x81;

    if (_nScratchValue > 0xFFFFFFFF) {
        _nScratchValue = 0xFFFFFFFF;
    }

    unsigned long tempValue = _nScratchValue;
    cmdOBJ.commandSequence[1] = floor(tempValue / 16777216);
    tempValue = tempValue - cmdOBJ.commandSequence[1] * 16777216;
    cmdOBJ.commandSequence[2] = floor(tempValue / 65536);
    tempValue = tempValue - cmdOBJ.commandSequence[2] * 65536;
    cmdOBJ.commandSequence[3] = floor(tempValue / 256);
    tempValue = tempValue - cmdOBJ.commandSequence[3] * 256;
    cmdOBJ.commandSequence[4] = tempValue;

    
    cmdOBJ.commandSequence[5] = checksum(cmdOBJ.commandSequence, 5);

    // Convert command sequence to string for readiblity
    char commandOutCalled[200];
    snprintf(commandOutCalled, sizeof(commandOutCalled),
        "Set Scratch Value (%X %X %X %X)",
        cmdOBJ.commandSequence[1], cmdOBJ.commandSequence[2], cmdOBJ.commandSequence[3], cmdOBJ.commandSequence[4]);
    
    cmdOBJ.commandLog = std::string(commandOutCalled);
    cmdOBJ.commandSendLength = 6;
    cmdOBJ.commandReadLength = 7;

    return cmdOBJ;
}

AnokiObj AnokiCommand::cmd_ReadScratchRequest() {
//void AnokiCommand::cmd_ReadScratchRequest() {
    /* Sets the command sequence to read the scratch value
        @description
        Fills in the commandOut to request the value in scratch register. */

    // --- MATLAB Implementation
    /* 
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0x82;   // Command Header for ReadScratchRequest
     
    commandOutByte[1] = checksum(commandOutByte, 1);    // Append checksum to end of comand sequence
    
    cmdIndex = 2;           // Assign the counter value for current command index
    numResponseNext = 7;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;
    cmdOBJ.commandSequence[0] = 0x82;
    cmdOBJ.commandSequence[1] = 0x82;

    // Convert command sequence to readable
    cmdOBJ.commandLog = "Read Scratch Request";
    cmdOBJ.commandSendLength = 2;
    cmdOBJ.commandReadLength = 7;
    
    return cmdOBJ;
}

AnokiObj AnokiCommand::cmd_RequestFixedSequence() {
// void AnokiCommand::cmd_RequestFixedSequence() {
    /* Sets the command sequence to request fixed sequence
    @description
    Fills in the commandOut to request the value in fixed register. */
    
    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0x83;   // Command Header for RequestFixedSequence
     
    commandOutByte[1] = checksum(commandOutByte, 1);// Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled), "Request Fixed Sequence");
    
    cmdIndex = 2;           // Assign the counter value for current command index
    numResponseNext = 7;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;
    cmdOBJ.commandSequence[0] = 0x83;
    cmdOBJ.commandSequence[1] = 0x83;

    // Convert command sequence to readable
    cmdOBJ.commandLog = "Request Fixed Sequence";
    cmdOBJ.commandSendLength = 2;
    cmdOBJ.commandReadLength = 7;

    return cmdOBJ;
}

AnokiObj AnokiCommand::cmd_PAAPointingCommand() {
//void AnokiCommand::cmd_PAAPointingCommand() {
    /* Sets the command sequence for PAA pointing direction
    @description
    Fills in the commandOut to point the beam in a particular direction. */

    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0xA0;   // Command Header for PAAPointingCommand

    // Configure the mode byte
    int mode = 0;
    paramModeTXRX ? mode = 4 : mode = 0;
    commandOutByte[1] = mode + paramModeBeam;

    theta_uint16ToPointer(paramDirection[0]);   // Remap theta angle from [0-90] to [0-FFFF];
    phi_uint16ToPointer(paramDirection[1]);     // Remap theta angle from [0-360] to [0-FFFF];
    freq_uint16ToPointer(paramDirection[2]);    // Remap frequency to [0-FFFF];
    
    for (unsigned int i = 0; i < 6; i++) {
        commandOutByte[2 + i] = dirSequence[i];
    }

    // Assume commandOutByte[0:7] correctly set
    commandOutByte[8] = checksum(commandOutByte, 8); // Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled),
        "PAA Pointing Command (%s, Beam Mode:%d Theta:%.3f, Phi:%.3f, Frequency:%.0f)",
        paramModeTXRX ? "TX" : "RX", paramModeBeam, paramDirection[0], paramDirection[1], paramDirection[2]);

    cmdIndex = 9;           // Assign the counter value for current command index
    numResponseNext = 9;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;
    cmdOBJ.commandSequence[0] = 0xA0;

    unsigned int modeByte;
    paramModeTXRX ? modeByte = 4 : modeByte = 0;
    modeByte = modeByte + paramModeBeam;
    cmdOBJ.commandSequence[1] = modeByte;

    theta_uint16ToPointer(paramDirection[0]);   // Remap theta angle from [0-90] to [0-FFFF];
    phi_uint16ToPointer(paramDirection[1]);     // Remap theta angle from [0-360] to [0-FFFF];
    freq_uint16ToPointer(paramDirection[2]);    // Remap frequency to [0-FFFF];
    for (unsigned int i = 0; i < 6; i++) {
        cmdOBJ.commandSequence[2 + i] = dirSequence[i];
    }

    cmdOBJ.commandSequence[8] = checksum(cmdOBJ.commandSequence, 8);

    char commandOutCalled[200];
    snprintf(commandOutCalled, sizeof(commandOutCalled),
        "PAA Pointing Command (%s, Beam Mode:%d, Theta:%.3f, Phi:%.3f, Frequency:%.0f)",
        paramModeTXRX ? "TX" : "RX", paramModeBeam, paramDirection[0], paramDirection[1], paramDirection[2]);
    cmdOBJ.commandLog = std::string(commandOutCalled);

    cmdOBJ.commandSendLength = 9;
    cmdOBJ.commandReadLength = 7;

    return cmdOBJ;

}

AnokiObj AnokiCommand::cmd_ArrayConfigurationRequest() {
// void AnokiCommand::cmd_ArrayConfigurationRequest() {
    /* Sets the command sequence for Array Configuration Request
    @description
    Fills in the commandOut to request the current array configuration (Revision number, SN, IP). */

    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0xB1;   // Command Header for ArrayConfigurationRequest
     
    commandOutByte[1] = checksum(commandOutByte, 1); // Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled), "Array Configuration Request");

    cmdIndex = 2;           // Assign the counter value for current command index
    numResponseNext = 11;   // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;
    cmdOBJ.commandSequence[0] = 0xB1;
    cmdOBJ.commandSequence[1] = 0xB1;
    cmdOBJ.commandLog = "Array Configuration Request";
    cmdOBJ.commandSendLength = 2;
    cmdOBJ.commandReadLength = 11;

    return cmdOBJ;
}

AnokiObj AnokiCommand::cmd_FactoryReset() {
//void AnokiCommand::cmd_FactoryReset() {
    /* Sets the command sequence for Factory Reset
    @description
    Fills in the commandOut to reset the PAA to factory configuration. */

    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0xC0;   // Command Header for cmd_FactoryReset

    // Append the accepted reset flag
    if (paramFactoryReset) {
        commandOutByte[1] = 0xBA;
        commandOutByte[2] = 0x11;
    }
    else {
        commandOutByte[1] = 0x00;
        commandOutByte[2] = 0x00;
    }

    commandOutByte[3] = checksum(commandOutByte, 3); // Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled), "Factory reset (%s)", paramFactoryReset ? "true": "false");

    cmdIndex = 4;           // Assign the counter value for current command index
    numResponseNext = 7;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;
    cmdOBJ.commandSequence[0] = 0xC0;

    // Append the accepted reset flag
    if (paramFactoryReset) {
        cmdOBJ.commandSequence[1] = 0xBA;
        cmdOBJ.commandSequence[2] = 0x11;
    }
    else {
        cmdOBJ.commandSequence[1] = 0x00;
        cmdOBJ.commandSequence[2] = 0x00;
    }
    cmdOBJ.commandSequence[3] = checksum(cmdOBJ.commandSequence, 3);

    paramFactoryReset ? cmdOBJ.commandLog = "Factory Reset(True)" : cmdOBJ.commandLog = "Factory Reset(False)";
    cmdOBJ.commandSendLength = 4;
    cmdOBJ.commandReadLength = 4;

    return cmdOBJ;
}


AnokiObj AnokiCommand::cmd_EnableBeam() {
//void AnokiCommand::cmd_EnableBeam() {
    /* Sets the command sequence for Enabling Beam
    @description
    Fills in the commandOut to command the PAA to enable beam. */

    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0xE0;   // Command Header for EnableBeam
    
    // Append the enable flag
    paramBeamEnable ? commandOutByte[1] = 1 : commandOutByte[1] = 0;

    
    commandOutByte[2] = checksum(commandOutByte, 2); // Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled), "Enable Beam (%s)", paramBeamEnable ? "true" : "false");


    cmdIndex = 3;           // Assign the counter value for current command index
    numResponseNext = 7;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;
    cmdOBJ.commandSequence[0] = 0xE0;
    paramBeamEnable ? cmdOBJ.commandSequence[1] = 1 : cmdOBJ.commandSequence[1] = 0;
    cmdOBJ.commandSequence[2] = checksum(cmdOBJ.commandSequence, 2);

    paramBeamEnable ? cmdOBJ.commandLog = "Enable Beam" : cmdOBJ.commandLog = "Disable Beam";
    cmdOBJ.commandSendLength = 3;
    cmdOBJ.commandReadLength = 7;

    return cmdOBJ;
    

}

AnokiObj AnokiCommand::cmd_StatusSummaryRequest() {
//void AnokiCommand::cmd_StatusSummaryRequest() {
    /* Sets the command sequence for Status Summary Request
    @description
    Fills in the commandOut to request the status summary (PAA/Temperature Sensor Faults). */

    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command array
    commandOutByte[0] = 0xF0;   // Command Header for EnableBeam

    commandOutByte[1] = checksum(commandOutByte, 1); // Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled), "Status Summary Request");

    cmdIndex = 2;           // Assign the counter value for current command index
    numResponseNext = 4;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;

    cmdOBJ.commandSequence[0] = 0xF0;
    cmdOBJ.commandSequence[1] = 0xF0;

    cmdOBJ.commandLog = "Status Summary Request";
    cmdOBJ.commandSendLength = 2;
    cmdOBJ.commandReadLength = 4;

    return cmdOBJ;
}

AnokiObj AnokiCommand::cmd_StatusDetailRequest() {
//void AnokiCommand::cmd_StatusDetailRequest() {
    /* Sets the command sequence for Status Detail Request
    @description
    Fills in the commandOut to request the detailed status (Pointing angle, frequency and temperature). */

    // --- MATLAB Implementation
    /*
    cleanCommandOutArray();     // Reset reference command arra
    commandOutByte[0] = 0xF1;   // Command Header for EnableBeam
    
    commandOutByte[1] = checksum(commandOutByte, 1); // Append checksum to end of comand sequence

    // Convert command sequence to readable
    snprintf(commandOutCalled, sizeof(commandOutCalled), "Status Detail Request");

    cmdIndex = 2;           // Assign the counter value for current command index
    numResponseNext = 15;    // Assign the whitespace for next response sequence
    */

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdOBJ;

    cmdOBJ.commandSequence[0] = 0xF1;
    cmdOBJ.commandSequence[1] = 0xF1;

    cmdOBJ.commandLog = "Status Detail Request";
    cmdOBJ.commandSendLength = 2;
    cmdOBJ.commandReadLength = 4;

    return cmdOBJ;
}

// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

void AnokiCommand::set_PointingFreq(float _freq) {
    // Set limits on user frequency input
    if (_freq < 27500) _freq = 27500;
    else if (_freq > 30000) _freq = 300000;

    // Set the object property to these values
    paramDirection[2] = _freq;
}

void AnokiCommand::set_PointingAngle(float _theta, float _phi) {
    // Set boundary range for theta angle
    if (_theta < 0) _theta = 0;
    else if (_theta > 90) _theta = 90;
    // Set boundary range for phi angle
    if (_phi < 0) _phi = 0;
    else if (_phi > 360) _phi = 360;

    // Set the object property to these values
    paramDirection[0] = _theta;
    paramDirection[1] = _phi;
}

void AnokiCommand::set_PointingAngleAE(float _azimuth, float _elevation) {
    // Set boundary range for azimuth angle
    if (_azimuth < -90) _azimuth = -90;
    else if (_azimuth > 90) _azimuth = 90;
    // Set boundary range for elevation angle
    if (_elevation < -90) _elevation = -90;
    else if (_elevation > 90) _elevation = 90;

    // Convert the input angles to cartesian
    double gx = -sind(_elevation);
    double gy = sind(_azimuth) * cosd(_elevation);
    double gz = cosd(_azimuth) * cosd(_elevation);

    // Set the object property
    double theta = acosd(gz);
    double phi = atan2d(-gx, -gy);
    if (phi < 0) phi = phi + 360;

    paramDirection[0] = theta;
    paramDirection[1] = phi;
}

// 0:Disable, 1:Enable
void AnokiCommand::set_enableBeam(bool _beamOn) {
    paramBeamEnable = _beamOn;
}

// 0:RX Mode, 1:TX Mode
void AnokiCommand::set_modeTXRX(bool _mode) {
    paramModeTXRX = _mode;
}

// 0:Beam 0; 1:TBD; 2:TBD; 3:Spoil
void AnokiCommand::set_beamMode(unsigned char _modeBeam) {
    if (_modeBeam > 3) _modeBeam = 0;
    paramModeBeam = 0;
}

// 0:Nothing, 1:Reset
void AnokiCommand::set_factoryFlag(bool _factoryReset) {
    paramFactoryReset = _factoryReset;
}

/*------------------------------------------------
------ END of Basic Command List Definition ------
------------------------------------------------*/




/*------------------------------------------------
------ Start of Helper Function Definition -------
------------------------------------------------*/
void AnokiCommand::show_hexCMD(int* pCmd) {
    // Display to windows console the command string
    for (int i = 0; i < ANOKI_counterMaxRead; i++) {
        std::cout << std::hex << pCmd[i] << " ";
    }
    std::cout << "\n"; // New line terminator
}

int AnokiCommand::checksum(unsigned char* pCmd, int len_) {
    /*-----------------------------------------------------------
     * checksum returns the checksum byte of the command sequence
     *
     * @param
     * int* pCmd  : points to the address of the array
     * int len_            : defines the total number of bytes written
     * @return
     * int checksumInt: byte containing the checksum
     *----------------------------------------------------------*/

    // Initialize temp byte
    unsigned int checksumInt = 0;
    // Loop through each command byte within length len_
    for (int i = 0; i < len_; i++) {
        // Bit-wise XOR through each element
        checksumInt = checksumInt ^ pCmd[i];
    }
    // Return the checksum byte
    return checksumInt;
}



/*------------------------------------------------
------- END of Helper Function Definition --------
------------------------------------------------*/




/*------------------------------------------------
------ Start of Private Function Definition ------
------------------------------------------------*/
void AnokiCommand::theta_uint16ToPointer(float value) {
    int msb, lsb;

    value = floor(value * 65535 / 90);
    msb = floor(value / 256);
    lsb = value - msb * 256;

    dirSequence[0] = msb;
    dirSequence[1] = lsb;
}

void AnokiCommand::phi_uint16ToPointer(float value) {
    int msb, lsb;

    value = floor(value * 65535 / 360);
    msb = floor(value / 256);
    lsb = value - msb * 256;

    dirSequence[2] = msb;
    dirSequence[3] = lsb;
}

void AnokiCommand::freq_uint16ToPointer(float value) {
    int msb, lsb;

    value = floor(value * 65535);
    msb = floor(value / 256);
    lsb = value - msb * 256;

    dirSequence[4] = msb;
    dirSequence[5] = lsb;
}

void AnokiCommand::uint16ToBinInt(unsigned int value, unsigned int* cmdBit) {

    int i = 0;
    while (value > 0) {
        cmdBit[i] = value % 2;
        value = value / 2;
        i++;
    }
}