using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;

using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;

using LadybugAPI;
using System.Runtime.CompilerServices;
using Arction.LightningChartUltimate;

namespace ControlGUI
{
	public partial class Form1 : Form
	{
		// Initialize offscreen image renderer
		private uint imageRenderedCols = 1024;  // Offscreen cols
		private uint imageRenderedRows = 512;  // Offscreen rows

		// Define using user-defined classes
		private arctionChart arction = new arctionChart(-180, 180, -90, 90);
		private ladybugClass ladybug = new ladybugClass(1024, 512);
		//private dataStructureClass dataManager;

		// Initialize the background worker
		private BackgroundWorker ladybugStreamWorker;	// Background worker for updating background
		private BackgroundWorker ladybugCameraWorker;	// Background worker for updating background

		private BackgroundWorker heatmapWorker;	// Background worker for updating heatmap overlay
		
		// Timed event for updating the frame rate counter
		//System.Timers.Timer frameRateTimer;

		// Initialize stream file related parameters
		private string m_streamFilePath;        // Stream configurable parameters
		private uint m_numImages = 0;           // Total number of images found in stream file

		private bool button2_status = false;

		// Background image pixel array	
		private int[][] colorBuffer
		{
			set
			{
				arction.updateBackground(value);
			}
		}

		// Heatmap value array
		private double[][] dataBuffer
		{
			set
			{
				arction.updateHeatmap(value);
			}
		}
		
		// Form constructor initialize user control
		public Form1() : base()
		{
			// Initialize UserControl component
			InitializeComponent();

			// Configure the initial state of configuration and labels
			this.comboBox1.Text = "Down Sampling 16 (Fastest)";
			this.comboBox2.Text = "Front 2 Pole 5";
			this.numericUpDown1.Value = new decimal(imageRenderedCols);
			this.numericUpDown2.Value = new decimal(imageRenderedRows);
			this.label1.Text = "0 / 0";		// Show image counter in stream loaded
			this.label2.Text = "0.0 FPS";	// Show the instantaneous frame rate counter
			this.label7.Text = "0.000 mS";  // Show the average processing time per frame

			// Attach the arction chart to the Form (maximize the size of chart to fit in panel2)
			this.panel2.Controls.Add(arction);  // Add the user-defined Arction control to view panel
			arction.Dock = DockStyle.Fill;

			// Set up background worker for ladybug
			ladybugStreamWorker = new BackgroundWorker();
			ladybugStreamWorker.WorkerSupportsCancellation = true;
			ladybugStreamWorker.DoWork += ladybugStreamWorker_DoWork;

			// Set up background worker for ladybug
			ladybugCameraWorker = new BackgroundWorker();
			ladybugCameraWorker.WorkerSupportsCancellation = true;
			ladybugCameraWorker.DoWork += ladybugCameraWorker_DoWork;
			

			// Set up background worker for heatmap
			heatmapWorker = new BackgroundWorker();
			heatmapWorker.WorkerSupportsCancellation = true;
			heatmapWorker.DoWork += heatmapWorker_DoWork;


		}

		/// <summary>
		/// Define a function to delegate Actions to the caller function
		/// Used by a background worker to delegate work back to main thread
		/// </summary>
		/// <param name="code">Lines of code wrapped as an Action object to be invoked (repeatable)</param>
		private void UIThread(Action code)
		{
			if (this.InvokeRequired)
			{
				this.BeginInvoke(code);
				return;
			}
			code.Invoke();
		}

		/// <summary>
		/// Ladybug get stream do worker definition
		/// Initializes the ladybug context and stream context and iteratively grab image frames from the pgr stream file and render it.
		/// Calls the UIThread to update the rendered image (asynconous return)
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		public void ladybugStreamWorker_DoWork(object sender, DoWorkEventArgs e)
		{
			// ContextHolder
			using (ContextHolder ch = new ContextHolder())
			{
				//StatusLabel4 is the lower status label that gives updates on what is going on with this worker

				// Assume stream button has been clicked and a valid path is configured
				this.toolStripStatusLabel4.Text = "Initialized Ladybug context";

				ladybug.InitializeStreamReader(ch.GetLadybugContext(), ch.GetReaderContext(), ref m_streamFilePath, out m_numImages);
				this.toolStripStatusLabel4.Text = "Configured Stream reader with " + m_numImages.ToString() + " images";
				
				ladybug.InitializeOffScreenRender(ch.GetLadybugContext());
				this.toolStripStatusLabel4.Text = "Configured the off screen renderer";

				// Intialize local DateTime object to calculate frame rate / processing time between frames
				DateTime lastFrame = DateTime.Now;
				string frameTimeStamp = "";

				// Allocates pixel memory (ARGB) for rendered image array buffer
				int[][] pixelImage;
				ladybug.AllocateImageBuffer(out pixelImage);

				// For stream files which predefined number of frames, can iteratively loop through i=0 to n
				for (uint n = 0; n < m_numImages; n++)
				{
					// Break condition, assuming m_numImages already set
					//if (n > m_numImages) break;	// more useful inside a while loop in case of a stream file that is being recorded to

					// Get the next image frame from the stream file
					ladybug.FetchFromStream(ch.GetLadybugContext(), ch.GetReaderContext(), n,
						ref pixelImage, out frameTimeStamp);

					// Delegate UI thread updates back to caller of this background worker
					this.UIThread(delegate
					{
						// Update the frame rate, frame counter and processing time label
						updateFrameLabels(ref lastFrame, n);

						// Update frame time stamps of rendered image
						toolStripStatusLabel2.Text = frameTimeStamp;

						// Pass the pixel array back to the UI thread to assign to Arction.
						colorBuffer = pixelImage;


					});
					
				}
			}
		}

