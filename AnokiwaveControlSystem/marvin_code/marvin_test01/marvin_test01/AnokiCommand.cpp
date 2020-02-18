#pragma once

#include "AnokiCommand.h"



/*------------------------------------------------
----- Start of Basic Command List Definition -----
------------------------------------------------*/

AnokiObj AnokiCommand::cmd_SetScratchValue(unsigned long _nScratchValue) {
// void AnokiCommand::cmd_SetScratchValue(long unsigned nScratchValue) {

    // Define temporary command sequence with HEX values
    unsigned char cmd[6] = { 0 };
    cmd[0] = 0x81;                  // Command Header for SetScratchValue

    // Bound the input scratch value between 0 and 0xFFFFFFFF
    if (_nScratchValue > 0xFFFFFFFF) {
        _nScratchValue = 0xFFFFFFFF;
    }

    // Convert long nScratchValue to 4 seperate hex values
    unsigned long tempValue = _nScratchValue;
    cmd[1] = floor(tempValue / 16777216);
    tempValue = tempValue - cmd[1] * 16777216;
    cmd[2] = floor(tempValue / 65536);
    tempValue = tempValue - cmd[2] * 65536;
    cmd[3] = floor(tempValue / 256);
    tempValue = tempValue - cmd[3] * 256;
    cmd[4] = tempValue;

    // Append checksum to end of comand sequence
    cmd[5] = checksum(cmd, 5); 

    // Convert command sequence to string for readiblity
    char commandOutCalled[200];
    snprintf(commandOutCalled, sizeof(commandOutCalled),
        "Set Scratch Value (%X %X %X %X)", cmd[1], cmd[2], cmd[3], cmd[4]);

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 6, 6, std::string(commandOutCalled));
    // Return AnokiObj to caller
    return cmdObj;  
}

AnokiObj AnokiCommand::cmd_ReadScratchRequest() {
//void AnokiCommand::cmd_ReadScratchRequest() {
    
    unsigned char cmd[2] = { 0 };
    cmd[0] = 0x82;          // Command Header for ReadScratchRequest
    cmd[1] = 0x82;          // Checksum for ReadScratchRequest

    std::string cmdLog = "Read Scratch Request ()";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 2, 6, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;
}

AnokiObj AnokiCommand::cmd_RequestFixedSequence() {
// void AnokiCommand::cmd_RequestFixedSequence() {
    /* Sets the command sequence to request fixed sequence
    @description
    Fills in the commandOut to request the value in fixed register. */
    
    // Define temporary command sequence with HEX values
    unsigned char cmd[2] = { 0 };
    cmd[0] = 0x83;          // Command Header for RequestFixedSequence
    cmd[1] = 0x83;          // Checksum for RequestFixedSequence

    std::string cmdLog = "Request Fixed Sequence ()";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 2, 6, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;
}

AnokiObj AnokiCommand::cmd_PAAPointingCommand() {
//void AnokiCommand::cmd_PAAPointingCommand() {
    /* Sets the command sequence for PAA pointing direction
    @description
    Fills in the commandOut to point the beam in a particular direction. */

    // Define temporary command sequence with HEX values
    unsigned char cmd[9] = { 0 };
    cmd[0] = 0xA0;          // Command Header for PAAPointingCommand

    // Append the mode byte
    unsigned int modeByte;
    paramModeTXRX ? modeByte = 4 : modeByte = 0;
    modeByte = modeByte + paramModeBeam;
    cmd[1] = modeByte;

    // Convert the value to hex values
    theta_uint16ToPointer(paramTheta);   // Remap theta angle from [0-90] to [0-FFFF];
    phi_uint16ToPointer(paramPhi);     // Remap theta angle from [0-360] to [0-FFFF];
    freq_uint16ToPointer(paramFrequency);    // Remap frequency to [0-FFFF];

    // Copy the hex values to command sequence
    for (unsigned int i = 0; i < 6; i++) {
        cmd[2 + i] = dirSequence[i];
    }
    cmd[8] = checksum(cmd, 8); // Append checksum to end of comand sequence

    // Convert command sequence to string for readiblity
    char commandOutCalled[200];
    snprintf(commandOutCalled, sizeof(commandOutCalled),
        "PAA Pointing Command (%s, Beam Mode:%d, Theta:%.3f, Phi:%.3f, Frequency:%d)",
        paramModeTXRX ? "TX" : "RX", paramModeBeam, paramTheta, paramPhi, paramFrequency);
    
    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 9, 6, std::string(commandOutCalled));
    // Return AnokiObj to caller
    return cmdObj;

}

