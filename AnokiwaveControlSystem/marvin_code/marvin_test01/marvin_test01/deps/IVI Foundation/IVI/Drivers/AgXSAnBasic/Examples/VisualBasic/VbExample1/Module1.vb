'/***************************************************
' *     Copyright Keysight Technologies 2012-2019
' **************************************************/
Imports Ivi.Driver
Imports Agilent.AgXSAnBasic.Interop
Imports Agilent.AgXSAn.Interop

Module Module1

    ' AgXSAnBasic IVI-COM Driver VB7 Example Program
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
        Dim agXSAnBasicDriver As New AgXSAnBasic()
        'Instance for AgXSAn host agXSAnBasicDriver class
        Dim agXSAnDriver As New Agilent.AgXSAn.Interop.AgXSAn()

        Try
            ' Edit resource and options as needed.  Resource is ignored if option Simulate=true
            Dim resourceDesc As String = "GPIB0::18::INSTR"
            ' resourceDesc = "TCPIP0::<ip or hostname>::INSTR"

            Dim initOptions As String = "QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false, TraceName=c:\\temp\\traceOut"

            Dim idquery As Boolean = True
            Dim reset As Boolean = True

            ' Initialize the driver.  See driver help topic "Initializing the IVI-COM Driver" for additional information
            agXSAnBasicDriver.Initialize(resourceDesc, idquery, reset, initOptions)
            agXSAnDriver.Initialize(resourceDesc, idquery, reset, initOptions)
            Console.WriteLine("Driver Initialized")

            ' Get driver Identity properties.
            Console.WriteLine("Identifier:  {0}", agXSAnBasicDriver.Identity.Identifier)
            Console.WriteLine("Revision:    {0}", agXSAnBasicDriver.Identity.Revision)
            Console.WriteLine("Vendor:      {0}", agXSAnBasicDriver.Identity.Vendor)
            Console.WriteLine("Description: {0}", agXSAnBasicDriver.Identity.Description)
            Console.WriteLine("Model:       {0}", agXSAnBasicDriver.Identity.InstrumentModel)
            Console.WriteLine("FirmwareRev: {0}", agXSAnBasicDriver.Identity.InstrumentFirmwareRevision)
            Console.WriteLine("Serial #:    {0}", agXSAnDriver.System.SerialNumber)
            Console.WriteLine()
            Console.WriteLine("Simulate:    {0}", agXSAnBasicDriver.DriverOperation.Simulate)
            Console.WriteLine()


            'Set Center frequency to 2.5 GHz using AgXSAn host driver
            agXSAnDriver.Frequency.Center = 2500000000.0
            Console.WriteLine("Center Frequency is set to : {0} Hz", agXSAnDriver.Frequency.Center)
            'Set Input port to RF using AgXSAn host driver
            agXSAnDriver.Input.Port = AgXSAnInputPortEnum.AgXSAnInputPortRF


            '**********************Spectrum Section Start****************************************************************
            Console.WriteLine(Environment.NewLine + Environment.NewLine + "Spectrum Measurement")

            'Set frequency span to 25 MHz
            Dim frequencySpan As Double = 25000000
            agXSAnBasicDriver.Spectrum.FrequencySpan = frequencySpan
            Console.WriteLine("Frequency span is set to : {0} Hz", frequencySpan)

            'Read spectrum
            Dim spectrumRes() As Double = agXSAnBasicDriver.Spectrum.Traces.Item(agXSAnBasicDriver.Spectrum.Traces.Name(1)).Read(5000)
            Console.Write("Spectrum Ouput:" + Environment.NewLine)
            Dim specPoints As Integer = spectrumRes.Length
            Console.Write("specPoints : {0} Data :  ", specPoints)
            If (specPoints > 100) Then
                specPoints = 100
            End If
            Dim i As Integer
            For i = 0 To specPoints - 1 Step 1
                Console.Write(spectrumRes(i))
                Console.Write(Environment.NewLine)
                If (i < specPoints - 1) Then
                    Console.Write(", ")
                End If

            Next
            Console.WriteLine(Environment.NewLine)
            '***********************Spectrum Section End*****************************************************************

            '***********************Waveform Section Start*********************************************************************
            Console.WriteLine(Environment.NewLine + Environment.NewLine + "Waveform Measurement")

            'Configure Waveform
            agXSAnBasicDriver.Waveform.Configure()


            If ((agXSAnBasicDriver.Identity.InstrumentModel <> "M9420A") And (agXSAnBasicDriver.Identity.InstrumentModel <> "M9421A") And (agXSAnBasicDriver.Identity.InstrumentModel <> "M90XA") And (agXSAnBasicDriver.Identity.InstrumentModel <> "M8920A")) Then
                'Set power attenuation using the AgXSAn host driver to 20
                Dim powerAttenuation As Double = 20
                agXSAnDriver.Level.Attenuation = powerAttenuation
                Console.WriteLine("Power Attenuation is set to : {0}", agXSAnDriver.Level.Attenuation)
            End If

            'Set Sweep time to 5 ms
            Dim sweepTime As Double = 0.005
            agXSAnBasicDriver.Waveform.SweepTime = sweepTime
            Console.WriteLine("SweepTime is set to : {0} Seconds", sweepTime)

            'read Waveforms
            Dim WaveformRes() As Double = agXSAnBasicDriver.Waveform.Traces.Item(agXSAnBasicDriver.Waveform.Traces.Name(1)).Read(5000)
            Console.Write("Waveform Ouput: " + Environment.NewLine)
            Dim points As Integer = WaveformRes.Length
            Console.Write("Points : {0} Data : ", points)
            If (points > 100) Then
                points = 100
            End If

            For i = 0 To points - 1 Step 1
                Console.Write(WaveformRes(i))
                Console.Write(Environment.NewLine)
                If (i < points - 1) Then
                    Console.Write(", ")
                End If
            Next
            '***********************Waveform Section End*****************************************************************


            ' Check instrument for errors.
            Dim errorCode As Integer = -1
            Dim errorMsg As String = String.Empty
            Console.WriteLine()

            Do
                agXSAnBasicDriver.Utility.ErrorQuery(errorCode, errorMsg)
                Console.WriteLine("ErrorQuery: {0}, {1}", errorCode, errorMsg)
            Loop While errorCode <> 0

        Catch err As System.Exception
            Console.WriteLine()
            Console.WriteLine("Exception Error:")
            Console.WriteLine("  " + err.Message())
        End Try

        ' Close driver if initialized.
        If (agXSAnBasicDriver.Initialized) Then
            agXSAnBasicDriver.Close()
            Console.WriteLine("Driver Closed")
        End If

        Console.WriteLine()
        Console.Write("Done - Press Enter to Exit ")
        Console.ReadLine()

    End Sub

End Module
