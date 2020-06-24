#pragma once

// Include corresponding header file
#include "AnokiSequence.h"



void AnokiSequence::LoadAnglePoints(std::string pnInputCSVFile, bool generateClock) {
    std::ifstream inputfile;
    std::string line = "";

    inputfile.exceptions(std::ifstream::failbit | std::ifstream::badbit);
    
    try {
        inputfile.open(pnInputCSVFile, std::ios::in);
    }
    catch (std::ifstream::failure& e) { // Could not read file
        std::cout << "Catch: " << e.what() << "\n";
    }

    float* ptr = PtrAngles;
    // Clear float pointer to angles
    memset(PtrAngles, 0, sizeof(float) * CtrAngles);

    inputfile.exceptions(std::ifstream::goodbit);
    try {
        while (std::getline(inputfile, line)) {

            std::size_t commaIndex = line.find(',');

            // Parse any number of values more that 2 columns
            while (commaIndex != std::string::npos) {
                // Grab the digits in the first number up to comma
                std::string strNum = line.substr(0, commaIndex);
                // Remove digts from character string
                line = line.erase(0, commaIndex + 1);
                commaIndex = line.find(',');

                // Append the digits as a float to vector placeholder
                *ptr = std::stof(strNum);
                ptr++;

            }

            // Parse the remaining string as a number
            std::string strNum = line;
            // Append the last digit as a float to vector placeholder
            *ptr = std::stof(strNum);
            ptr++;

            CtrAngles++;
        }
    }
    catch (std::ifstream::failure& e) {
        std::cout << "Catch: " << e.what() << "\n";
    }
    

    std::cout << "[AnokiSequence] : Loaded csv file with " << CtrAngles << " angles\n";
}

void AnokiSequence::LoadAnglePoints(float* angleArray, unsigned long angleLength, bool generateClock) {
    // Clears float array of values
    memset(PtrAngles, 0, sizeof(float) * CtrAngles);

}

void AnokiSequence::GenerateCommandSequence() {

    bool modeTx = true;
    int modeBeam = 0;
    long freq = 28050;

    //Clears command sequence
    unsigned char* cmdPtr = PtrSequence;
    memset(cmdPtr, 0, sizeof(unsigned char) * MaxSequence);

    AddCommandToSequence( cmd_EnableBeam(true) );
    AddDwellTime();

    float* ptr = PtrAngles;
    for (unsigned long i = 0; i < CtrAngles; i++) {
        AddCommandToSequence( cmd_PAAPointingCommand(modeTx, modeBeam, *ptr++, *ptr++, freq) );

        AddDwellTime();
    }

    AddCommandToSequence( cmd_EnableBeam(false) );
    AddDwellTime();

    std::cout << "[AnokiSequence] : Generated bit sequence " << CtrSequence << " steps\n";
}

void AnokiSequence::ExportCommandSequence(std::string pnOutputBINFile) {
    std::ofstream binFile;
    binFile.open(pnOutputBINFile + ".bin", std::ios::out);
    binFile.write((char*) PtrSequence, CtrSequence);
    binFile.close();

    std::cout << "[AnokiSequence] : Exported bit sequence to binary file : " << pnOutputBINFile << ".bin\n";
}

void AnokiSequence::GetCommandSequence(unsigned char** pSeq, unsigned long* len_) {
    *pSeq = PtrSequence;
    *len_ = CtrSequence;

    std::cout << "[AnokiSequence] : Retrieved bit sequence at memory location : 0x" << pSeq << " of length " << CtrSequence << "bytes.\n";
}


void AnokiSequence::command::ConvertSequence(unsigned char** pCmd, unsigned int* len_) {

    unsigned char* sequence = new unsigned char[160];
    unsigned char* ptr = sequence;
    unsigned int bitAdded = 0;

    for (unsigned char i = 0; i < sendByteLength; i++) {
        unsigned char maskByte = 0x80;
        unsigned char addByte = 1 << 1;

        for (unsigned char j = 0; j < 8; j++) {
            bool setBit = CommandHex[i + j] & maskByte;

            *ptr++ = setBit ? addByte : 0;
            bitAdded++;

            if (genDoubleClock) {
                *ptr++ = setBit ? addByte + 1 : 1;
                bitAdded++;
            }
        }

        maskByte = maskByte >> 1;
    }

    memcpy_s(*pCmd, 80, sequence, sendByteLength * 8);
    *len_ = sendByteLength * 8;
}

// ---------------- DEFINE COMMAND FUNCTIONS --------------

void AnokiSequence::AddCommandToSequence(AnokiSequence::command cmd) {
    unsigned int len = 0;
    cmd.ConvertSequence( (unsigned char**) PtrSequence[CtrSequence], &len);
    CtrSequence += len;
}

AnokiSequence::command AnokiSequence::cmd_SetScratchValue(unsigned long _nScratchValue) {
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
    cmd.at(1) = (unsigned char)floor(tempValue / 16777216);
    tempValue = tempValue - cmd.at(1) * 16777216;
    cmd.at(2) = (unsigned char)floor(tempValue / 65536);
    tempValue = tempValue - cmd.at(2) * 65536;
    cmd.at(3) = (unsigned char)floor(tempValue / 256);
    tempValue = tempValue - cmd.at(3) * 256;
    cmd.at(4) = (unsigned char)tempValue;

    // Append checksum to end of comand sequence
    cmd.at(5) = checksum(cmd.data(), 5);

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog),
        "Set Scratch Value (%X %X %X %X)", cmd.at(1), cmd.at(2), cmd.at(3), cmd.at(4));

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 6, 6, cmdLog.data(), generateClock);
    return cmdObj;
}

