using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Diagnostics;

using LadybugAPI;
using System.IO;

namespace ControlGUI
{
    public partial class ladybugClass
    {
		// Attributes
		private LadybugError error;

		//Renderer configuration - on the fly changes to renderer properties thread
		private LadybugColorProcessingMethod configColorProcessing = LadybugColorProcessingMethod.LADYBUG_NEAREST_NEIGHBOR_FAST;	// Color processing method to balance quality and speed
		private LadybugOutputImage configOutputImage = LadybugOutputImage.LADYBUG_PANORAMIC;										// Set to off load a panormaic image by LadybugProcessedImage
		private LadybugPanoAngle configPanoAngle = LadybugPanoAngle.LADYBUG_DEFAULT_PANO;											// Panoramic angle centered at Camera 0

		private bool isHighBitDepth = false;
		private uint textureCols;
		private uint textureRows;

		private uint m_renderCols;
		private uint m_renderRows;

		// Event flags
		private bool m_colorProcessChanged = false;
		private bool m_outputSizeChanged = false;
		private bool m_panoramicAngleChanged = false;

		// Stream related parameters 
		private string m_streamFilePath = "";
		private string m_calFilePath = "";
		private uint m_numImages = 0;
		private uint m_numGPUs = 0;

		

		//Dummy object to lock and run unsafe code
		private System.Object m_currentImageLock = new System.Object();

		// Texture array
		private byte[] m_textureBuffer; // Raw image sensor buffer
		private int[][] m_colorBuffer;  // Background image pixel array	

		/// <summary>
		/// Constructor for user-defined ladybug class
		/// Sets up inital renderer settings (column x row)
		/// </summary>
		/// <param name="imageCols">Integer representing number of columns for output image</param>
		/// <param name="imageRows">Integer representing number of rows for output image</param>
		public ladybugClass(uint imageCols, uint imageRows)
        {
			m_renderCols = imageCols;
			m_renderRows = imageRows;

			configOutputImage = LadybugOutputImage.LADYBUG_PANORAMIC;
			configColorProcessing = LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16;
			configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_2_POLE_5;


		}

		/// <summary>
		/// Allocates sufficient pixel buffer array to the output variable
		/// </summary>
		/// <param name="outputBuffer"></param>
		public void AllocateImageBuffer(out int[][] outputBuffer)
		{
			// Initialize the array for color pixel buffer
			outputBuffer = new int[m_renderCols][];
			for (int i = 0; i < m_renderCols; i++)
			{
				outputBuffer[i] = new int[m_renderRows];
			}

		}

		/// <summary>
		/// Allocating sufficient space for texture buffer
		/// </summary>
		/// <param name="outputBuffer"></param>
		public void AllocateTextureBuffer(out byte[] outputBuffer)
		{
			outputBuffer = new byte[Ladybug.LADYBUG_NUM_CAMERAS * textureCols * textureRows * 4 * (isHighBitDepth ? 2 : 1)];
		}

		/// <summary>
		/// Returns the image pixel from rendered image
		/// TODO : Add wait function for next/updated image
		/// </summary>
		/// <param name="colorBuffer">Int array of pixels ARGB format </param>
		unsafe public void GetImagePixelArray(in LadybugProcessedImage processedImage, ref int[][] colorBuffer)
		{
			// --- Directly point the color byte[] to bitmap
			byte* ptr = processedImage.pData;
			int rows = colorBuffer[0].Length;
			int cols = colorBuffer.Length;
			for (int j = 0; j < rows; j++)
			{
				for (int i = 0; i < cols; i++)
				{
					byte b = *(ptr++);
					byte g = *(ptr++);
					byte r = *(ptr++);
					int pixel = (0xFF << 24) + (r << 16) + (g << 8) + b;
					colorBuffer[i][rows - j - 1] = pixel;
				}
			}
		}

