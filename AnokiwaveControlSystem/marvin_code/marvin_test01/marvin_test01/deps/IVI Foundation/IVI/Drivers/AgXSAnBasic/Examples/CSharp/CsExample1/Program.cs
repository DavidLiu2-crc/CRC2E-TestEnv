/***************************************************
 *     Copyright Keysight Technologies 2012-2019
 **************************************************/
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Agilent.AgXSAnBasic.Interop;
using Ivi.Driver.Interop;
using Agilent.AgXSAn.Interop;

namespace AgXSAnBasic_CS_Example1
{
    /// <summary>
    /// AgXSAnBasic IVI-COM Driver Example Program
    /// 
    /// Creates a agXSAnBasicDriver object, reads a few Identity interface properties, and checks the instrument error queue.
    /// May include additional instrument specific functionality.
    /// 
    /// See agXSAnBasicDriver help topic "Programming with the IVI-COM Driver in Various Development Environments"
    /// for additional programming information.
    ///
    /// Runs in simulation mode without an instrument.
    /// 
    /// Requires a reference to the agXSAnBasicDriver's interop or COM type library.
    /// 
    /// </summary>
    class Program
    {
        [STAThread]
        public static void Main(string[] args)
        {
            Console.WriteLine("  CS_Example1");
            Console.WriteLine();
            AgXSAnBasic agXSAnBasicDriver = null;
            AgXSAn agXSAnDriver = null;

            try
            {
                // Create driver instance
                agXSAnBasicDriver = new AgXSAnBasic();
                agXSAnDriver = new AgXSAn(); //Instance for AgXSAn host agXSAnBasicDriver class

                // Edit resource and options as needed.  Resource is ignored if option Simulate=true
                string resourceDesc = "GPIB0::18::INSTR";
                
                //resourceDesc = "TCPIP0::<ip or hostname>::INSTR";

                string initOptions = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut";

                bool idquery = true;
                bool reset = true;

                // Initialize the driver.  See driver help topic "Initializing the IVI-COM Driver" for additional information
                agXSAnBasicDriver.Initialize(resourceDesc, idquery, reset, initOptions);
                agXSAnDriver.Initialize(resourceDesc, idquery, reset, initOptions);
                Console.WriteLine("Driver Initialized");

                // Print a few IIviDriverIdentity properties
                Console.WriteLine("Identifier:  {0}", agXSAnBasicDriver.Identity.Identifier);
                Console.WriteLine("Revision:    {0}", agXSAnBasicDriver.Identity.Revision);
                Console.WriteLine("Vendor:      {0}", agXSAnBasicDriver.Identity.Vendor);
                Console.WriteLine("Description: {0}", agXSAnBasicDriver.Identity.Description);
                Console.WriteLine("Model:       {0}", agXSAnBasicDriver.Identity.InstrumentModel);
                Console.WriteLine("FirmwareRev: {0}", agXSAnBasicDriver.Identity.InstrumentFirmwareRevision);
                Console.WriteLine("Serial #:    {0}", agXSAnDriver.System.SerialNumber);
                Console.WriteLine("\nSimulate:    {0}\n", agXSAnBasicDriver.DriverOperation.Simulate);


                //Set Center frequency to 2.5 GHz using AgXSAn host agXSAnBasicDriver
                agXSAnDriver.Frequency.Center = 2.5E+9;
                Console.WriteLine("Center Frequency is set to : {0} Hz", agXSAnDriver.Frequency.Center);
                //Set Input port to RF using AgXSAn host agXSAnBasicDriver
                agXSAnDriver.Input.Port = AgXSAnInputPortEnum.AgXSAnInputPortRF;

                #region Spectrum
                Console.WriteLine("\n\nSpectrum Measurement");

                //Set frequency span to 25 MHz
                double frequencySpan = 25E+6;
                agXSAnBasicDriver.Spectrum.FrequencySpan = frequencySpan;
                Console.WriteLine("Frequency span is set to : {0} Hz", frequencySpan);

                //Read spectrum
                double[] spectrumRes = agXSAnBasicDriver.Spectrum.Traces.get_Item(agXSAnBasicDriver.Spectrum.Traces.get_Name(1)).Read(5000);
                Console.Write("Spectrum Ouput: \n");
                int specPoints = spectrumRes.Length;
                Console.Write("Spectrum Points : {0}  Data :", specPoints);
                if (specPoints > 100) specPoints = 100;
                for (int i = 0; i < specPoints; i++)
                {
                    Console.Write(spectrumRes[i] + "\n");
                    if (i < specPoints - 1)
                        Console.Write(", ");
                }

                #endregion
                #region Waveform
                //Waveform Section
                Console.WriteLine("\n\nWaveform Measurement");

                //Configure Waveform
                agXSAnBasicDriver.Waveform.Configure();


                if ((agXSAnBasicDriver.Identity.InstrumentModel != "M9420A") && (agXSAnBasicDriver.Identity.InstrumentModel != "M9421A") && (agXSAnBasicDriver.Identity.InstrumentModel != "M90XA") && (agXSAnBasicDriver.Identity.InstrumentModel != "M8920A"))      
                {
                    //Set power attenuation using the AgXSAn host agXSAnBasicDriver to 20
                    double powerAttenuation = 20;
                    agXSAnDriver.Level.Attenuation = powerAttenuation;
                    Console.WriteLine("Power Attenuation is set to : {0}", agXSAnDriver.Level.Attenuation);
                }
                //Set Sweep time to 5 ms
                double sweepTime = 5E-3;
                agXSAnBasicDriver.Waveform.SweepTime = sweepTime;
                Console.WriteLine("SweepTime is set to : {0} Seconds", sweepTime);

                //read Waveforms
                double[] WaveformRes = agXSAnBasicDriver.Waveform.Traces.get_Item(agXSAnBasicDriver.Waveform.Traces.get_Name(1)).Read(5000);
                Console.Write("Waveform Ouput: \n");
                int points = WaveformRes.Length;
                Console.Write("Waveform Points : {0}  Data : ", points);
                if (points > 100) points = 100;
                for (int i = 0; i < points; i++)
                {
                    Console.Write(WaveformRes[i] + "\n");
                    if (i < points - 1)
                        Console.Write(", ");
                }
                #endregion

                // Check instrument for errors
                int errorNum = -1;
                string errorMsg = null;
                Console.WriteLine();
                while (errorNum != 0)
                {
                    agXSAnBasicDriver.Utility.ErrorQuery(ref errorNum, ref errorMsg);
                    Console.WriteLine("ErrorQuery: {0}, {1}", errorNum, errorMsg);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                if (agXSAnBasicDriver != null && agXSAnBasicDriver.Initialized)
                {
                    // Close the driver
                    agXSAnBasicDriver.Close();
                    Console.WriteLine("Driver Closed");
                }
            }

            Console.WriteLine("Done - Press Enter to Exit");
            Console.ReadLine();
        }
    }
}
