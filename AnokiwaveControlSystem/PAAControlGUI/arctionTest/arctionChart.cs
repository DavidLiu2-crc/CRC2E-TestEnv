using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Arction.LightningChartUltimate;
using Arction.LightningChartUltimate.Axes;
using Arction.LightningChartUltimate.SeriesXY;
using Arction.LightningChartUltimate.Views.ViewXY;
using Arction.LightningChartUltimate.Annotations;

namespace arctionTest
{
	public partial class arctionChart : UserControl
	{
		LightningChartUltimate _chart;
		
		IntensityGridSeries imageGrid;

		IntensityGridSeries wireGrid;
		string lightningLicenseKey = "Communications Research Centre Canada (CRC)/Developer1/LightningChartUltimate/G2RC2UYKP5Z78Y2293C3RW8JAY2TA43G294V";

		public arctionChart()
		{
			InitializeComponent();

			CreateChart();



		}

		public void CreateChart()
		{
			_chart = this.lightningChart;
			_chart.LicenseKey = lightningLicenseKey;

			_chart.BeginUpdate();

			// Configure the chart handle
			_chart.Title.Text = "Arction dynamic chart";
			
			_chart.ViewXY.ZoomPanOptions.LeftMouseButtonAction = MouseButtonAction.Zoom;
			_chart.ViewXY.ZoomPanOptions.RightMouseButtonAction = MouseButtonAction.Pan;

			_chart.ActiveView = ActiveView.ViewXY;
			_chart.ViewXY.LegendBox.Visible = false;
			_chart.ViewXY.XAxes[0].ValueType = AxisValueType.Number;
			_chart.ViewXY.XAxes[0].SetRange(-360, 360);
			_chart.ViewXY.YAxes[0].ValueType = AxisValueType.Number;
			_chart.ViewXY.YAxes[0].SetRange(-90, 90);

			// Configure the background intensity handle
			imageGrid = new IntensityGridSeries(_chart.ViewXY, _chart.ViewXY.XAxes[0], _chart.ViewXY.YAxes[0]);
			imageGrid.SetRangesXY(-360, 360, -90, 90);
			imageGrid.Fill = IntensityFillStyle.FromSurfacePoints;
			imageGrid.Optimization = IntensitySeriesOptimization.DynamicData;
			imageGrid.PixelRendering = true;
			imageGrid.MouseInteraction = true;
			imageGrid.Visible = false;

			_chart.ViewXY.IntensityGridSeries.Add(imageGrid);

			_chart.EndUpdate();
		}

		public void generateRandomData()
		{
			Random rand = new Random();
			double[,] data = new double[360, 90];
			for(int i = 0; i < 360; i++)
			{
				for(int j = 0; j < 90; j++)
				{
					data[i, j] = 100 * rand.NextDouble();
				}
			}

		}

		public Bitmap chartBackground
		{
			set
			{
				if (value != null)
				{
					Bitmap image = new Bitmap(value.Width, value.Height, value.PixelFormat);
					using (Graphics graphics = Graphics.FromImage(image))
					{
						graphics.DrawImage(value,
							new Rectangle(new System.Drawing.Point(value.Width, 0), value.Size),
							new Rectangle(new System.Drawing.Point(), value.Size),
							GraphicsUnit.Pixel);
					}

					// Create image background
					BitmapAntialiasOptions options = new BitmapAntialiasOptions() { ResolutionDivider = 2 };
					imageGrid.SetHeightDataFromBitmap(-360, 360, -90, 90, 0, 100, value, options);
					imageGrid.Visible = true;
					
					
				}
			}
		}
		public void updateBitmap(Bitmap bitmap)
		{
			chartBackground = bitmap;
			imageGrid.InvalidateData();
		}

		private void lightningChart_Load(object sender, EventArgs e)
		{

		}
	}
}
