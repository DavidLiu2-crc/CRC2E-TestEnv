/**
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

    Example: //Generate some sample sequence
            AnokiCommand anokiCmd;
            AnokiObj obj1, obj2;
            obj1 = anokiCmd.cmd_SetScratchValue(0xfedcba98);
            obj1 = anokiCmd.cmd_ReadScratchRequest();
            obj1 = anokiCmd.cmd_RequestFixedSequence();

            anokiCmd.set_modeTXRX(false);
            anokiCmd.set_beamMode(1);
            anokiCmd.set_PointingAngle(60, 42);
            anokiCmd.set_PointingFreq(28050);
            obj1 = anokiCmd.cmd_PAAPointingCommand();

            anokiCmd.set_factoryFlag(true);
            obj1 = anokiCmd.cmd_FactoryReset();

            anokiCmd.set_enableBeam(true);
            obj1 = anokiCmd.cmd_EnableBeam();

            obj1 = anokiCmd.cmd_ArrayConfigurationRequest();
            obj1  = anokiCmd.cmd_StatusSummaryRequest();
            obj1 = anokiCmd.cmd_StatusDetailRequest();
*/
#pragma once

// Include corresponding header file
#include "..\include\AnokiCommand.h"


// ---------------- DEFINE COMMAND FUNCTIONS --------------
AnokiObj AnokiCommand::cmd_SetScratchValue(unsigned long _nScratchValue) {
// void AnokiCommand::cmd_SetScratchValue(long unsigned nScratchValue) {

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0x81;   // Command Header for SetScratchValue

    // Bound the input scratch value between 0 and 0xFFFFFFFF
    if (_nScratchValue > 0xFFFFFFFF) {
        _nScratchValue = 0xFFFFFFFF;
    }

    // Convert long nScratchValue to 4 seperate hex values
    unsigned long tempValue = _nScratchValue;
    cmd.at(1) = (unsigned char) floor(tempValue / 16777216);
    tempValue = tempValue - cmd.at(1) * 16777216;
    cmd.at(2) = (unsigned char) floor(tempValue / 65536);
    tempValue = tempValue - cmd.at(2) * 65536;
    cmd.at(3) = (unsigned char) floor(tempValue / 256);
    tempValue = tempValue - cmd.at(3) * 256;
    cmd.at(4) = (unsigned char) tempValue;

    // Append checksum to end of comand sequence
    cmd.at(5) = checksum(cmd.data(), 5);

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog),
        "Set Scratch Value (%X %X %X %X)", cmd.at(1), cmd.at(2), cmd.at(3), cmd.at(4));

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 6, 6, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller
}

AnokiObj AnokiCommand::cmd_ReadScratchRequest() {
//void AnokiCommand::cmd_ReadScratchRequest() {
    
    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0x82;   // Command Header for ReadScratchRequest
    cmd.at(1) = 0x82;   // Checksum for ReadScratchRequest

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Read Scratch Request ()");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 2, 6, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller
}

AnokiObj AnokiCommand::cmd_RequestFixedSequence() {
// void AnokiCommand::cmd_RequestFixedSequence() {
    /* Sets the command sequence to request fixed sequence
        @description Fills in the commandOut to request the value in fixed register.
    */
    
    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0x83;   // Command Header for RequestFixedSequence
    cmd.at(1) = 0x83;  // Checksum for RequestFixedSequence

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Request Fixed Sequence ()");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 2, 6, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller
}