AnokiSequence::command AnokiSequence::cmd_ReadScratchRequest() {
    //void AnokiCommand::cmd_ReadScratchRequest() {

    // --- Combine the necessary paramter bytes to generate a command sequence
    cmd.fill(0);        // Clear temporary commmand array
    cmd.at(0) = 0x82;   // Command Header for ReadScratchRequest
    cmd.at(1) = 0x82;   // Checksum for ReadScratchRequest

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog), "Read Scratch Request ()");

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 2, 6, cmdLog.data(), generateClock);
    return cmdObj;
}

AnokiSequence::command AnokiSequence::cmd_RequestFixedSequence() {
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

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 2, 6, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller
}

AnokiSequence::command AnokiSequence::cmd_PAAPointingCommand(bool paramBeamTXRX, int paramBeamMode, float paramTheta, float paramPhi, long paramFreq) {
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
    theta_uint16ToPointer(paramTheta, &cmd.at(2));   // Remap theta angle from [0-90] to [0-FFFF];
    phi_uint16ToPointer(paramPhi, &cmd.at(4));     // Remap theta angle from [0-360] to [0-FFFF];
    freq_uint16ToPointer(paramFreq, &cmd.at(6));    // Remap frequency to [0-FFFF];

    cmd.at(8) = checksum(cmd.data(), 8); // Append checksum to end of comand sequence

    // Convert command sequence to string for readiblity
    cmdLog.fill(0);
    snprintf(cmdLog.data(), sizeof(cmdLog),
        "PAA Pointing Command (%s, Beam: Mode %d, Theta:%.3f, Phi:%.3f, Frequency:%d MHz)",
        paramBeamTXRX ? "TX" : "RX", paramBeamMode, paramTheta, paramPhi, paramFreq);

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 9, 6, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller

}

AnokiSequence::command AnokiSequence::cmd_ArrayConfigurationRequest() {
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

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 2, 10, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller

}

AnokiSequence::command AnokiSequence::cmd_FactoryReset(bool paramFactoryReset) {
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

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 4, 6, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller
}

AnokiSequence::command AnokiSequence::cmd_EnableBeam(bool paramBeamEnable) {
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

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 3, 6, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller

}

AnokiSequence::command AnokiSequence::cmd_StatusSummaryRequest() {
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

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 2, 3, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller
}

AnokiSequence::command AnokiSequence::cmd_StatusDetailRequest() {
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

    // --- command object-oriented implementation
    command cmdObj(cmd.data(), 2, 14, cmdLog.data(), generateClock);
    return cmdObj;  // Return AnokiObj to caller
}

void AnokiSequence::AddDwellTime() {

    
    if (generateClock) {
        //Use a 2 byte pointer to add the clock pulse too
        short* ptr = (short*) &PtrSequence[CtrSequence];

        // Generate idle/dwell signal
        for (unsigned long i = 0; i < dwellSteps; i++) {
            *ptr++ = 0x0809;
        }
        CtrSequence += dwellSteps * 2;

        // Generate strobe signal
        *ptr++ = 0x1819;
        CtrSequence += 2;

    }
    else {
        memset(&PtrSequence[CtrSequence], 0x08, dwellSteps);
        CtrSequence += dwellSteps;

        PtrSequence[CtrSequence] = 0x18;
        CtrSequence++;
    }
}

void AnokiSequence::setDwellTime(float freq, float delayTime) {
    dwellSteps = (unsigned long) delayTime * freq / (generateClock ? 2 : 1);
}

int AnokiSequence::checksum(unsigned char* pCmd, int len_) {
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

void AnokiSequence::theta_uint16ToPointer(float _value, unsigned char* pnSequence) {
    int msb, lsb;

    unsigned int value = (unsigned int)floor(_value * 65535 / 90);
    msb = (unsigned char)floor(value / 256);
    lsb = (unsigned char)value - msb * 256;

    // Set the current pointed and next pointed value 
    pnSequence[0] = msb;
    pnSequence[1] = lsb;
}

void AnokiSequence::phi_uint16ToPointer(float _value, unsigned char* pnSequence) {
    int msb, lsb;

    unsigned int value = (unsigned int)floor(_value * 65535 / 360);
    msb = (unsigned char)floor(value / 256);
    lsb = (unsigned char)value - msb * 256;

    // Set the current pointed and next pointed value 
    pnSequence[0] = msb;
    pnSequence[1] = lsb;
}

void AnokiSequence::freq_uint16ToPointer(unsigned int _value, unsigned char* pnSequence) {
    int msb, lsb;

    msb = (unsigned char)floor(_value / 256);
    lsb = (unsigned char)_value - msb * 256;

    // Set the current pointed and next pointed value 
    pnSequence[0] = msb;
    pnSequence[1] = lsb;
}





