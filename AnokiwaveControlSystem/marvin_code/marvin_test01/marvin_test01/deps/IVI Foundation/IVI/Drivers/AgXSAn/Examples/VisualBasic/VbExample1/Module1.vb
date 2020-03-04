'******************************************************************************
'*                                                                         
'* Copyright  Keysight Technologies 2011-2015
'*****************************************************************************
Imports Ivi.Driver
Imports Agilent.AgXSAn.Interop

Module Module1

    ' Keysight IVI-COM Driver VB7 Example Program
    ' 
    ' Creates a driver object, reads a few Identity interface properties and checks the instrument error queue.
    ' May include additional instrument specific functionality.
    '
    ' See driver help topic "Programming with the IVI-COM Driver in Various Development Environments"
    ' for additional programming information.
    '
    ' Requires a reference to the driver's interop or COM type library.

    Sub Main()

        Console.WriteLine("  VB_Example1")
        Console.WriteLine()

        ' Create an instance of the driver
        Dim driver As New AgXSAn()

        Try
            ' Edit resource and options as needed.  Resource is ignored if option Simulate=true
            Dim resourceDesc As String = "MyAlias"
            'resourceDesc = "TCPIP0::<ip or hostname>::INSTR"

            Dim initOptions As String = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut"

            Dim idquery As Boolean = True
            Dim reset As Boolean = True

            ' Initialize the driver.  See driver help topic "Initializing the IVI-COM Driver" for additional information
            driver.Initialize(resourceDesc, idquery, reset, initOptions)
            Console.WriteLine("Driver Initialized")

            ' Get driver Identity properties.
            Console.WriteLine("Identifier:  {0}", driver.Identity.Identifier)
            Console.WriteLine("Revision:    {0}", driver.Identity.Revision)
            Console.WriteLine("Vendor:      {0}", driver.Identity.Vendor)
            Console.WriteLine("Description: {0}", driver.Identity.Description)
            Console.WriteLine("Model:       {0}", driver.Identity.InstrumentModel)
            Console.WriteLine("FirmwareRev: {0}", driver.Identity.InstrumentFirmwareRevision)
            Console.WriteLine("Serial #:    {0}", driver.System.SerialNumber)
            Console.WriteLine()
            Console.WriteLine("Simulate:    {0}", driver.DriverOperation.Simulate)
            Console.WriteLine()

            If driver.Identity.InstrumentModel <> "M9420A" And driver.Identity.InstrumentModel <> "M9421A" And driver.Identity.InstrumentModel <> "M90XA" And driver.Identity.InstrumentModel <> "M8920A" And driver.Identity.InstrumentModel <> "M9410A" Then
                Console.WriteLine("")
                Console.WriteLine("-------- DEMO MARKER MEASUREMENT -------")
                Console.WriteLine("")

                'Set the analyzer center frequency to 50MHZ
                driver.Frequency.Center() = 50000000.0
                'Set the analyzer span to 50MHZ
                driver.Frequency.Span() = 50000000.0
                'Turn on the 50 MHz calibrator signal
                driver.Input.AmplitudeReference() = Agilent.AgXSAn.Interop.AgXSAnInputAmplitudeReferenceEnum.AgXSAnInputAmplitudeReference50
                'Set analyzer to continuous sweep mode
                driver.Acquisition.ContinuousSweepModeEnabled() = True
                'User enters the peak excursion value
                Dim fPeakExcursion As Double
                Console.WriteLine("Enter PEAK EXCURSION in dB: ")
                fPeakExcursion = Console.ReadLine()
                'Set the peak excursion
                driver.SA.Marker.PeakExcursion() = fPeakExcursion
                'Set the peak thresold
                driver.SA.Marker.Threshold() = -90
                'Trigger a sweep and wait for completion
                driver.Trigger.Source() = Agilent.AgXSAn.Interop.AgXSAnTriggerSourceEnum.AgXSAnTriggerSourceImmediate
                System.Threading.Thread.Sleep(2000)
                'Set the marker to the maximum peak
                driver.SA.Marker.Search(Agilent.AgXSAn.Interop.AgXSAnMarkerSearchEnum.AgXSAnMarkerSearchHighest)
                'Query, read and display the marker frequency
                Console.WriteLine("RESULT: Marker Frequency is: {0} Hz ", driver.SA.Marker.Position())
                'Query, read and display the marker amplitude
                Console.WriteLine("RESULT: Marker Amplitude is: {0} DB ", driver.SA.Marker.Amplitude())

                Console.WriteLine("")
                Console.WriteLine("-------- DEMO INTERNAL ALIGNMENT -------")
                Console.WriteLine("")

                'Initiate self-alignment
                Console.WriteLine("Performing self-alignment...")
                driver.Calibration.Calibrate()
                Console.WriteLine("Alignment Successful")

                Console.WriteLine("")
                Console.WriteLine("-------- DEMO REAL64 TRACE DATA READ -------")
                Console.WriteLine("")

                'Set the analyzer center frequency to 50MHZ
                driver.Frequency.Center() = 50000000.0
                'Set the analyzer span to 50MHZ
                driver.Frequency.Span() = 50000000.0
                'Turn on the 50 MHz calibrator signal
                driver.Input.AmplitudeReference() = Agilent.AgXSAn.Interop.AgXSAnInputAmplitudeReferenceEnum.AgXSAnInputAmplitudeReference50
                'Set analyzer to continuous sweep mode
                driver.Acquisition.ContinuousSweepModeEnabled() = True
                'Specify 10 dB per division for the amplitude scale.
                driver.Display.YScale() = 10
                'Trigger a sweep and wait for sweep to complete Query the trace data 
                'Dim TraceData As Double[]
                Dim TraceData() As Double
                Dim idx As Integer
                TraceData = driver.Traces.Item("TRACE1").ReadY(10000)
                Console.WriteLine("Trace Data : ")
                For idx = 0 To TraceData.Length() - 1
                    Console.WriteLine("{0}", TraceData(idx))
                Next

                Console.WriteLine("")
                Console.WriteLine("-------- DEMO POWER SUITE MEASUREMENT -------")
                Console.WriteLine("")

                'Set the analyzer center frequency to 50MHZ
                driver.Frequency.Center() = 50000000.0
                'Set the analyzer span to 50MHZ
                driver.Frequency.Span() = 50000000.0
                'Turn on the 50 MHz calibrator signal
                driver.Input.AmplitudeReference() = Agilent.AgXSAn.Interop.AgXSAnInputAmplitudeReferenceEnum.AgXSAnInputAmplitudeReference50
                'Set analyzer to continuous sweep mode
                driver.Acquisition.ContinuousSweepModeEnabled() = True
                'Specify 10 dB per division for the amplitude scale.
                driver.Display.YScale() = 10
                ' Initiate CCDF pwer suite measurment
                'Trigger a sweep and wait for sweep to complete
                'Trigger a sweep and wait for completion
                driver.SA.PowerStatistics.ConfigureNoPreset()
                driver.SA.PowerStatistics.Traces.Initiate()
                'Query the trace data 
                'Dim TraceData As Double[]
                Dim CCDFData() As Double
                Dim idx1 As Integer
                CCDFData = driver.SA.PowerStatistics.Traces.Item("PST_Results").Read(10000)
                Console.WriteLine("CCDF Data : ")
                For idx1 = 0 To CCDFData.Length() - 1
                    Console.WriteLine("{0}", CCDFData(idx1))
                Next
                ' Check instrument for errors.

                Console.WriteLine("")
                Console.WriteLine("-------- DEMO QUERY INSTR ERROR QUEUE -------")
                Console.WriteLine("")
            Else
                Console.WriteLine("M9420A, M9421A, M8920A, M9410A and M90XA doesn't supports the SA application, they only supports few basic SA common commands, so this example will not work fully with this model.")
            End If
            ' Check instrument for errors.
            Dim errorCode As Integer = -1
            Dim errorMsg As String = String.Empty
            Console.WriteLine()

            Do
                driver.Utility.ErrorQuery(errorCode, errorMsg)
                Console.WriteLine("ErrorQuery: {0}, {1}", errorCode, errorMsg)
            Loop While errorCode <> 0

        Catch err As System.Exception
            Console.WriteLine()
            Console.WriteLine("Exception Error:")
            Console.WriteLine("  " + err.Message())
        End Try

        ' Close driver if initialized.
        If (driver.Initialized) Then
            driver.Close()
            Console.WriteLine("Driver Closed")
        End If

        Console.WriteLine()
        Console.Write("Done - Press Enter to Exit ")
        Console.ReadLine()

    End Sub

End Module
