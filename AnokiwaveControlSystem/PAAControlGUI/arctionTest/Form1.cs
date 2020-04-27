using LadybugAPI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace arctionTest
{
	public partial class Form1 : Form
	{
		arctionChart arction;
		ladybugClass ladybug;
		Bitmap backgroundBitmap;
		public Form1()
		{
			InitializeComponent();

			// Attach the arction chart to the Form
			arction = new arctionChart();
			arction.Dock = DockStyle.Fill;
			this.Controls.Add(arction);

			//System.Net.WebRequest request = System.Net.WebRequest.Create("https://media.giphy.com/media/xDQ3Oql1BN54c/giphy.gif");
			//System.Net.WebResponse response = request.GetResponse();
			//System.IO.Stream responseStream = response.GetResponseStream();
			//backgroundBitmap = new Bitmap(responseStream);

			//ImageAnimator.Animate(backgroundBitmap, new EventHandler(this.OnFrameChanged));

			//Bitmap temp = (Bitmap)Bitmap.FromFile(Application.StartupPath + "\\space_background.gif");

			//arction.chartBackground = backgroundBitmap;
			
			ladybug = new ladybugClass();
			ladybug.LadybugInitialize();

			ladybug.LadybugGetImages();
			//ladybug.LadybugImageFromStream();

			arction.chartBackground = ladybug.ladybugProcImage;




			//Application.Idle += new System.EventHandler(this.Form1_Idle);
		}

		private void Form1_Idle(object sender, System.EventArgs e)
		{
			arction.chartBackground = ladybug.LadybugStepStreamCounter();
		}


	}
}
