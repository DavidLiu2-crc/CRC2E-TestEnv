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

namespace ControlGUI
{
	/// <summary>
	/// Defines the user-defined arction class, inheriting the UserControl object (to be added to Form)
	/// </summary>
	public partial class arctionChart : UserControl
	{
		// Initialize the pointer object to the chart
		LightningChartUltimate _chart;

		IntensityGridSeries imageGrid;  // Define the grid series for the background image
		IntensityGridSeries wireGrid;   // Define the grid series for the heatmap

		// Define the developer license string (from 2015 Arction Lightning Chart V6.4.1)
		internal string lightningLicenseKey = "Communications Research Centre Canada (CRC)/Developer1/LightningChartUltimate/G2RC2UYKP5Z78Y2293C3RW8JAY2TA43G294V";

		// Define the range of the chart
		double xRangeMin, xRangeMax, yRangeMin, yRangeMax;

		public arctionChart(int XRangeMin, int XRangeMax, int YRangeMin, int YRangeMax)
		{
			// Initialie the components of the UserControl object
			InitializeComponent();

			// Initialize the grid series properties
			xRangeMin = XRangeMin;
			xRangeMax = XRangeMax;
			yRangeMin = YRangeMin;
			yRangeMax = YRangeMax;
			CreateChart(xRangeMin, xRangeMax, yRangeMin, yRangeMax);
		}

		/// <summary>
		/// Configures the attributes of the chart axes
		/// </summary>
		public void CreateChart(double XRangeMin, double XRangeMax, double YRangeMin, double YRangeMax)
		{
			// Validate the license of the Lightning chart
			_chart = this.lightningChart;
			_chart.LicenseKey = lightningLicenseKey;

			_chart.BeginUpdate();

			// Configure the chart handle
			_chart.Title.Text = "Dynamic heatmap";
			_chart.ActiveView = ActiveView.ViewXY;

			_chart.ViewXY.ZoomPanOptions.LeftMouseButtonAction = MouseButtonAction.Zoom;
			_chart.ViewXY.ZoomPanOptions.RightMouseButtonAction = MouseButtonAction.Pan; 
			_chart.ViewXY.LegendBox.Visible = false;

			// Configure the chart axis
			_chart.ViewXY.XAxes[0].Title.Text = "Azimuth (deg)";	// Set X label
			_chart.ViewXY.XAxes[0].ValueType = AxisValueType.Number;
			_chart.ViewXY.XAxes[0].SetRange(XRangeMin, XRangeMax);	// Set X Range of chart
			_chart.ViewXY.XAxes[0].AutoDivSpacing = false;
			_chart.ViewXY.XAxes[0].MajorDiv = 20;					// Set X division width
			_chart.ViewXY.XAxes[0].KeepDivCountOnRangeChange = true;
			_chart.ViewXY.YAxes[0].Title.Text = "Elevation (deg)";	// Set Y label
			_chart.ViewXY.YAxes[0].ValueType = AxisValueType.Number;
			_chart.ViewXY.YAxes[0].SetRange(YRangeMin, YRangeMax);	// Set Y Range of chart
			_chart.ViewXY.YAxes[0].AutoDivSpacing = true;
			_chart.ViewXY.YAxes[0].MajorDiv = 30;					// Set Y division width
			_chart.ViewXY.YAxes[0].KeepDivCountOnRangeChange = true;


			// Configure the background intensity handle
			imageGrid = new IntensityGridSeries(_chart.ViewXY, _chart.ViewXY.XAxes[0], _chart.ViewXY.YAxes[0]);
			imageGrid.SetRangesXY(XRangeMin, XRangeMax, YRangeMin, YRangeMax); //Configure the view port of the image
			imageGrid.Fill = IntensityFillStyle.FromSurfacePoints;
			imageGrid.Optimization = IntensitySeriesOptimization.DynamicData;
			imageGrid.PixelRendering = true;
			imageGrid.MouseInteraction = true;
			imageGrid.Visible = true;
			imageGrid.ShowInLegendBox = false;

			// Configure the heatmap wire intensity handle
			wireGrid = new IntensityGridSeries(_chart.ViewXY, _chart.ViewXY.XAxes[0], _chart.ViewXY.YAxes[0]);
			wireGrid.Optimization = IntensitySeriesOptimization.DynamicData;
			wireGrid.LegendBoxUnits = "dB";
			wireGrid.LegendBoxValuesFormat = "0";
			wireGrid.ShowInLegendBox = true;
			wireGrid.Title.Text = "Power";
			wireGrid.MouseInteraction = false;  // Todo: Play with this parameter for hover feature
			wireGrid.Fill = IntensityFillStyle.Paletted;

			// The width of each rectangle/pixel is automatically configured by the dimensions of the double[][] colors
			wireGrid.SetRangesXY(-30, 30, -30, 30); // Configure the view port of the heatmap
			
			// Render data as pixel rectangles
			wireGrid.PixelRendering = true;
			wireGrid.WireframeType = SurfaceWireframeType.Wireframe;
			wireGrid.WireframeLineStyle.Color = Color.FromArgb(100, Color.Gray);
			wireGrid.Visible = true;

			// Creating a color heatmap palette
			ValueRangePalette p = new ValueRangePalette();
			int colorAlpha = 60;
			double stepValue = -100;
			p.MinValue = stepValue;
			p.Type = PaletteType.Gradient;

			// Attempting to configure the same jet color scale
			p.Steps.Clear();
			p.Steps.Add(new PaletteStep(p, Color.FromArgb(colorAlpha, Color.Blue), -100));
			p.Steps.Add(new PaletteStep(p, Color.FromArgb(colorAlpha, Color.Aqua), -69 ));
			p.Steps.Add(new PaletteStep(p, Color.FromArgb(colorAlpha, Color.Yellow), -44));
			p.Steps.Add(new PaletteStep(p, Color.FromArgb(colorAlpha, Color.Red), -19 ));
			p.Steps.Add(new PaletteStep(p, Color.FromArgb(colorAlpha, Color.Brown), -6 ));
			wireGrid.ValueRangePalette = p;


			// Add the grid object to the chart
			_chart.ViewXY.IntensityGridSeries.Add(imageGrid);
			_chart.ViewXY.IntensityGridSeries.Add(wireGrid);
			
			_chart.EndUpdate();
		}
		
		/// <summary>
		/// Updating the background image with a bitmap object
		/// </summary>
		/// <param name="bitmap"></param>
		public void updateBackground(Bitmap bitmap)
		{
			BitmapAntialiasOptions options = new BitmapAntialiasOptions() { ResolutionDivider = 2 };
			imageGrid.SetHeightDataFromBitmap(xRangeMin, xRangeMax, yRangeMin, yRangeMax, 0, 100, bitmap, options);
			//imageGrid.InvalidateData();
		}

		/// <summary>
		/// Updating the background image with an int[][] pixel array
		/// </summary>
		/// <param name="colors"></param>
		public void updateBackground(int[][] colors)
		{
			Task.Run( () =>
			{
				imageGrid.SetColorsData(colors, IntensityGridValuesDataOrder.ColumnsRows);
				imageGrid.InvalidateData();
			});
		}

		/// <summary>
		/// Updating the heatmap with a double[][] array
		/// </summary>
		/// <param name="colors"></param>
		public void updateHeatmap(double[][] colors)
		{
			Task.Run(() =>
			{
				wireGrid.SetValuesData(colors, IntensityGridValuesDataOrder.ColumnsRows);
				wireGrid.InvalidateData();
			});

		}
	}
}
