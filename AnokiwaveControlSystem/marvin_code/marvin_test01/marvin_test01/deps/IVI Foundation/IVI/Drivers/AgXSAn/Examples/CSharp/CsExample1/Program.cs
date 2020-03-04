/******************************************************************************
 *                                                                         
 * Copyright  Keysight Technologies 2011-2015
 *****************************************************************************/
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Agilent.AgXSAn.Interop;

namespace AgXSAn_CS_Example1
{
    /// <summary>
    /// Keysight IVI-COM Driver Example Program
    /// 
    /// Creates a driver object, reads a few Identity interface properties, and checks the instrument error queue.
    /// May include additional instrument specific functionality.
    /// 
    /// See driver help topic "Programming with the IVI-COM Driver in Various Development Environments"
    /// for additional programming information.
    ///
    /// Runs in simulation mode without an instrument.
    /// 
    /// Requires a reference to the driver's interop or COM type library.
    /// 
    /// </summary>
    class Program
    {
        [STAThread]
        public static void Main(string[] args)
        {
            Console.WriteLine("  CS_Example1");
            Console.WriteLine();
            AgXSAn driver = null;

            try
            {
                // Create driver instance
                driver = new AgXSAn();
                // Edit resource and options as needed.  Resource is ignored if option Simulate=true
                string resourceDesc = "MyAlias";
                //resourceDesc = "TCPIP0::<ip or hostname>::INSTR";

                string initOptions = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut";

                bool idquery = true;
                bool reset = true;

                // Initialize the driver.  See driver help topic "Initializing the IVI-COM Driver" for additional information
                driver.Initialize(resourceDesc, idquery, reset, initOptions);
                Console.WriteLine("Driver Initialized");



                // Print a few IIviDriverIdentity properties
                Console.WriteLine("Identifier:  {0}", driver.Identity.Identifier);
                Console.WriteLine("Revision:    {0}", driver.Identity.Revision);
                Console.WriteLine("Vendor:      {0}", driver.Identity.Vendor);
                Console.WriteLine("Description: {0}", driver.Identity.Description);
                Console.WriteLine("Model:       {0}", driver.Identity.InstrumentModel);
                Console.WriteLine("FirmwareRev: {0}", driver.Identity.InstrumentFirmwareRevision);
                Console.WriteLine("Serial #:    {0}", driver.System.SerialNumber);
                Console.WriteLine("\nSimulate:    {0}\n", driver.DriverOperation.Simulate);

                if (driver.Identity.InstrumentModel != "M9420A" && driver.Identity.InstrumentModel != "M9421A" && driver.Identity.InstrumentModel != "M90XA" && driver.Identity.InstrumentModel != "M8920A" && driver.Identity.InstrumentModel != "M9410A")
                {
                    Console.WriteLine("");
                    Console.WriteLine("-------- DEMO MARKER MEASUREMENT -------");
                    Console.WriteLine("");
                    //Set the analyzer center frequency to 50MHZ
                    driver.Frequency.Center = 50000000.0;
                    //Set the analyzer span to 50MHZ
                    driver.Frequency.Span = 50000000.0;
                    //Turn on the 50 MHz calibrator signal
                    driver.Input.AmplitudeReference = Agilent.AgXSAn.Interop.AgXSAnInputAmplitudeReferenceEnum.AgXSAnInputAmplitudeReference50;
                    //Set analyzer to continuous sweep mode
                    driver.Acquisition.ContinuousSweepModeEnabled = true;
                    //User enters the peak excursion value
                    Double fPeakExcursion;
                    Console.WriteLine("Enter PEAK EXCURSION in dB: ");
                    fPeakExcursion = Convert.ToDouble(Console.ReadLine());
                    //Set the peak excursion
                    driver.SA.Marker.PeakExcursion = fPeakExcursion;
                    //Set the peak thresold
                    driver.SA.Marker.Threshold = -90;
                    //Trigger a sweep and wait for completion
                    driver.Trigger.Source = Agilent.AgXSAn.Interop.AgXSAnTriggerSourceEnum.AgXSAnTriggerSourceImmediate;
                    System.Threading.Thread.Sleep(2000);
                    //Set the marker to the maximum peak
                    driver.SA.Marker.Search(Agilent.AgXSAn.Interop.AgXSAnMarkerSearchEnum.AgXSAnMarkerSearchHighest);
                    //Query, read and display the marker frequency
                    Console.WriteLine("RESULT: Marker Frequency is: {0} Hz ", driver.SA.Marker.Position);
                    //Query, read and display the marker amplitude
                    Console.WriteLine("RESULT: Marker Amplitude is: {0} DB ", driver.SA.Marker.Amplitude);

                    Console.WriteLine("");
                    Console.WriteLine("-------- DEMO INTERNAL ALIGNMENT -------");
                    Console.WriteLine("");

                    //Initiate self-alignment
                    Console.WriteLine("Performing self-alignment...");
                    driver.Calibration.Calibrate();
                    Console.WriteLine("Alignment Successful");

                    Console.WriteLine("");
                    Console.WriteLine("-------- DEMO REAL64 TRACE DATA READ -------");
                    Console.WriteLine("");

                    //Set the analyzer center frequency to 50MHZ
                    driver.Frequency.Center = 50000000.0;
                    //Set the analyzer span to 50MHZ
                    driver.Frequency.Span = 50000000.0;
                    //Turn on the 50 MHz calibrator signal
                    driver.Input.AmplitudeReference = Agilent.AgXSAn.Interop.AgXSAnInputAmplitudeReferenceEnum.AgXSAnInputAmplitudeReference50;
                    //Set analyzer to continuous sweep mode
                    driver.Acquisition.ContinuousSweepModeEnabled = true;
                    //Specify 10 dB per division for the amplitude scale.
                    driver.Display.YScale = 10;
                    //Trigger a sweep and wait for sweep to complete Query the trace data
                    double[] TraceData;
                    Int32 idx;
                    TraceData = driver.Traces.get_Item("TRACE1").ReadY(10000);
                    Console.WriteLine("Trace Data : ");
                    for (idx = 0; idx <= TraceData.Length - 1; idx++)
                        Console.WriteLine("{0}", TraceData[idx]);

                    //Console.WriteLine(QuesCondition);
                    Console.WriteLine("");
                    Console.WriteLine("-------- DEMO POWER SUITE MEASUREMENT READ -------");
                    Console.WriteLine("");

                    //Set the analyzer center frequency to 50MHZ
                    driver.Frequency.Center = 50000000.0;
                    //Set the analyzer span to 50MHZ
                    driver.Frequency.Span = 50000000.0;
                    //Turn on the 50 MHz calibrator signal
                    driver.Input.AmplitudeReference = Agilent.AgXSAn.Interop.AgXSAnInputAmplitudeReferenceEnum.AgXSAnInputAmplitudeReference50;
                    //Set analyzer to continuous sweep mode
                    driver.Acquisition.ContinuousSweepModeEnabled = true;
                    //Specify 10 dB per division for the amplitude scale.
                    driver.Display.YScale = 10;
                    //Initiate CCDF pwer suite measurment
                    //Trigger a sweep and wait for sweep to complete
                    //Trigger a sweep and wait for completion
                    driver.SA.PowerStatistics.ConfigureNoPreset();
                    driver.SA.PowerStatistics.Traces.Initiate();
                    //Query the trace data 
                    double[] CCDFData;
                    Int32 idx1;
                    CCDFData = driver.SA.PowerStatistics.Traces.get_Item("PST_Results").Read(10000);
                    Console.WriteLine("CCDF Data : ");
                    for (idx1 = 0; idx1 <= CCDFData.Length - 1; idx1++)
                        Console.WriteLine("{0}", CCDFData[idx1]);

                }
                else
                {
                    Console.WriteLine("M9420A, M9421A, M8920A, M9410A and M90XA doesn't supports the SA application, they only supports few basic SA common commands, so this example will not work fully with this model.");
                }
                // Check instrument for errors
                int errorNum = -1;
                string errorMsg = null;
                Console.WriteLine();
                while (errorNum != 0)
                {
                    driver.Utility.ErrorQuery(ref errorNum, ref errorMsg);
                    Console.WriteLine("ErrorQuery: {0}, {1}", errorNum, errorMsg);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                if (driver != null && driver.Initialized)
                {
                    // Close the driver
                    driver.Close();
                    Console.WriteLine("Driver Closed");
                }
            }

            Console.WriteLine("Done - Press Enter to Exit");
            Console.ReadLine();
        }
    }
}
