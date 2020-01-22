#include "AnokiCommand.h"

#include <iostream>
#include <cmath>
#include <bitset>
#include <string>

/*------------------------------------------------
----- Start of Basic Command List Definition -----
------------------------------------------------*/
void AnokiCommand::cmd_SetScratchValue(long int nScratchValue) {
    /**
     * cmd_SetScratchValue sets the command sequence to set scratch value
     *
     * @param
     * long int nScratchValue: values to be set in scratch register.
     */

	// Reset reference command array
    cleanCommandOutArray();
    // Command Header for SetScratchValue
    commandOutByte[0] = 0x81;

    // Convert 0xffffffff to byte command sequence
    long int tempValue = nScratchValue;
    commandOutByte[1] = floor(tempValue / 16777216);
    tempValue = tempValue - commandOutByte[1] * 16777216;
    commandOutByte[2] = floor(tempValue / 65536);
    tempValue = tempValue - commandOutByte[2] * 65536;
    commandOutByte[3] = floor(tempValue / 256);
    commandOutByte[4] = tempValue - commandOutByte[3]*256;

    // Append checksum to end of comand sequence
    commandOutByte[5] = checksum(commandOutByte, 5);
}

void AnokiCommand::cmd_ReadScratchRequest() {
    /**
     * cmd_ReadScratchRequest sets the command sequence to read scratch request
     * 
     */

    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for ReadScratchRequest
    commandOutByte[0] = 0x82;
    // Append checksum to end of comand sequence
    commandOutByte[1] = checksum(commandOutByte, 1);
}

void AnokiCommand::cmd_RequestFixedSequence() {
    // Reset reference command array
    commandOutByte[9] = { 0 };
    // Command Header for RequestFixedSequence
    commandOutByte[0] = 0x83;
    // Append checksum to end of comand sequence
    commandOutByte[1] = checksum(commandOutByte, 1);
}

void AnokiCommand::cmd_PAAPointingCommand() {

    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for PAAPointingCommand
    commandOutByte[0] = 0xA0;

    // Configure the mode byte
    int mode;
    if (paramModeTXRX) mode = 4;
    commandOutByte[1] = mode + paramBeamMode;

    // Remap theta angle from [0-90] to [0-FFFF];
    theta_uint16ToPointer(paramDirection[0]);
    // Remap theta angle from [0-360] to [0-FFFF];
    phi_uint16ToPointer(paramDirection[1]);
    // Remap frequency to [0-FFFF];
    freq_uint16ToPointer(paramDirection[2]);
    
    // Assume commandOutByte[0:7] correctly set
    commandOutByte[8] = checksum(commandOutByte, 8);
}

void AnokiCommand::cmd_ArrayConfigurationRequest() {
    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for ArrayConfigurationRequest
    commandOutByte[0] = 0xB1;
    // Append checksum to end of comand sequence
    commandOutByte[1] = checksum(commandOutByte, 1);
}

void AnokiCommand::cmd_FactoryReset() {
    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for cmd_FactoryReset
    commandOutByte[0] = 0xC0;

    // Append the accepted reset flag
    if (paramFactoryReset) {
        commandOutByte[1] = 0xBA;
        commandOutByte[2] = 0x11;
    }
    else {
        commandOutByte[1] = 0x00;
        commandOutByte[2] = 0x00;
    }

    // Append checksum to end of comand sequence
    commandOutByte[3] = checksum(commandOutByte, 3);
}


void AnokiCommand::cmd_EnableBeam() {
    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for EnableBeam
    commandOutByte[0] = 0xE0;
    
    // Append the enable flag
    if (paramBeamEnable) {
        commandOutByte[1] = 1;
    }
    else {
        commandOutByte[1] = 0;
    }

    // Append checksum to end of comand sequence
    commandOutByte[2] = checksum(commandOutByte, 2);
}

void AnokiCommand::cmd_StatusSummaryRequest() {
    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for EnableBeam
    commandOutByte[0] = 0xF0;
    // Append checksum to end of comand sequence
    commandOutByte[1] = checksum(commandOutByte, 1);
}

void AnokiCommand::cmd_StatusDetailRequest() {
    // Reset reference command array
    cleanCommandOutArray();
    // Command Header for EnableBeam
    commandOutByte[0] = 0xF1;
    // Append checksum to end of comand sequence
    commandOutByte[1] = checksum(commandOutByte, 1);
}
/*------------------------------------------------
------ END of Basic Command List Definition ------
------------------------------------------------*/




/*------------------------------------------------
------ Start of Helper Function Definition -------
------------------------------------------------*/

