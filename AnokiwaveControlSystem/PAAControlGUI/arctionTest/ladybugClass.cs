using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

using LadybugAPI;
using System.Diagnostics;
using System.Drawing;

namespace arctionTest
{
	class ladybugClass
	{
		IntPtr contextMain;
		IntPtr contextStream;
		LadybugError error;

		LadybugColorProcessingMethod configColorProcessing = LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16;
		LadybugPixelFormat configPixelFormat;
		LadybugOutputImage configOutputImage = LadybugOutputImage.LADYBUG_PANORAMIC;

		bool configUseGPU = true;

		IntPtr imagePtr;
		LadybugPixelFormat imagePixelFormat;
		uint imageCols;
		uint imageRows;
		Bitmap bitmap;

		

		static string dir = @"S:\Projects\MC2\Measurements\Data\2019.11.08\Ladybug\ladybug_13451180_20191108_132258-000000.pgr";
		string streamFile = dir;
		string calFile = @"ladybug13451180.cal";


		private System.Object m_currentImageLock = new System.Object();

		public void LadybugInit()
		{
			// Create the ladybug context handle --------------------------------------------------
			LadybugInitialize();

			// Initialize the stream --------------------------------------------------------------
			LadybugConfigStream();

			// Check the stream imported and avaliable GPU
			LadybugCheckForGPU();

			// Configure the post processing ------------------------------------------------------
			error = Ladybug.SetColorProcessingMethod(contextMain, configColorProcessing);
			handleError("SetColorProcessingMethod()");

			LadybugImage m_currentImage;
			lock (m_currentImageLock) {
				error = Ladybug.ReadImageFromStream(contextStream, out m_currentImage);
				handleError("ReadImageFromStream()");
			}

			bool isHighBitDepth = dataFormat.isHighBitDepth(m_currentImage.dataFormat);
			configPixelFormat = (isHighBitDepth ? LadybugPixelFormat.LADYBUG_BGRU16 : LadybugPixelFormat.LADYBUG_BGRU);

			long m_textureByteSize = m_currentImage.uiRows * m_currentImage.uiCols * 4 * (isHighBitDepth ? 2 : 1);
			//byte[] m_textureBuffer = new byte[Ladybug.LADYBUG_NUM_CAMERAS * m_textureByteSize];

			uint textureWidth = m_currentImage.uiCols;
			uint textureHeight = m_currentImage.uiRows;
			if (configColorProcessing == LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE4 || configColorProcessing == LadybugColorProcessingMethod.LADYBUG_MONO)
			{
				textureWidth /= 2;
				textureHeight /= 2;
			}
			else if (configColorProcessing == LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16)
			{
				textureWidth /= 4;
				textureHeight /= 4;
			}

			// Configure the alpha masks ----------------------------------------------------------
			error = Ladybug.LoadAlphaMasks(contextMain, textureWidth, textureHeight);
			if (error != LadybugError.LADYBUG_OK)
			{
				error = Ladybug.InitializeAlphaMasks(contextMain, textureWidth, textureHeight, true);
				handleError("InitializeAlphaMasks()");

				if (error == LadybugError.LADYBUG_OK)
				{
					Debug.WriteLine("Alpha initialized");
				}
			}
			else
			{
				handleError("LoadAlphaMasks()");
			}

			error = Ladybug.SetAlphaMasking(contextMain, true);
			handleError("SetAlphaMasking()");

			error = Ladybug.EnableSoftwareRendering(contextMain, true);
			handleError("EnableSoftwareRendering()");

			// Configure the output image
			error = Ladybug.ConfigureOutputImages(contextMain, (uint)configOutputImage);
			handleError("ConfigureOutputImages()");

			error = Ladybug.SetOffScreenImageSize(contextMain, configOutputImage, textureWidth, textureHeight);
			handleError("SetOffScreenImageSize()");

			error = Ladybug.GoToImage(contextStream, 0);
			handleError("GoToImage()");

		}

