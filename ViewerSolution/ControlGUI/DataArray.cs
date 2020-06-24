using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Numerics;

using csmatio.io;
using csmatio.types;
using csmatio.common;

using MathNet.Numerics.Random;
using MathNet.Numerics.LinearAlgebra;
using System.Globalization;
using System.Net.Http;

namespace ControlGUI
{
	public enum MapAxis 
	{ 
		Delay = 0, 
		TxAzimuth = 1, 
		TxElevation = 2, 
		RxAzimuth = 3, 
		RxElevation = 4
	}

	public class DataArray
	{
		// --- Define attributes
		protected double[] _t;  // Time values (indexed) from start of sweep
		protected List<DataElement> _dataArray; // Unordered list of DataElements
		protected DataElement[,,,] _dataIndex;	// Index of possible data elements

		// Assume _azt, _elt, _azr, _elr are monotonically increasing arrays
		protected double[] _azt, _elt;
		protected double[] _azr, _elr;

		protected int freq;

		/// <summary>
		/// Constructor from another DataArray
		/// </summary>
		/// <param name="data"></param>
		public DataArray(DataArray data)
		{
			//_t = data._t;

			_azt = data._azt;
			_elt = data._elt;
			_azr = data._azr;
			_elr = data._elr;

			_dataArray = data._dataArray;
			_dataIndex = data._dataIndex;
		}

		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="t"> Array of double representing time values since start of sweep</param>
		/// <param name="azt"></param>
		/// <param name="elt"></param>
		/// <param name="azr"></param>
		/// <param name="elr"></param>
		public DataArray(double[] t, double[] azt, double[] elt, double[] azr, double[] elr)
		{
			this.Init(t, azt, elt, azr, elr);
		}

		// Constructor from MATLAB file
		public DataArray(string matFileName)
		{
			MatFileReader mfr;

			// Try/Catch opening mat file at location
			try
			{
				mfr = new MatFileReader(matFileName);
			}
			catch
			{
				//System.Console.WriteLine(" [Error]: Could not read file: " + matFileName);
				Debug.WriteLine(" [Error]: Could not read file: " + matFileName);
				return;
			}

			//Read in the time points
			MLDouble mlc_t = mfr.Content["t"] as MLDouble;
			if (mlc_t == null) throw new MatlabIOException("Error importing .mat file. Variable f not found.");
			double[] t = new double[mlc_t.Size];
			mlc_t.GetArray()[0].CopyTo(t, 0);

			// Read in the Tx azimuth values.
			MLDouble mld_azt = mfr.Content["azt"] as MLDouble;
			if (mld_azt == null) throw new MatlabIOException("Error importing .mat file. Variable azt not found.");
			double[] azt = new double[mld_azt.Size];
			mld_azt.GetArray()[0].CopyTo(azt, 0);

			// Read in the Tx elevation values.
			MLDouble mld_elt = mfr.Content["elt"] as MLDouble;
			if (mld_elt == null) throw new MatlabIOException("Error importing .mat file. Variable elt not found.");
			double[] elt = new double[mld_elt.Size];
			mld_elt.GetArray()[0].CopyTo(elt, 0);

			// Read in the Rx azimuth values.
			MLDouble mld_azr = mfr.Content["azr"] as MLDouble;
			if (mld_azr == null) throw new MatlabIOException("Error importing .mat file. Variable azt not found.");
			double[] azr = new double[mld_azr.Size];
			mld_azr.GetArray()[0].CopyTo(azr, 0);

			// Read in the Rx elevation values.
			MLDouble mld_elr = mfr.Content["elr"] as MLDouble;
			if (mld_elr == null) throw new MatlabIOException("Error importing .mat file. Variable elt not found.");
			double[] elr = new double[mld_elr.Size];
			mld_elr.GetArray()[0].CopyTo(elr, 0);

			// Initialize the data array.
			this.Init(t, azt, elt, azr, elr);

			// Read in the data elements.
			MLCell mlc_elements = mfr.Content["elements"] as MLCell;
			if (mlc_elements == null) throw new MatlabIOException("Error importing .mat file. Variable elements not found.");
			for (int i = 0; i < mlc_elements.Size; i++)
			{
				MLStructure mls_element = mlc_elements.Cells[i] as MLStructure;
				int aztidx = Convert.ToInt32((mls_element["azt_index"] as MLDouble).Get(0));
				int eltidx = Convert.ToInt32((mls_element["elt_index"] as MLDouble).Get(0));
				int azridx = Convert.ToInt32((mls_element["azr_index"] as MLDouble).Get(0));
				int elridx = Convert.ToInt32((mls_element["elr_index"] as MLDouble).Get(0));
				
				// Correct the indices. From Matlab indices to C#
				aztidx = (aztidx > 0 ? aztidx - 1 : -1);
				eltidx = (eltidx > 0 ? eltidx - 1 : -1);
				azridx = (azridx > 0 ? azridx - 1 : -1);
				elridx = (elridx > 0 ? elridx - 1 : -1);
				
				// Create a new data element.
				DataElement dataElement = this.CreateDataElement(i, aztidx, eltidx, azridx, elridx);
				MLDouble mld_iqdata = mls_element["iqdata"] as MLDouble;
				
				ByteBuffer realBuffer = mld_iqdata.GetReal();
				ByteBuffer imagBuffer = mld_iqdata.GetImaginary();

				Complex[] iqdata = new Complex[mld_iqdata.Size];

				for (int j = 0; j < mld_iqdata.Size; j++)
				{
					double real = realBuffer.GetDouble(j * sizeof(double));
					double imag = imagBuffer.GetDouble(j * sizeof(double));

					iqdata[j] = new Complex(real, imag);
				}

				dataElement.SetData(iqdata);

			}

		}