		public void GetImageTimeStamp(in LadybugImage image, out string frameTimeStamp)
        {
			LadybugTimestamp timestamp = image.timeStamp;

			DateTime timeUnix = new DateTime(timestamp.ulSeconds * (long)1e7 + new DateTime(1970, 1, 1).Ticks);
			
			frameTimeStamp = timeUnix.ToLocalTime().ToString(); 
        }


		// Overloaded function definition to pass values from UI to reconfigure renderer settings
		/// <summary>
		/// Pass the color processing method to the class and raise the flag
		/// </summary>
		/// <param name="colorMethod"></param>
		public void ConfigureRenderer(LadybugColorProcessingMethod colorMethod)
		{
			configColorProcessing = colorMethod;

			m_colorProcessChanged = true;
		}

		/// <summary>
		/// Pass the panoramic angle to the renderer and raise the flag
		/// </summary>
		/// <param name="panoAngle"></param>
		public void ConfigureRenderer(LadybugPanoAngle panoAngle)
		{
			configPanoAngle = panoAngle;

			m_panoramicAngleChanged = true;
		}

		/// <summary>
		/// Pass the offscreen image resolution to the renderer and raise the flag
		/// </summary>
		/// <param name="cols"></param>
		/// <param name="rows"></param>
		public void ConfigureRenderer(uint cols, uint rows)
		{
			m_renderCols = cols;
			m_renderRows = rows;

			m_outputSizeChanged = true;
		}


		/// <summary>
		/// Initailizes the stream context for reading stream file at path and returns the number of images found in (set of) stream file.
		/// </summary>
		/// <param name="ch"></param>
		/// <param name="streamFilePath"></param>
		/// <param name="numImagesInStream"></param>
		public void InitializeStreamReader(in IntPtr ladybugContext, in IntPtr readerContext, ref string streamFilePath, out uint numImagesInStream)
		{
			// Assign the input string as stream file
			m_streamFilePath = streamFilePath;

			// Set the stream context for reading
			error = Ladybug.InitializeStreamForReading(readerContext, m_streamFilePath, false);
			ladybugHandleError("InitializeStreamForReading()");

			// Get and configure the stream header information
			LadybugStreamHeadInfo streamHeadInfo;
			string configTempConfigPath = System.IO.Path.GetTempFileName();
			error = Ladybug.GetStreamConfigFile(readerContext, configTempConfigPath);
			ladybugHandleError("GetStreamConfigFile()");

			error = Ladybug.GetStreamHeader(readerContext, out streamHeadInfo, m_streamFilePath);
			ladybugHandleError("GetStreamHeader()");

			error = Ladybug.SetColorTileFormat(ladybugContext, streamHeadInfo.stippledFormat);
			ladybugHandleError("SetColorTileFormat()");

			error = Ladybug.LoadConfig(ladybugContext, configTempConfigPath);
			ladybugHandleError("LoadConfig()");
			System.IO.File.Delete(configTempConfigPath);

			// Set up the image processing methods using the first frame in image
			lock (m_currentImageLock)
			{
				LadybugImage m_currentImage;

				error = Ladybug.ReadImageFromStream(readerContext, out m_currentImage);
				ladybugHandleError("ReadImageFromStream()");

				// Grab the number of frames in the stream file
				error = Ladybug.GetStreamNumOfImages(readerContext, out m_numImages);
				ladybugHandleError("GetStreamNumOfImages()");
				numImagesInStream = m_numImages;

				// Configure the texture from the loaded image
				textureCols = m_currentImage.uiCols;
				textureRows = m_currentImage.uiRows;
				isHighBitDepth = dataFormat.isHighBitDepth(m_currentImage.dataFormat);

				// Initialize the byte[] for texture ; texture length = 6 * (2 : 1) * sensorWidth * sensorHeight * BGRU
				//m_textureBuffer = new byte[Ladybug.LADYBUG_NUM_CAMERAS * textureCols * textureRows * 4 * (isHighBitDepth ? 2 : 1)];
				AllocateTextureBuffer(out m_textureBuffer);

				// Load or initalize the alpha masks
				InitializeAlphaMasks(in ladybugContext, ref m_currentImage);
			}
		}

