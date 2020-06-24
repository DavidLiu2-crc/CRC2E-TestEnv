namespace ControlGUI
{
    partial class arctionChart
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(arctionChart));
            this.lightningChart = new Arction.LightningChartUltimate.LightningChartUltimate();
            this.SuspendLayout();
            // 
            // lightningChart
            // 
            this.lightningChart.BackColor = System.Drawing.Color.Gray;
            this.lightningChart.Background = ((Arction.LightningChartUltimate.Fill)(resources.GetObject("lightningChart.Background")));
            this.lightningChart.ChartManager = null;
            this.lightningChart.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lightningChart.LicenseKey = "(From local registry)";
            this.lightningChart.Location = new System.Drawing.Point(0, 0);
            this.lightningChart.MinimumSize = new System.Drawing.Size(600, 350);
            this.lightningChart.Name = "lightningChart";
            this.lightningChart.RenderOptions = ((Arction.LightningChartUltimate.Views.RenderOptionsCommon)(resources.GetObject("lightningChart.RenderOptions")));
            this.lightningChart.ScrollBars = ((System.Collections.Generic.List<Arction.LightningChartUltimate.ScrollBar>)(resources.GetObject("lightningChart.ScrollBars")));
            this.lightningChart.Size = new System.Drawing.Size(600, 350);
            this.lightningChart.TabIndex = 0;
            this.lightningChart.Title = ((Arction.LightningChartUltimate.Titles.ChartTitle)(resources.GetObject("lightningChart.Title")));
            this.lightningChart.View3D = ((Arction.LightningChartUltimate.Views.View3D.View3D)(resources.GetObject("lightningChart.View3D")));
            this.lightningChart.ViewPie3D = ((Arction.LightningChartUltimate.Views.ViewPie3D.ViewPie3D)(resources.GetObject("lightningChart.ViewPie3D")));
            this.lightningChart.ViewPolar = ((Arction.LightningChartUltimate.Views.ViewPolar.ViewPolar)(resources.GetObject("lightningChart.ViewPolar")));
            this.lightningChart.ViewXY = ((Arction.LightningChartUltimate.Views.ViewXY.ViewXY)(resources.GetObject("lightningChart.ViewXY")));
            // 
            // arctionChart
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.lightningChart);
            this.MinimumSize = new System.Drawing.Size(600, 350);
            this.Name = "arctionChart";
            this.Size = new System.Drawing.Size(600, 350);
            this.ResumeLayout(false);

        }

        #endregion

        private Arction.LightningChartUltimate.LightningChartUltimate lightningChart;
    }
}