		// Save the dataArray into .mat file
		public void Save(string matFileName)
		{
			// Create list of variables
			List<MLArray> variable = new List<MLArray>();

			// csmatio add variable usage
			// 1. Define ml data type place holder
			// 2. Copy the c# data onto place holder
			// 3. Add the placeholder to variable list

			// Write the time points into variable t
			//MLCell mlc_t = new MLCell("t", new int[] { 1, _t.Length });
			//for (int i = 0; i < _t.Length; i++)
			//{
			//	mlc_t.Cells[i] = new MLDouble("", _t, 1);
			//}
			//variable.Add(mlc_t);
			variable.Add(new MLDouble("t", _t, 1));

			// Write the Tx azimuth angles.
			variable.Add(new MLDouble("azt", _azt, 1 ));

			// Write the Tx elevation angles.
			variable.Add(new MLDouble("elt", _elt, 1));

			// Write the Rx azimuth angles.
			variable.Add(new MLDouble("azr", _azr, 1));

			// Write the Rx elevation angles.
			variable.Add(new MLDouble("elr", _elr, 1));

            // Create the data struct.
			//MLStructure mls_data = new MLStructure("data", new int[] { 1, 1 });
			//variable.Add(mls_data);

			// Write the data elements
			MLCell mlc_elements = new MLCell("elements", new int[] { 1, _dataArray.Count });
			//mls_data["elements"] = mlc_elements;
			variable.Add(mlc_elements);

			// Write each data element into data structure
			for (int i = 0; i < _dataArray.Count; i++)
			{
				MLStructure mls_element = new MLStructure("element", new int[] { 1, 1 });
				mlc_elements.Cells[i] = mls_element;

				int aztidx = _dataArray[i].TxAzimuthIndex;
				int eltidx = _dataArray[i].TxElevationIndex;
				int azridx = _dataArray[i].RxAzimuthIndex;
				int elridx = _dataArray[i].RxElevationIndex;

				// Correct the index returned
				aztidx = aztidx >= 0 ? aztidx + 1 : -1;
				eltidx = eltidx >= 0 ? eltidx + 1 : -1;
				azridx = azridx >= 0 ? azridx + 1 : -1;
				elridx = elridx >= 0 ? elridx + 1 : -1;

				// Write the azimuth/elevation indices
				mls_element["azt_index"] = new MLDouble("", new double[] { aztidx }, 1);
				mls_element["elt_index"] = new MLDouble("", new double[] { eltidx }, 1);
				mls_element["azr_index"] = new MLDouble("", new double[] { azridx }, 1);
				mls_element["elr_index"] = new MLDouble("", new double[] { elridx }, 1);

				// Create the frequency bands cell array
				//MLCell mlc_bands = new MLCell("", new int[] { 1, _t.Length });
				//mls_element["bands"] = mlc_bands;

				//MLStructure mls_values = new MLStructure("", new int[] { 1, 1 });
					
				// Get the complex data
				Complex[] data = _dataArray[i].GetData();

				if (data != null && data.Length > 0)
				{
					double[] real = new double[data.Length];
					double[] imag = new double[data.Length];
					for (int l = 0; l < data.Length; l++)
					{
						real[l] = data[l].Real;
						imag[l] = data[l].Imaginary;
					}

					mls_element["iqdata"] = new MLDouble("", real, imag, 1);
				}

				else
				{
					mls_element["iqdata"] = new MLDouble("", new int[] { 0, 0 });
				}

			}

			// Try/catch writing MAT file
			try
			{
				var mfr = new MatFileWriter(matFileName, variable, false);
			}
			catch
			{
				//System.Console.WriteLine(" [Error]: Could not write file: " + matFileName);
				Debug.WriteLine(" [Error]: Could not write file: " + matFileName);
				return;
			}

		}