		/// <summary>
		/// Prepare the writer stream context for writing at file path with base file path
		/// </summary>
		/// <param name="ch"></param>
		/// <param name="streamBaseFilePath"></param>
		/// <param name="calFilePath"></param>
		public void InitializeStreamWriter(ContextHolder ch, ref string streamBaseFilePath)
		{
			// Assign the input string as stream file
			//m_streamFilePath = streamBaseFilePath;
			uint grabTimeoutSecs = 10;

			error = Ladybug.StartLockNext(ch.GetLadybugContext(), LadybugDataFormat.LADYBUG_DATAFORMAT_COLOR_SEP_JPEG12);
			ladybugHandleError("StartLockNextEx()");

			// Set the stream context for writing
			StringBuilder sbcal = new StringBuilder(128);
			error = Ladybug.InitializeStreamForWriting(ch.GetWriterContext(), streamBaseFilePath, ch.GetLadybugContext(), sbcal, false);
			ladybugHandleError("InitializeStreamForWriting()");

			    
			error = Ladybug.SetGrabTimeout(ch.GetLadybugContext(), grabTimeoutSecs);

			Debug.WriteLine(String.Format("[DEBUG] Writing device images to file path: {0}", streamBaseFilePath));

			ConfigureTriggerStrobe(ch);

		}

		/// <summary>
		/// Set up the off screen renderer properties
		/// </summary>
		/// <returns></returns>
		public bool InitializeOffScreenRender(in IntPtr ladybugContext)
		{
			// (Debugger) Get the number of GPU on the local machine
			error = Ladybug.GetNumGPUs(ladybugContext, out m_numGPUs);
			//ladybugHandleError("GetNumGPUs()");

			Debug.WriteLine("[DEBUG] Number of GPUs : " + m_numGPUs.ToString());

            ////(Debugger)GPU renderer info
            //LadybugImageRenderingInfo imageRenderingInfo;
            //error = Ladybug.GetImageRenderingInfo(ladybugContext, out imageRenderingInfo);
            //ladybugHandleError("GetImageRenderingInfo()");

            //Debug.WriteLine(String.Format("Graphics card unit: {0}", imageRenderingInfo.pszOpenGLRenderer));
            //Debug.WriteLine(String.Format("OpenGL version: {0}", imageRenderingInfo.pszOpenGLVersion));
            //Debug.WriteLine(String.Format("Maximum texture size: {0} x {1}", imageRenderingInfo.uiMaxViewPortWidth, imageRenderingInfo.uiMaxViewPortHeight));

            // Configure the renderer to process image using following color method
            error = Ladybug.SetColorProcessingMethod(ladybugContext, configColorProcessing);
			ladybugHandleError("SetColorProcessingMethod()");

			// Configure the output image from renderer
			error = Ladybug.ConfigureOutputImages(ladybugContext, (uint) configOutputImage);
			ladybugHandleError("ConfigureOutputImages()");

			// Set the rendered image off screen size
			error = Ladybug.SetOffScreenImageSize(
				ladybugContext, 
				configOutputImage, 
				m_renderCols, m_renderRows);
			ladybugHandleError("SetOffScreenImageSize()");

			// Set the Panoramic viewing angle rotated by configPanoAngle
			error = Ladybug.SetPanoramicViewingAngle(ladybugContext, configPanoAngle);
			ladybugHandleError("SetPanoramicViewingAngle()");

			// Set the anti-aliasing
			error = Ladybug.SetAntiAliasing(ladybugContext, true);
			ladybugHandleError("SetAntiAliasing()");

			// End of configuration state  of renderer message
			Debug.WriteLine(String.Format("[DEBUG] Render property: {0} = {1}", "Color Processing Method", configColorProcessing));
			Debug.WriteLine(String.Format("[DEBUG] Render property: {0} = {1} x {2}", "Offscreen image size", m_renderCols, m_renderRows));

			return (error == 0);
		}