int AnokiCommand::checksum(int* pCmd, int len_) {
    /**
     * checksum returns the checksum byte of the command sequence
     *
     * @param
     * int* pCmd  : points to the address of the array
     * int len_            : defines the total number of bytes written
     * @return
     * int checksumInt: byte containing the checksum
     */

    // Initialize temp byte
    int checksumInt = 0;
    // Loop through each command byte within length len_
    for (int i = 0; i < len_; i++) {
        // Bit-wise XOR through each element
        checksumInt = checksumInt ^ pCmd[i];
    }
    // Return the checksum byte
    return checksumInt;
}

void AnokiCommand::commandToVector(int len_) {
    /*
    *
    *
    * @param
    * int len_: Length of expected read byte length
    */

    cleanCommandMemory();

    // Configure start data transmission
    commandVector[ANOKI_CLK][0] = 0;
    commandVector[ANOKI_SDI][0] = 0;
    commandVector[ANOKI_LAT][0] = 1;
    commandVector[ANOKI_STB][0] = 0;

    // Assign clock pulse to command memory CLK
    generateClock(commandVector[ANOKI_CLK]);
    
    // Convert command byte to command bits
    cleanCommandOutArray();
    for (int i = 0; i < sizeof(commandOutByte); i++) {
        unsigned int commandBits;
        uint16ToBinInt(commandOutByte[i], &commandBits);
        for (int j = 0; j < 8; j++) {
            //commandOutBits[i * 8 + j] = commandBits[j];
        }
    }
    // Assign command bits to command memory SDI
    for (int i = 1; i < sizeof(commandOutByte); i++) {
        commandVector[ANOKI_SDI][i] = commandOutByte[i];
    }

    // Leave SDO alone (for reading from memory)

    // Assign Latch High while writing data
    for (int i = len_*8; i < ANOKI_numCommandBits; i++) {
        commandVector[ANOKI_LAT][i] = 1;
    }

    // Assign Strobe bit high at end
    commandVector[ANOKI_STB][ANOKI_numCommandBits - 1] = 1;


    std::cout << "Command to Bit Vector: \n";
    for (int i = 0; i < ANOKI_numChannels; i++) {
        for (int j = 0; j < ANOKI_numCommandBits; j++) {
            std::cout << commandVector[i][j];
        }
        std::cout << "\n";
    }
}

void AnokiCommand::show_hexCMD(int* pCmd, int len_) {
    // Display to windows console the command string
    for (int i = 0; i < len_; i++) {
        std::cout << std::hex << pCmd[i] << " ";
    }
    std::cout << "\n"; // New line terminator
}

/*------------------------------------------------
------- END of Helper Function Definition --------
------------------------------------------------*/




/*------------------------------------------------
------ Start of Private Function Definition ------
------------------------------------------------*/
void AnokiCommand::theta_uint16ToPointer(double value) {
    int msb, lsb;

    value = floor(value * 65535 / 90);
    msb = floor(value / 256);
    lsb = value - msb * 256;

    commandOutByte[2] = msb;
    commandOutByte[3] = lsb;
}

void AnokiCommand::phi_uint16ToPointer(double value) {
    int msb, lsb;

    value = floor(value * 65535 / 360);
    msb = floor(value / 256);
    lsb = value - msb * 256;

    commandOutByte[4] = msb;
    commandOutByte[5] = lsb;
}

void AnokiCommand::freq_uint16ToPointer(double value) {
    int msb, lsb;

    value = floor(value * 65535);
    msb = floor(value / 256);
    lsb = value - msb * 256;

    commandOutByte[6] = msb;
    commandOutByte[7] = lsb;
}

void AnokiCommand::cleanCommandOutArray() {
    // Set all byte in commmandOutByte to 0
    for (int i = 0; i < sizeof(commandOutByte); i++) {
        commandOutByte[i] = 0;
    } // Set all bits in commmandOutBits to 0
    for (int i = 0; i < sizeof(commandOutBits); i++) {
        commandOutBits[i] = 0;
    }
}

void AnokiCommand::cleanCommandMemory() {
    for (int i = 0; i < ANOKI_numChannels; i++) {
        for (int j = 0; j < ANOKI_numCommandBits; j++) {
            commandVector[i][j] = 0;
        }
    }
}

void AnokiCommand::generateClock(unsigned int* channel) {

    bool flag_clk = 0;
    for (int i = 0; i < ANOKI_numCommandBits; i++) {
        if (flag_clk) {
            channel[i] = 1;
        }
        else {
            channel[i] = 0;
        }
        flag_clk = !flag_clk;
    }
}

void AnokiCommand::uint16ToBinInt(unsigned int value, unsigned int* cmdBit) {

    int i = 0;
    while (value > 0) {
        cmdBit[i] = value % 2;
        value = value / 2;
        i++;
    }
}