		private void Init(double[] t, double[] azt, double[] elt, double[] azr, double[] elr)
		{
			_t = t;

			_azt = azt;
			_elt = elt;
			_azr = azr;
			_elr = elr;

			_dataArray = new List<DataElement>();

			// Assume double[][] t is sorted by elr, azr, elt, then finally azt
			_dataIndex = new DataElement[_azt.Length , _elt.Length , _azr.Length , _elr.Length ];
		}

		public DataElement GetDataElement(int tidx)
		{
			return _dataArray[tidx];
		}

		private DataElement CreateDataElement(int tidx, int aztidx, int eltidx, int azridx, int elridx)
		{
			// Try to find the data element located in 
			DataElement de = _dataIndex[
				aztidx >= 0 ? aztidx : _azt.Length,
				eltidx >= 0 ? eltidx : _elt.Length,
				azridx >= 0 ? azridx : _azr.Length,
				elridx >= 0 ? elridx : _elr.Length];

			// If data element has not been measured, create a new data element
			if (de == null)
			{
				de = new DataElement(_t, aztidx, eltidx, azridx, elridx);
				_dataArray.Add(de);
				_dataIndex[
					aztidx >= 0 ? aztidx : _azt.Length,
					eltidx >= 0 ? eltidx : _elt.Length,
					azridx >= 0 ? azridx : _azr.Length,
					elridx >= 0 ? elridx : _elr.Length] = de;
			}

			return de;
		}

		public void SetData(int tidx, int aztidx, int eltidx, int azridx, int elridx, Complex[] data)
		{
			// Find the data element fidx
			DataElement dataElement = this.CreateDataElement(tidx, aztidx, eltidx, azridx, elridx);

			dataElement.SetData(data);
		}

		public Complex[] GetData(int fidx, int aztidx, int eltidx, int azridx, int elridx)
		{
			DataElement de = _dataIndex[
				aztidx >= 0 ? aztidx : _azt.Length,
				eltidx >= 0 ? eltidx : _elt.Length,
				azridx >= 0 ? azridx : _azr.Length,
				elridx >= 0 ? elridx : _elr.Length];

			if (de == null) return null;

			Complex[] srcData = de.GetData();
			Complex[] destData = new Complex[srcData.Length];
			Array.Copy(srcData, destData, srcData.Length);

			return destData;
		}

		public double GetPower()
		{
			double sum = 0.0;

			for (int i = 0; i < _dataArray.Count; i++)
			{
				sum += _dataArray[i].GetPower();
			}

			return sum;
		}

		

		public DataElement FindDataElement(double azt, double elt, double azr, double elr)
		{
			// Try to find the exact index of azt in _azt
			int i, j, k, l;
			i = findIndex(azt, _azt);
			j = findIndex(elt, _elt);
			k = findIndex(azr, _azr);
			l = findIndex(elr, _elr);

			if (i >= 0 && j >= 0 && k >= 0 && l >= 0)
			{
				return _dataIndex[i, j, k, l];
			}
			else
			{
				return null;
			}
		}

		public int findIndex(double value, double[] array)
		{
			int i = -1; // Start as negative value in case value can't be found

			for (int j = 0; j < array.Length; j++)
			{
				if (array[j] == value)
				{
					i = j;
				}
			}
			return i;
		}

		
		// Define get function for time points t
		public int GetNumberOfTimePoints()
		{
			return _t.Length;
		}

		public double[] GetTimePoints()
		{
			return _t;
		}

		public double GetTimeSpacing()
		{
			return _t.Length > 1 ? _t[1] - _t[0] : 0;
		}

		// Define get functions for Az/El with corresponding Tx/Rx
		public int NumberOfTxAzimuths
		{
			get { return _azt.Length; }
		}

		public double[] TxAzimuths
		{
			get { return _azt; }
		}

		public double TxAzimuthSpacing
		{
			get { return _azt.Length > 1 ? _azt[1] - _azt[0] : 0; }
		}