		unsafe public void LadybugImageFromStream()
		{
			lock (m_currentImageLock)
			{
				LadybugImage m_currentImage = new LadybugImage();
				LadybugProcessedImage m_processedImage = new LadybugProcessedImage();

				error = Ladybug.ReadImageFromStream(contextStream, out m_currentImage);
				handleError("ReadImageFromStream()");

				error = Ladybug.ConvertImage(contextMain, ref m_currentImage, null, configPixelFormat);
				handleError("ConvertImage()");

				error = Ladybug.UpdateTextures(contextMain, Ladybug.LADYBUG_NUM_CAMERAS, null, configPixelFormat);
				handleError("UpdateTextures()");

				error = Ladybug.RenderOffScreenImage(contextMain, configOutputImage, LadybugPixelFormat.LADYBUG_BGR, out m_processedImage);
				handleError("RenderOffScreenImage()");

				error = Ladybug.SaveImage(contextMain, ref m_processedImage, "rendered.jpeg", LadybugSaveFileFormat.LADYBUG_FILEFORMAT_JPG, true);
				handleError("SaveImage()");



				//imagePtr = IntPtr(m_processedImage.pData);
				imagePixelFormat = m_processedImage.pixelFormat;
				imageRows = m_processedImage.uiRows;
				imageCols = m_processedImage.uiCols;

				System.Drawing.Imaging.PixelFormat pixelFormat = System.Drawing.Imaging.PixelFormat.Format32bppArgb;
				//bitmap = new Bitmap((int)imageRows, (int)imageCols, 2, pixelFormat, imagePtr);

				error = Ladybug.ReleaseOffScreenImage(contextMain, configOutputImage);
				handleError("ReleaseOffScreenImage()");


			}
		}
		private bool LadybugInitialize()
		{
			error = Ladybug.CreateContext(out contextMain);
			handleError("CreateContext()");

			error = Ladybug.CreateStreamContext(out contextStream);
			handleError("CreateStreamContext()");

			bool async = true;
			error = Ladybug.InitializeStreamForReading(contextStream, streamFile, async);
			handleError("InitializeStreamForReading()");

			Debug.WriteLine("[Debug] Ladybug context initialized.");

			if (contextMain != null && contextStream != null)
			{
				return true;
			}
			return false;
		}
		private bool LadybugConfigStream()
		{
			string configFilename = System.IO.Path.GetTempFileName();
			error = Ladybug.GetStreamConfigFile(contextStream, configFilename);
			handleError("GetStreamConfigFile()");

			LadybugStreamHeadInfo streamHeadInfo = new LadybugStreamHeadInfo();
			error = Ladybug.GetStreamHeader(contextStream, out streamHeadInfo, null);
			handleError("GetStreamHeader()");

			error = Ladybug.SetColorTileFormat(contextMain, streamHeadInfo.stippledFormat);
			handleError("SetColorTileFormat()");

			error = Ladybug.LoadConfig(contextMain, configFilename);
			handleError("loadConfig()");

			System.IO.File.Delete(configFilename);

			uint numImages = 0;
			error = Ladybug.GetStreamNumOfImages(contextStream, out numImages);
			handleError("GetStreamNumOfImages()");

			Debug.WriteLine("[Debug] Ladybug loaded stream");
			Debug.WriteLine("[Debug] Number of images in stream: {0}", numImages);

			if (numImages == 0) return false;
			return true;
		}

		unsafe private bool LadybugCheckForGPU()
		{
			uint numGPUs = 0;
			error = Ladybug.GetNumGPUs(contextMain, out numGPUs);
			handleError("GetNumGPUs()");
			Debug.WriteLine("[Debug] Number of GPUs: {0}", numGPUs);

			if (numGPUs > 0)
			{
				configColorProcessing = LadybugColorProcessingMethod.LADYBUG_HQLINEAR_GPU;
			}

			//uint* uiID;
			//float fROIWidth, fROIHeight;
			//error = Ladybug.GetOpenGLTextureID(contextMain, configOutputImage, out uiID, out fROIWidth, out fROIHeight);
			//handleError("GetOpenGLTextureID()");

			//Debug.WriteLine("OpenGLTextureID: {0}, {1}, {2}", *uiID, fROIWidth, fROIHeight);

			
			return true;
		}

		public Bitmap ladybugProcImage
		{
			get
			{
				return bitmap;
			}
		}
		
		public void LadybugClose()
		{
			error = Ladybug.DestroyContext(ref contextMain);
			handleError("DestroyContext()");

			error = Ladybug.DestroyStreamContext(ref contextStream);
			handleError("DestroyStreamContext()");
		}
		private bool handleError(string lastFunctionPassed)
		{
			if (error != LadybugError.LADYBUG_OK)
			{
				Debug.Write("[DEBUG] ladybugSDK\t");
				Debug.WriteLine("{0} returned {1} :\n\t {2}",
					lastFunctionPassed, error,
					System.Runtime.InteropServices.Marshal.PtrToStringAnsi(Ladybug.ErrorToString(error)));
				return false;
			}
			return true;
		}
	}
}