		/// <summary>
		/// Set up the trigger and strobe mode of the Ladybug camera
		/// For external Hardwarecontrol
		/// </summary>
		/// <param name="ch"></param>
		/// <returns></returns>
		public bool ConfigureTriggerStrobe(ContextHolder ch)
        {
			bool broadcast = false;

			LadybugStrobeControl strobeControl = new LadybugStrobeControl();
			strobeControl.bOnOff = false;   //
			strobeControl.uiSource = 1;		// Source GPIO pin 1
			strobeControl.uiPolarity = 0;	// Strobe polarity
			strobeControl.fDelay = 10;      // Delay (mS) after strobe to release image 
			strobeControl.fDuration = 10;	// Strobe Duration (mS)
			error = Ladybug.SetStrobe(ch.GetLadybugContext(), strobeControl, broadcast);

			LadybugTriggerMode triggerMode = new LadybugTriggerMode();
			triggerMode.bOnOff = true;      // Use this state to trigger
			triggerMode.uiMode = 0;			// Mode 0 (Standard External Trigger)
			triggerMode.uiSource = 0;		// Source GPIO pin 0
			triggerMode.uiParameter = 0;	// No parameteres to pass to mode 0
			triggerMode.uiPolarity = 0;		// 0-trigger low, 1-trigger high
			error = Ladybug.SetTriggerMode(ch.GetLadybugContext(), triggerMode, broadcast);

			// Setting buffer to a fixed percentage to fix the exposure length
			error = Ladybug.SetAutoJPEGQualityControlFlag(ch.GetLadybugContext(), false);
			ladybugHandleError("SetAutoJPEGQualityControlFlag()");

			error = Ladybug.SetJPEGQuality(ch.GetLadybugContext(), 80);
			ladybugHandleError("SetJPEGQuality()");

			return (error == 0);
        }

		

		/// <summary>
		/// Go to and grab the image from index in stream
		/// </summary>
		/// <param name="indexInStream"></param>
		public void FetchFromStream(in IntPtr ladybugContext, in IntPtr readerContext, uint indexInStream, ref int[][] outputBuffer, out string timeStamp)
		{
			lock (m_currentImageLock)
			{
				//Local image object
				LadybugImage m_currentImage;

				// Peek next image in counter position stream
				error = Ladybug.GoToImage(readerContext, indexInStream);
				ladybugHandleError("GoToImage()");

				// Grab the image at counter position
				error = Ladybug.ReadImageFromStream(readerContext, out m_currentImage);
				ladybugHandleError("ReadImageFromStream()");

                // Check if color processing method has been changed
                if (m_colorProcessChanged)
                {
                    error = Ladybug.SetColorProcessingMethod(ladybugContext, configColorProcessing);
                    ladybugHandleError("SetColorProcessingMethod()");

                    InitializeAlphaMasks(in ladybugContext, ref m_currentImage);

                    Debug.WriteLine("[DEBUG] Changed Color Processing Method: " + configColorProcessing);

                    m_colorProcessChanged = false;
                }

                // Check if the output image size has been changed
                if (m_outputSizeChanged)
                {
                    error = Ladybug.SetOffScreenImageSize(ladybugContext, configOutputImage, m_renderCols, m_renderRows);
                    ladybugHandleError("SetOffScreenImageSize()");

                    AllocateImageBuffer(out outputBuffer);

                    //m_colorBuffer = new int[m_renderCols][];
                    //for (int i = 0; i < m_renderCols; i++)
                    //{
                    //	m_colorBuffer[i] = new int[m_renderRows];
                    //}

                    Debug.WriteLine(String.Format("[DEBUG] Changed Render dimension: {0} x  {1}", m_renderCols, m_renderRows));

                    m_outputSizeChanged = false;
                }

                // Check if the panoramic angle has been changed
                if (m_panoramicAngleChanged)
                {
                    error = Ladybug.SetPanoramicViewingAngle(ladybugContext, configPanoAngle);
                    ladybugHandleError("SetPanoramicViewingAngle()");

                    Debug.WriteLine(String.Format("[DEBUG] Changed Panoramic Angle: {0}", configPanoAngle));

                    m_panoramicAngleChanged = false;
                }

                // Process image through renderer
                ProcessImage(in ladybugContext, ref m_currentImage, ref outputBuffer);

				GetImageTimeStamp(m_currentImage, out timeStamp);
			}
		}