AnokiObj AnokiCommand::cmd_PAAPointingCommand() {
//void AnokiCommand::cmd_PAAPointingCommand() {
    /* Sets the command sequence for PAA pointing direction
        @description Fills in the commandOut to point the beam in a particular direction.
    */

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0xA0;   // Command Header for PAAPointingCommand

    // Append the mode byte
    unsigned int modeByte;
    paramBeamTXRX ? modeByte = 4 : modeByte = 0;
    modeByte = modeByte + paramBeamMode;
    cmd.at(1) = modeByte;   // Set first mode byte

    // Convert the value to hex values
    // TODO: try to fix memory leak here
    theta_uint16ToPointer(paramTheta, &dirSequence[0]);   // Remap theta angle from [0-90] to [0-FFFF];
    phi_uint16ToPointer(paramPhi, &dirSequence[2]);     // Remap theta angle from [0-360] to [0-FFFF];
    freq_uint16ToPointer(paramFrequency, &dirSequence[4]);    // Remap frequency to [0-FFFF];

    // Copy the hex values to command sequence
    for (unsigned int i = 0; i < 6; i++) {
        cmd.at(2 + i) = dirSequence[i];
    }
    cmd.at(8) = checksum(cmd.data(), 8); // Append checksum to end of comand sequence

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog),
        "PAA Pointing Command (%s, Beam: Mode %d, Theta:%.3f, Phi:%.3f, Frequency:%d MHz)",
        paramBeamTXRX ? "TX" : "RX", paramBeamMode, paramTheta, paramPhi, paramFrequency);
    
    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 9, 6, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller

}

AnokiObj AnokiCommand::cmd_ArrayConfigurationRequest() {
// void AnokiCommand::cmd_ArrayConfigurationRequest() {
    /* Sets the command sequence for Array Configuration Request
    @description
    Fills in the commandOut to request the current array configuration (Revision number, SN, IP). */

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0xB1;   // Command Header for ArrayConfigurationRequest
    cmd.at(1) = 0xB1;   // Checksum for ArrayConfigurationRequest

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Array Configuration Request ()");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 2, 10, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller

}

AnokiObj AnokiCommand::cmd_FactoryReset() {
//void AnokiCommand::cmd_FactoryReset() {
    /* Sets the command sequence for Factory Reset
    @description
    Fills in the commandOut to reset the PAA to factory configuration. */

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0xC0;   // Command Header for FactoryReset

    // Append the required reset flag 0xBA11
    if (paramFactoryReset) {
        cmd.at(1) = 0xBA;
        cmd.at(2) = 0x11;
    }
    else {
        cmd.at(1) = 0x00;
        cmd.at(2) = 0x00;
    }

    // Append checksum to end of comand sequence
    cmd.at(3) = checksum(cmd.data(), 3);

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Factory Reset (%s)", paramFactoryReset ? "True" : "False");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 4, 6, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller
}

AnokiObj AnokiCommand::cmd_EnableBeam() {
//void AnokiCommand::cmd_EnableBeam() {
    /* Sets the command sequence for Enabling Beam
    @description
    Fills in the commandOut to command the PAA to enable beam. */

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0xE0;   // Command Header for EnableBeam

    cmd.at(1) = paramBeamEnable ? 1 : 0;        // Append the enable flag
    // Append checksum to end of comand sequence
    cmd.at(2) = paramBeamEnable ? 0xE1 : 0xE0;

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Enable Beam (%s)", paramBeamEnable ? "True" : "False");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 3, 6, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller

}

AnokiObj AnokiCommand::cmd_StatusSummaryRequest() {
//void AnokiCommand::cmd_StatusSummaryRequest() {
    /* Sets the command sequence for Status Summary Request
    @description
    Fills in the commandOut to request the status summary (PAA/Temperature Sensor Faults). */

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0xF0;   // Command Header for StatusSummaryRequest
    cmd.at(1) = 0xF0;   // Checksum for StatusSummaryRequest
    
    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Status Summary Request ()");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 2, 3, cmdLog.data());
    return cmdObj;  // Return AnokiObj to caller
}

AnokiObj AnokiCommand::cmd_StatusDetailRequest() {
//void AnokiCommand::cmd_StatusDetailRequest() {
    /* Sets the command sequence for Status Detail Request
    @description
    Fills in the commandOut to request the detailed status (Pointing angle, frequency and temperature). */

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0xF1;   // Command Header for StatusDetailRequest
    cmd.at(1) = 0xF1;   // Checksum for StatusDetailRequest

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Status Detail Request ()");

    // --- AnokiOBJ Object-Oriented Implementation
    AnokiObj cmdObj(flag_generateClock);
    cmdObj.set_CommandSequence(cmd.data(), 2, 14, cmdLog.data());
    return cmdObj; // Return AnokiObj to caller
}