AnokiObj AnokiCommand::cmd_ArrayConfigurationRequest() {
// void AnokiCommand::cmd_ArrayConfigurationRequest() {
    /* Sets the command sequence for Array Configuration Request
    @description
    Fills in the commandOut to request the current array configuration (Revision number, SN, IP). */

    // Define temporary command sequence with HEX values
    unsigned char cmd[2] = { 0 };
    cmd[0] = 0xB1;          // Command Header for ArrayConfigurationRequest
    cmd[1] = 0xB1;          // Checksum for ArrayConfigurationRequest

    std::string cmdLog = "Array Configuration Request ()";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 2, 10, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;

}

AnokiObj AnokiCommand::cmd_FactoryReset() {
//void AnokiCommand::cmd_FactoryReset() {
    /* Sets the command sequence for Factory Reset
    @description
    Fills in the commandOut to reset the PAA to factory configuration. */

    // Define temporary command sequence with HEX values
    unsigned char cmd[4] = { 0 };  
    cmd[0] = 0xC0;          // Command Header for FactoryReset

    // Append the required reset flag 0xBA11
    if (paramFactoryReset) {
        cmd[1] = 0xBA;
        cmd[2] = 0x11;
    }
    else {
        cmd[1] = 0x00;
        cmd[2] = 0x00;
    }

    // Append checksum to end of comand sequence
    cmd[3] = checksum(cmd, 3);

    std::string cmdLog = paramFactoryReset ? "Factory Reset (True)" : "Factory Reset (False)";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 4, 6, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;
}

AnokiObj AnokiCommand::cmd_EnableBeam() {
//void AnokiCommand::cmd_EnableBeam() {
    /* Sets the command sequence for Enabling Beam
    @description
    Fills in the commandOut to command the PAA to enable beam. */

    // Define temporary command sequence with HEX values
    unsigned char cmd[3] = { 0 };  
    cmd[0] = 0xE0;              // Command Header for EnableBeam

    // Append the enable flag
    cmd[1] = paramBeamEnable ? 1 : 0;
    // Append checksum to end of comand sequence
    cmd[2] = checksum(cmd, 2);

    std::string cmdLog = paramFactoryReset ? "Enable Beam (True)" : "Enable Beam (False)";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 3, 6, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;

}

AnokiObj AnokiCommand::cmd_StatusSummaryRequest() {
//void AnokiCommand::cmd_StatusSummaryRequest() {
    /* Sets the command sequence for Status Summary Request
    @description
    Fills in the commandOut to request the status summary (PAA/Temperature Sensor Faults). */

    // Define temporary command sequence with HEX values
    unsigned char cmd[2] = { 0 };
    cmd[0] = 0xF0;          // Command Header for StatusSummaryRequest
    cmd[1] = 0xF0;          // Checksum for StatusSummaryRequest

    std::string cmdLog = "Status Summary Request ()";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 2, 3, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;
}

AnokiObj AnokiCommand::cmd_StatusDetailRequest() {
//void AnokiCommand::cmd_StatusDetailRequest() {
    /* Sets the command sequence for Status Detail Request
    @description
    Fills in the commandOut to request the detailed status (Pointing angle, frequency and temperature). */

    // Define temporary command sequence with HEX values
    unsigned char cmd[2] = { 0 };
    cmd[0] = 0xF1;          // Command Header for StatusDetailRequest
    cmd[1] = 0xF1;          // Checksum for StatusDetailRequest

    std::string cmdLog = "Status Detail Request ()";

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj;
    cmdObj.setCommandSequence(cmd, 2, 14, cmdLog);
    // Return AnokiObj to caller
    return cmdObj;
}

// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

void AnokiCommand::set_PointingFreq(float _freq) {
    // Set limits on user frequency input
    if (_freq < 27500) _freq = 27500;
    else if (_freq > 30000) _freq = 300000;

    // Set the object property to these values
    paramFrequency = _freq;
}

void AnokiCommand::set_PointingAngle(float _theta, float _phi) {
    // Set boundary range for theta angle
    if (_theta < 0) _theta = 0;
    else if (_theta > 90) _theta = 90;
    // Set boundary range for phi angle
    if (_phi < 0) _phi = 0;
    else if (_phi > 360) _phi = 360;

    // Set the object property to these values
    paramTheta = _theta;
    paramPhi = _phi;
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

    paramTheta = theta;
    paramPhi = phi;
}

// 0:Disable, 1 : Enable
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
    unsigned int checksumInt = pCmd[0];
    // Loop through each command byte within length len_
    for (int i = 1; i < len_; i++) {
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