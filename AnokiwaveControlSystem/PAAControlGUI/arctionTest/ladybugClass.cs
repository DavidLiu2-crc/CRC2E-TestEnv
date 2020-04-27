using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.IO;
using System.Runtime.InteropServices;

using LadybugAPI;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;

namespace arctionTest
{
	class ladybugClass
	{
		IntPtr contextMain;
		IntPtr contextStream;
		OpenGLBase openGLBase;
		LadybugError error;

		LadybugColorProcessingMethod configColorProcessing = LadybugColorProcessingMethod.LADYBUG_NEAREST_NEIGHBOR_FAST;
		LadybugPixelFormat configPixelFormat;
		LadybugOutputImage configOutputImage = LadybugOutputImage.LADYBUG_PANORAMIC;
		LadybugPixelFormat configOutputPixelformat = LadybugPixelFormat.LADYBUG_BGR;
		LadybugImage imageCurrent = new LadybugImage();
		LadybugProcessedImage imageProcessed = new LadybugProcessedImage();

		bool streamIsLoaded = false;
		bool imageIsUpdated = false;
		string streamFilePath;
		uint ctrImagesInStream = 0;
		uint numImagesInStream = 0;

		IntPtr imagePtr;
		LadybugPixelFormat imagePixelFormat;
		uint imageCols;
		uint imageRows;
		Bitmap bitmap;



		private System.Object m_currentImageLock = new System.Object();

		unsafe public void LadybugInitialize()
		{
			if (contextMain == IntPtr.Zero)
			{
				error = Ladybug.CreateContext(out contextMain);
				handleError("CreateContext()");
			}

			if (contextStream == IntPtr.Zero)
			{
				error = Ladybug.CreateStreamContext(out contextStream);
				handleError("CreateStreamContext()");
			}


			OpenFileDialog streamFileDialog = new OpenFileDialog();
			streamFileDialog.Filter = "Stream files (*.pgr)|*.pgr";
			streamFileDialog.InitialDirectory = System.Windows.Forms.Application.ExecutablePath;
			DialogResult digRes = streamFileDialog.ShowDialog();
			// TODO: Add exeception if no stream file selected

			streamFilePath = streamFileDialog.FileName;
			error = Ladybug.InitializeStreamForReading(contextStream, streamFilePath, true);
			handleError("InitializeStreamForReading()");

			LadybugStreamHeadInfo streamHeadInfo;
			string configTempConfigPath = System.IO.Path.GetTempFileName();
			error = Ladybug.GetStreamConfigFile(contextStream, configTempConfigPath);
			handleError("GetStreamConfigFile()");

			error = Ladybug.GetStreamHeader(contextStream, out streamHeadInfo, streamFilePath);
			handleError("GetStreamHeader()");

			error = Ladybug.SetColorTileFormat(contextMain, streamHeadInfo.stippledFormat);
			handleError("SetColorTileFormat()");

			error = Ladybug.LoadConfig(contextMain, configTempConfigPath);
			handleError("LoadConfig()");
			System.IO.File.Delete(configTempConfigPath);


			lock (m_currentImageLock)
			{
				error = Ladybug.ReadImageFromStream(contextStream, out imageCurrent);
				imageCols = imageCurrent.uiCols;
				imageRows = imageCurrent.uiRows;
				handleError("ReadImageFromStream()");
			}

			error = Ladybug.GetStreamNumOfImages(contextStream, out numImagesInStream);
			handleError("GetStreamNumOfImages()");

			LadybugCheckForGPU();

			error = Ladybug.SetColorProcessingMethod(contextMain, configColorProcessing);
			handleError("SetColorProcessingMethod()");

			bool isHighBitDepth = dataFormat.isHighBitDepth(imageCurrent.dataFormat);
			configPixelFormat = (isHighBitDepth ? LadybugPixelFormat.LADYBUG_BGRU16 : LadybugPixelFormat.LADYBUG_BGRU);
			// 6 * (2, 1) * sensorWidth * sensorHeight * BGRU
			

			uint textureHeight, textureWidth;
			if (configColorProcessing == LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE4 || configColorProcessing ==LadybugColorProcessingMethod.LADYBUG_MONO)
			{
				textureHeight = imageRows / 2;
				textureWidth = imageCols / 2;
			}
			else if (configColorProcessing == LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16)
			{
				textureHeight = imageRows / 4;
				textureWidth = imageCols / 4;
			}
			else
			{
				textureHeight = imageRows;
				textureWidth = imageCols;
			}

			error = Ladybug.LoadAlphaMasks(contextMain, textureWidth, textureHeight);
			if (error != LadybugError.LADYBUG_OK)
			{
				error = Ladybug.InitializeAlphaMasks(contextMain, textureWidth, textureHeight, false);
				handleError("InitializeAlphaMasks()");
			}

			error = Ladybug.ConfigureOutputImages(contextMain, (0x1 << 12));
			handleError("ConfigureOutputImages()");
			


		}