// ---------------- DEFINE SET PARAMETER FUNCTIONS ---------

void AnokiCommand::set_PointingFreq(unsigned int _freq) {
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

    paramTheta = (float) theta;
    paramPhi = (float) phi;
}

void AnokiCommand::set_enableBeam(bool _beamOn) {
    paramBeamEnable = _beamOn;
}

void AnokiCommand::set_modeTXRX(bool _mode) {
    paramBeamTXRX = _mode;
}

void AnokiCommand::set_beamMode(unsigned char _modeBeam) {
    if (_modeBeam > 3) _modeBeam = 0;
    paramBeamMode = 0;
}

void AnokiCommand::set_factoryFlag(bool _factoryReset) {
    paramFactoryReset = _factoryReset;
}

void AnokiCommand::set_generateClock(bool _flagGenClock) {
    flag_generateClock = _flagGenClock;
}




// ---------------- DEFINE PRIVATE HELPER FUNCTIONS  ------

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

void AnokiCommand::theta_uint16ToPointer(float _value, unsigned char * pnSequence) {
    int msb, lsb;

    unsigned int value = (unsigned int) floor(_value * 65535 / 90);
    msb = (unsigned char) floor(value / 256);
    lsb = (unsigned char) value - msb * 256;

    // Set the current pointed and next pointed value 
    pnSequence[0] = msb;
    pnSequence[1] = lsb;
}

void AnokiCommand::phi_uint16ToPointer(float _value, unsigned char* pnSequence) {
    int msb, lsb;

    unsigned int value = (unsigned int) floor(_value * 65535 / 360);
    msb = (unsigned char) floor(value / 256);
    lsb = (unsigned char) value - msb * 256;

    // Set the current pointed and next pointed value 
    pnSequence[0] = msb;
    pnSequence[1] = lsb;
}

void AnokiCommand::freq_uint16ToPointer(unsigned int _value, unsigned char* pnSequence) {
    int msb, lsb;

    msb = (unsigned char) floor(_value / 256);
    lsb = (unsigned char) _value - msb * 256;

    // Set the current pointed and next pointed value 
    pnSequence[0] = msb;
    pnSequence[1] = lsb;
}

bool AnokiCommand::read_commandResponse(unsigned char* pReadByte, unsigned char _numBytesRead, AnokiObj anokiobj) {
    // Assume if the byte length = 6 is just a regular ACK/NAK Status Response
    if (_numBytesRead == 6) {
        unsigned char checkByte = pReadByte[5];

        // Verify the response byte with checksum before processing
        if (checksum(pReadByte, 5) == checkByte) {
            unsigned char ACKByte = pReadByte[0];
            unsigned char tempMaxByte = pReadByte[1];
            unsigned char tempMinByte = pReadByte[2];
            float gainRXAvgByte = pReadByte[3];
            float powerTXAvgByte = pReadByte[4];
            
            unsigned instructionCounter = 0x0F & ACKByte;

            bool flag_fixed = ACKByte & 0xF0;
            bool flag_ACK = ACKByte & 0x40;
            bool flag_TXRXState = ACKByte & 0x20;
            bool flag_PAAFault = ACKByte & 0x10;

            if (flag_fixed && flag_ACK && !flag_PAAFault) {
                float tempMax, tempMin, avgGain, avgPower;
                avgGain = gainRXAvgByte / 4;
                avgPower = powerTXAvgByte / 4;
                anokiobj.set_ResponseFlags(true, 0, 0, avgGain, avgPower);
                return true;
            }
            

        }
    }

    return false;
}

/*------------------------------------------------
------- END of Helper Function Definition --------
------------------------------------------------*/