		public int NumberOfRxAzimuths
		{
			get { return _azr.Length; }
		}

		public double[] RxAzimuths
		{
			get { return _azr; }
		}

		public double RxAzimuthSpacing
		{
			get { return _azr.Length > 1 ? _azr[1] - _azr[0] : 0; }
		}

		public int NumberOfTxElevations
		{
			get { return _elt.Length; }
		}

		public double[] TxElevations
		{
			get { return _elt; }
		}

		public double TxElevationSpacing
		{
			get { return _elt.Length > 1 ? _elt[1] - _elt[0] : 0; }
		}

		public int NumberOfRxElevations
		{
			get { return _elr.Length; }
		}

		public double[] RxElevations
		{
			get { return _elr; }
		}

		public double RxElevationSpacing
		{
			get { return _elr.Length > 1 ? _elr[1] - _elr[0] : 0; }
		}


		public int NumberOfDataElements
		{
			get { return _dataArray.Count; }
		}

		public int NumberOfDataIndexes
		{
			get { return _dataIndex.Length; }
		}

		public int GetLength(MapAxis axis)
		{
			switch (axis)
			{
				// TODO: Placeholder to compute Delay from time data
				case MapAxis.Delay: return _t.Length;
				case MapAxis.TxAzimuth: return _azt.Length;
				case MapAxis.TxElevation: return _elt.Length;
				case MapAxis.RxAzimuth: return _azr.Length;
				case MapAxis.RxElevation: return _elr.Length;
				default: return 0;
			}
		}

		public double[,] GetMap(MapAxis axis1, MapAxis axis2)
		{
			int sz1 = this.GetLength(axis1);
			int sz2 = this.GetLength(axis2);

			double[,] map = new double[sz1, sz2];

			int[] ix = new int[5];

			for (int n = 0; n < _dataArray.Count; ++n)
			{
				ix[1] = _dataArray[n].TxAzimuthIndex;
				ix[2] = _dataArray[n].TxElevationIndex;
				ix[3] = _dataArray[n].RxAzimuthIndex;
				ix[4] = _dataArray[n].RxElevationIndex;

				Complex[] data = _dataArray[n].GetData();
				if (data != null)
				{
					// Inverse Fourier Transform
					//MathExtensions.InverseFourierTransform(data);

					for (ix[0] = 0; ix[0] < _t.Length; ++ix[0])
					{
						int nx = ix[(int)axis1];
						int ny = ix[(int)axis2];

						if (nx >= 0 && ny >= 0)
						{
							//map[nx, ny] += _dataArray[n].GetPower();
							map[nx,ny] += Math.Pow(Complex.Abs( _dataArray[n].GetData()[0] ), 2);
						}
					}
				}
			}

			return map;
		}

		public void GetMap(out double[][] mapArray, MapAxis axis1, MapAxis axis2)
		{
			// Grab the 2D heat map
			double[,] map = GetMap(axis1, axis2);

			// Convert to array of array and return it
			mapArray = RandomFuncs.ConvertFrom(map);
		}

	}

	public class DataElement
	{
		private Complex[] _data;	// Frequency, IQ data

		private int _tsz;			// length of time points
		private int _aztidx, _eltidx;
		private int _azridx, _elridx;

		// Constructor
		public DataElement(double[] t, int aztidx, int eltidx, int azridx, int elridx)
		{
			// Assume that the double array t is IQ pairs
			_data = convertFromDouble(t);
			_tsz = _data.Length;

			_aztidx = aztidx;
			_eltidx = eltidx;
			_azridx = azridx;
			_elridx = elridx;
		}

		// Define attribute getter functions
		public int TxAzimuthIndex
		{
			get { return _aztidx; }
		}

		public int TxElevationIndex
		{
			get { return _eltidx; }
		}

		public int RxAzimuthIndex
		{
			get { return _azridx; }
		}

		public int RxElevationIndex
		{
			get { return _elridx; }
		}

		public int numberOfTimePoints
		{
			get { return _tsz; }
		}

		public bool isDoubleDirectional
		{
			get { return _aztidx >= 0 && _eltidx >= 0 && _azridx >= 0 && _elridx >= 0; }
		}

		public bool isSingleDirectionalAtTx
		{
			get { return _aztidx >= 0 && _eltidx >= 0 && _azridx < 0 && _elridx < 0; }
		}

		public bool isSingleDirectionalAtRx
		{
			get { return _aztidx < 0 && _eltidx < 0 && _azridx >= 0 && _elridx >= 0; }
		}