		/// <summary>
		/// Ladybug get camera do worker definition
		/// Initializes the ladybug context and writer stream context and iteratively grab image frames from camera, renders it and writes to pgr file.
		/// Calls the UIThread to update the rendered image (asynconous return)
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		public void ladybugCameraWorker_DoWork(object sender, DoWorkEventArgs e)
		{
			// Check if an output folder exist in execution path
			string thisDirectory = Directory.GetCurrentDirectory();
			System.IO.Directory.CreateDirectory("Output");

			// Defining the output labybug stream file name with
			string outputBaseStreamName = "ladybug_";
			DateTime now = new DateTime();
			outputBaseStreamName += now.ToString("yyyymmdd_HHmmss");

			string outputPathStreamName = thisDirectory + "\\Output\\" + outputBaseStreamName;

			// TODO: Change the attribute of the button to stop recording if pressed again (Not implemented)
			button2_status = true;
			this.UIThread(delegate
			{
				button2.Text = "Stop recording";
			});

			// Intialize local DateTime object to calculate frame rate / processing time between frames
			DateTime lastFrame = DateTime.Now;
			string frameTimeStamp = "";

			// Allocates pixel memory (ARGB) for rendered image array buffer
			int[][] pixelImage;
			ladybug.AllocateImageBuffer(out pixelImage);

			using (ContextHolder ch = new ContextHolder()) {
				// Configure the camera to initialize the camera for writing incoming stream of images
				ladybug.InitializeStreamWriter(ch, ref outputPathStreamName);

				// Configure the camera to set trigger mode to strobe
				ladybug.ConfigureTriggerStrobe(ch);

				// Initialize the renderer with properties
				ladybug.InitializeOffScreenRender(ch.GetLadybugContext());
				
				uint n = 0; // Frame counter
				while (button2_status)
                {
					// 
					ladybug.FetchFromCamera(ch.GetLadybugContext(), ch.GetReaderContext(), ref pixelImage);
					//ladybug.GetImagePixel(out pixelImage);

					// Delegate UI thread updates back to caller of this background worker
					this.UIThread(delegate
					{
                        // Update the frame rate, frame counter and processing time label
                        updateFrameLabels(ref now, n++);

						// Pass the pixel array back to the UI thread to assign to Arction.
						colorBuffer = pixelImage;
					});

				}

				ladybug.StopFetching(ch.GetLadybugContext());
            }


			button2_status = false;
			this.UIThread(delegate
			{
				button2.Text = "Start From Camera";
			});
		}

		/// <summary>
		/// Heatmap do worker definition
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		public void heatmapWorker_DoWork(object sender, DoWorkEventArgs e)
		{
			while(true)
			{
				// TODO: Insert function to hold and waiting for incoming PXA fetch block
				// Introduce more fetch blocks in case where fetch length > fetch block


				// Temporary blocking method here
				Thread.Sleep(300);

				// Update the heatmap data at the end of each loop
				double[][] heatmapData = RandomFuncs.generateRandomDouble(-100, 13, 13);
				dataBuffer = heatmapData;
			}

		}