		unsafe private void processImage()
		{
			lock (m_currentImageLock)
			{
				// 
				bool isHighBitDepth = dataFormat.isHighBitDepth(imageCurrent.dataFormat);
				byte[] textureBuffer = new byte[Ladybug.LADYBUG_NUM_CAMERAS * (isHighBitDepth ? 2 : 1) * 4 * imageCols * imageRows];

				fixed (byte* textureBufPtr = &textureBuffer[0])
				{
					byte** textureBufArray = stackalloc byte*[6];
					for (int i = 0; i < 6; i++)
					{
						textureBufArray[i] = textureBufPtr + i * (isHighBitDepth ? 2 : 1) * imageRows * imageCols * 4;
					}

					error = Ladybug.ConvertImage(contextMain, ref imageCurrent, textureBufArray, configPixelFormat);
					handleError("ConvertImage()");

					error = Ladybug.UpdateTextures(contextMain, Ladybug.LADYBUG_NUM_CAMERAS, textureBufArray, configPixelFormat);
					handleError("UpdateTextures()");

					error = Ladybug.RenderOffScreenImage(contextMain, LadybugOutputImage.LADYBUG_PANORAMIC, configOutputPixelformat, out imageProcessed);
					handleError("RenderOffScreenImage()");

					string renderImagePath = Directory.GetCurrentDirectory() + "\\Output\\render.jpeg";
					error = Ladybug.SaveImage(contextMain, ref imageProcessed, renderImagePath, LadybugSaveFileFormat.LADYBUG_FILEFORMAT_JPG, false);

					bitmap = new Bitmap(renderImagePath);

					error = Ladybug.ReleaseOffScreenImage(contextMain, configOutputImage);
					handleError("ReleaseOffScreenImage()");

				}
			}
		}

		private bool LadybugCheckForGPU()
		{
			uint numGPUs = 0;
			error = Ladybug.GetNumGPUs(contextMain, out numGPUs);
			handleError("GetNumGPUs()");
			Debug.WriteLine("[Debug] Number of GPUs: {0}", numGPUs);

			if (numGPUs > 0)
			{
				configColorProcessing = LadybugColorProcessingMethod.LADYBUG_HQLINEAR_GPU;

				error = Ladybug.EnableSoftwareRendering(contextMain, true);
				handleError("EnableSoftwareRendering()");
			}
			
			return true;
		}

		public Bitmap ladybugProcImage
		{
			get
			{
				ctrImagesInStream++;

				error = Ladybug.GoToImage(contextStream, ctrImagesInStream);
				handleError("GoToImage()");

				error = Ladybug.ReadImageFromStream(contextStream, out imageCurrent);
				handleError("ReadImageFromStream()");

				processImage();

				return bitmap;
			}
		}

		public void LadybugGetImages()
		{


		}

		public Bitmap LadybugStepStreamCounter()
		{
			ctrImagesInStream++;

			return ladybugProcImage;
		}

		public void LadybugClose()
		{
			error = Ladybug.DestroyContext(ref contextMain);
			handleError("DestroyContext()");

			error = Ladybug.DestroyStreamContext(ref contextMain);
			handleError("DestroyStreamContext()");

			contextMain = IntPtr.Zero;
			contextStream = IntPtr.Zero;
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