		// Define set data functions
		public void SetData(Complex[] data)
		{
			// Create complex array pointer and initialize
			//Complex[] target = _data[tidx] = new Complex[_tsz[tidx]];
			Complex[] target = _data = new Complex[data.Length];
			data.CopyTo(target, 0);
		}

		// Define overloaded get complex data function
		public Complex[] GetData()
		{
			Complex[] source = _data;

			// Check if data has been captured at this frequency fidx
			if (source == null) return null;

			// Clone the values and return the new complex array
			Complex[] data = new Complex[source.Length];
			source.CopyTo(data, 0);

			return data;
		}

		//public Complex[][] GetData()
		//{
		//	Complex[][] source = _data;

		//	if (source == null) return null;

		//	Complex[][] data = new Complex[source.Length][];
		//	source.CopyTo(data, 0);

		//	return data;
		//}

		// Define overloaded get complex power function

		public double GetPower()
		{
			Complex[] source = _data;
			if (source == null) return 0;

			return MathExtensions.PowerSum(source);
		}

		//public double GetPower()
		//{
		//	Complex[][] source = _data;

		//	double sum = 0.0;
		//	for(int i = 0; i < source.Length; i++)
		//	{
		//		sum += this.GetPower(i);
		//	}

		//	return sum;
		//}

		public static Complex[] convertFromDouble(double[] iqdata)
		{
			if (iqdata.Length < 2)
			{
				return null;
			}

			Complex[] data = new Complex[iqdata.Length / 2];
			for (int i = 0; i < data.Length; i++)
			{
				data[i] = new Complex(iqdata[2 * i], iqdata[2 * i + 1]);
			}
			return data;
		}
	}

	public class RandomFuncs
	{
		protected static Random random = new Random();

		// Generates a double array of size sz1 with values between 0.0 to 1.0
		public static double[] generateRandomDouble(uint sz1)
		{
			double[] randomData = new double[sz1];
			random.NextDoubles(randomData);

			return randomData;
		}

		// Generates a double matrix of size sz1 x sz2 with values between 0.0 to 1.0
		public static double[][] generateRandomDouble(double randMax, uint sz1, uint sz2)
		{
			double[][] randomData = new double[sz1][];
			for (int i = 0; i < randomData.Length; i++)
			{
				randomData[i] = new double[sz2];
				random.NextDoubles(randomData[i]);

				for (int j = 0; j < randomData[i].Length; j++)
				{
					randomData[i][j] *= randMax;
				}
			}

			return randomData;
		}

		// Generates a double complex array of size sz1
		public static Complex[] generateRandomComplex(uint sz1)
		{
			Complex[] randomData = new Complex[sz1];

			double[] real = generateRandomDouble(sz1);
			double[] imag = generateRandomDouble(sz1);

			for (int k = 0; k < sz1; k++)
			{
				Complex value = new Complex(real[k], imag[k]);
				randomData[k] = value / Math.Sqrt( MathExtensions.AbsSq(value) );
			}

			return randomData;
		}

		// Generates an array defined between _start and _end with step size _dx
		public static double[] generateArange(double _start, double _end, double _dx)
		{
			int numPoints = (int) ((_end - _start) / _dx) + 1;
			double[] values = new double[numPoints];

			for (int i = 0; i < numPoints; i++)
			{
				values[i] = _start + i * _dx;
			}

			return values;
		}

		// Convert from 2D array to array of arrays
		public static double[][] ConvertFrom(double[,] dataArray)
		{
			int sz1 = dataArray.GetLength(0);
			int sz2 = dataArray.GetLength(1);

			// Initialize an array of arrays
			double[][] target = new double[sz1][];
			for (int i = 0; i < sz1; i++)
			{
				target[i] = new double[sz2];
			}

			// Find in the elements from dataArray to target
			for (int i = 0; i < sz1; i++)
			{
				for (int j = 0; j < sz2; j++)
				{
					target[i][j] = dataArray[i, j];
				}
			}

			return target;
		}

		public static double[,] ConvertFrom(double[][] dataArray)
		{
			// Assumes dataArray contains well defined consistant rows of arrays
			int sz1 = dataArray.Length;
			int sz2 = dataArray[0].Length;

			// Initialize the 2D double matrix
			double[,] target = new double[sz1, sz2];

			// Fill in the elements of the 2D matrix
			for (int i = 0; i < sz1; i++)
			{
				for (int j = 0; j < sz2; j++)
				{
					target[i, j] = dataArray[i][j];
				}
			}


			return target;
		}
	}
}