		/// <summary>
		/// Get time difference 
		/// </summary>
		/// <param name="lastTime"></param>
		/// <param name="frames"></param>
		/// <returns></returns>
		public double getTimeDiffer(ref DateTime lastTime, uint frames)
		{
			DateTime nowTime = DateTime.Now;

			TimeSpan timeDiff = nowTime - lastTime;
			double frameSecs = timeDiff.TotalSeconds;

			lastTime = nowTime;

			return frames / frameSecs;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="lastTime"></param>
		/// <param name="frameCounter"></param>
		public void updateFrameLabels(ref DateTime lastTime, uint frameCounter)
        {
			// Update the frame counter in UI
			label1.Text = frameCounter.ToString() + " / " + m_numImages.ToString();
			toolStripStatusLabel4.Text = "Rendering";

			//Update the frame rate counter every 5 image frames
			uint frames = 5;

			if (frameCounter % frames == 0)
            {
				// Calcuate and update the frame rate
				double frameRate = getTimeDiffer(ref lastTime, frames);
				label2.Text = String.Format("{0:F2} FPS", frameRate);

				// Calculate the average time to process these n number of  frames
				double frameTime = 1000 / frameRate;
				label7.Text = String.Format("{0:F3} mS", frameTime);
			}
		}

		// --- Defining event onClick and onChanged funtions --------------------------------------

		/// <summary>
		/// Button click for loading stream file event handler
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void button1_Click(object sender, EventArgs e)
		{
			OpenFileDialog streamFileDialog = new OpenFileDialog();
			streamFileDialog.Filter = "Stream files (*.pgr)|*.pgr";
			streamFileDialog.InitialDirectory = System.Windows.Forms.Application.ExecutablePath;
			DialogResult digRes = streamFileDialog.ShowDialog();
			m_streamFilePath = streamFileDialog.FileName;
			// TODO: Add exeception if no stream file selected
			this.toolStripStatusLabel4.Text = "Opening stream file: " + m_streamFilePath;

			// Start background worker
			ladybugStreamWorker.RunWorkerAsync();

		}

		/// <summary>
		/// Button click for setting the camera up for live stream capture event handler
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
 		private void button2_Click(object sender, EventArgs e)
        {
			if (button2_status == false)
            {
				// Start background worker
				ladybugCameraWorker.RunWorkerAsync();
			}
			

        }

		/// <summary>
		/// Button click for generating random heatmap event handler
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void button3_Click(object sender, EventArgs e)
		{
			heatmapWorker.RunWorkerAsync();
		}

		/// <summary>
		/// ComboBox for color processing method event handler
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
		{
			LadybugColorProcessingMethod configColorProcessing;

			// Select the appropriate color processing method
			switch (comboBox1.SelectedItem.ToString().Trim())
			{
				case "Down Sampling 16 (Fastest)":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16;
					break;
				case "Down Sampling 4":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE4;
					break;
				case "Nearest Neighbour (Fast)":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_NEAREST_NEIGHBOR_FAST;
					break;
				case "Edge Sensing":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_EDGE_SENSING;
					break;
				case "High Quality (CPU)":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_HQLINEAR;
					break;
				case "High Quality (GPU)":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_HQLINEAR_GPU;
					break;
				case "Rigourous":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_RIGOROUS;
					break;
				case "Weighted Directional Filter (Best)":
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_WEIGHTED_DIRECTIONAL_FILTER;
					break;
				default:
					configColorProcessing = LadybugColorProcessingMethod.LADYBUG_DOWNSAMPLE16;
					break;
			}

			// Pass the selected method back to ladybug class and trigger method changed flag
			ladybug.ConfigureRenderer(configColorProcessing);
		}

		/// <summary>
		/// ComboBox for panoramic angle event handler
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
		{
			LadybugPanoAngle configPanoAngle;

			// Select the appropriate panoramic angle
			switch (comboBox2.SelectedItem.ToString().Trim())
			{
				case "Front 0 Pole 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_0_POLE_5;
					break;
				case "Front 1 Pole 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_1_POLE_5;
					break;
				case "Front 2 Pole 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_2_POLE_5;
					break;
				case "Front 3 Pole 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_3_POLE_5;
					break;
				case "Front 4 Pole 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_4_POLE_5;
					break;
				case "Front 0 Down 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_0_DOWN_5;
					break;
				case "Front 1 Down 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_1_DOWN_5;
					break;
				case "Front 2 Down 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_2_DOWN_5;
					break;
				case "Front 3 Down 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_3_DOWN_5;
					break;
				case "Front 4 Down 5":
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_4_DOWN_5;
					break;
				default:
					configPanoAngle = LadybugPanoAngle.LADYBUG_FRONT_0_POLE_5;
					break;
			}

			// Pass the selected panoramic angle to ladybug class and trigger angle changed flag
			ladybug.ConfigureRenderer(configPanoAngle);
		}

		/// <summary>
		/// Numerical value for number of columns of rendered output resolution
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void numericUpDown1_ValueChanged(object sender, EventArgs e)
		{
			// Grab the changed column value
			imageRenderedCols = (uint)numericUpDown1.Value;

			// Pass the column value and reinitialize the int[][] pixel array
			ladybug.ConfigureRenderer(imageRenderedCols, imageRenderedRows);
		}

		/// <summary>
		/// Numerical value for number of rows of rendered output resolution
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void numericUpDown2_ValueChanged(object sender, EventArgs e)
		{
			// Grab the changed row value
			imageRenderedRows = (uint)numericUpDown2.Value;

			// Pass the row value and reinitialize the int[][] pixel array
			ladybug.ConfigureRenderer(imageRenderedCols, imageRenderedRows);
		}

        



        //private void timer_Elapsed(Object source, System.Timers.ElapsedEventArgs e)
        //{
        //	  arction.updateBitmap(currentBitmap.Clone(new Rectangle(0, 0, currentBitmap.Width, currentBitmap.Height), currentBitmap.PixelFormat));
        //}

    }
}