		/// <summary>
		/// Fetch and lock the image from camera and write to stream file
		/// </summary>
		/// <param name="ch"></param>
		public void FetchFromCamera(in IntPtr ladybugContext, in IntPtr writerContext, ref int[][] outputBuffer)
		{
			LadybugImage currentImage;

			error = Ladybug.LockNext(ladybugContext, out currentImage);
			ladybugHandleError("LockNext()");

			error = Ladybug.GrabImage(ladybugContext, out currentImage);
			ladybugHandleError("GrabImage()");

			double numMBytesWrittenPerImage;
			uint numImagesWrittenInStream;
			error = Ladybug.WriteImageToStream(writerContext, ref currentImage, out numMBytesWrittenPerImage, out numImagesWrittenInStream);
			ladybugHandleError("WriteImageToStream()");

			ProcessImage(in ladybugContext, ref currentImage, ref outputBuffer);

			error = Ladybug.Unlock(ladybugContext, numImagesWrittenInStream);
		}

		/// <summary>
		/// Stops the ladybug's stream  
		/// </summary>
		/// <param name="ch"></param>
		public void StopFetching(in IntPtr ladybugContext)
		{
			error = Ladybug.StopStream(ladybugContext);
			ladybugHandleError("StopStream()");
		}

		/// <summary>
		/// Convert, and render the ladybug image that has been grabbed and fill out the pixel colors in the pixel buffer
		/// </summary>
		/// <param name="n"></param>
		private void ProcessImage(in IntPtr ladybugContext, ref LadybugImage m_currentImage, ref int[][] outputBuffer)
		{
			unsafe
			{
				//fixed (byte* texBufPtr = &m_textureBuffer[0])
				//{
                    //byte** texBufPtrArray = stackalloc byte*[6];
                    //for (int i = 0; i < 6; i++)
                    //{
                    //    texBufPtrArray[i] = texBufPtr + (isHighBitDepth ? i * 2 : i) * m_currentImage.uiRows * m_currentImage.uiCols * 4;
                    //}


                // TODO : Trying to wire up the Ladybug.cs with GPU update wrappers
                if (m_numGPUs > 0)
				{
					error = Ladybug.ConvertImageGPU(
						ladybugContext,
						ref m_currentImage,
						null,
						(isHighBitDepth ? LadybugPixelFormat.LADYBUG_RGBU16 : LadybugPixelFormat.LADYBUG_RGBU));
					ladybugHandleError("ConvertImageGPU()");

					error = Ladybug.UpdateTexturesGPU(
						ladybugContext,
						Ladybug.LADYBUG_NUM_CAMERAS,
						null,
						(isHighBitDepth ? LadybugPixelFormat.LADYBUG_RGBU16 : LadybugPixelFormat.LADYBUG_RGBU));
					ladybugHandleError("UpdateTexturesGPU()");
				} 
				else
                {
                    //error = Ladybug.ConvertImage(ch.GetLadybugContext(), ref m_currentImage, texBufPtrArray, (isHighBitDepth ? LadybugPixelFormat.LADYBUG_BGRU16 : LadybugPixelFormat.LADYBUG_BGRU));
                    error = Ladybug.ConvertImage(
						ladybugContext, 
						ref m_currentImage, 
						null, 
						(isHighBitDepth ? LadybugPixelFormat.LADYBUG_BGRU16 : LadybugPixelFormat.LADYBUG_BGRU));
                    ladybugHandleError("ConvertImage()");

                    //error = Ladybug.UpdateTextures(ch.GetLadybugContext(), Ladybug.LADYBUG_NUM_CAMERAS, texBufPtrArray, (isHighBitDepth ? LadybugPixelFormat.LADYBUG_BGRU16 : LadybugPixelFormat.LADYBUG_BGRU));
                    error = Ladybug.UpdateTextures(
						ladybugContext, 
						Ladybug.LADYBUG_NUM_CAMERAS, 
						null, 
						(isHighBitDepth ? LadybugPixelFormat.LADYBUG_BGRU16 : LadybugPixelFormat.LADYBUG_BGRU));
                    ladybugHandleError("UpdateTextures()");
                }

				LadybugProcessedImage processedImage = new LadybugProcessedImage();
				error = Ladybug.RenderOffScreenImage(
					ladybugContext,
					configOutputImage,
					LadybugPixelFormat.LADYBUG_BGR,
					out processedImage);
				ladybugHandleError("RenderOffScreenImage()");

				//// --- Save and reopen image method
				//string renderImagePath = Directory.GetCurrentDirectory() + "\\Output\\render-" + String.Format("{0:000000}", n.ToString()) + ".jpeg";
				//error = Ladybug.SaveImage(
				//	ch.GetLadybugContext(),
				//	ref processedImage,
				//	renderImagePath,
				//	LadybugSaveFileFormat.LADYBUG_FILEFORMAT_JPG,
				//	false);
				//ladybugHandleError("SaveImage()");
				//currentBitmap = new Bitmap(renderImagePath);

				GetImagePixelArray(in processedImage, ref outputBuffer);
			}

		}


		/// <summary>
		/// Initialize the alpha mask texture
		/// </summary>
		/// <param name="ch"></param>
		/// <returns></returns>
		private bool InitializeAlphaMasks(in IntPtr ladybugContext, ref LadybugImage m_currentImage)
		{
			if (ladybugContext == IntPtr.Zero)
			{
				return false;
			}

			// Get the color processing method
			LadybugColorProcessingMethod curMethod;
			Ladybug.GetColorProcessingMethod(ladybugContext, out curMethod);

			uint texture_width = m_currentImage.uiCols;
			uint texture_height = m_currentImage.uiRows;

			if (curMethod == LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE4 ||
				curMethod == LadybugColorProcessingMethod.LADYBUG_MONO)
			{
				texture_width /= 2;
				texture_height /= 2;
			}
			else if (curMethod == LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16)
			{
				texture_width /= 4;
				texture_height /= 4;
			}
			  
			error = Ladybug.LoadAlphaMasks(ladybugContext, texture_width, texture_height);
			if (error != LadybugError.LADYBUG_OK)
			{
				error = Ladybug.InitializeAlphaMasks(ladybugContext, texture_width, texture_height, false);
				ladybugHandleError("InitializeAlphaMasks()");
			}

			error = Ladybug.SetAlphaMasking(ladybugContext, true);
			ladybugHandleError("SetAlphaMasking()");

			// Return true if no errors, false if error occured
			return (error == 0);
		}

		/// <summary>
		/// Handle the errors returned by LadybugSDK
		/// </summary>
		/// <param name="lastFunctionPassed"></param>
		/// <returns></returns>
		private bool ladybugHandleError(string lastFunctionPassed)
		{
			if (error != LadybugError.LADYBUG_OK)
			{
				// Create string placeholders for the error message
				string errorString = System.Runtime.InteropServices.Marshal.PtrToStringAnsi(Ladybug.ErrorToString(error));
				string errorMessage = String.Format("{0} returned {1} :\n\t {2}", lastFunctionPassed, error, errorString);

				Debug.Write("[DEBUG] ladybugSDK\t");
				Debug.WriteLine(errorMessage);

				// TODO: Raise exception message box
				MessageBox.Show(errorMessage);

				return false;
			}
			return true;
		}

		
	}
}
