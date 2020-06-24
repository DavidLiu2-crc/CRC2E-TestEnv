using System;
using System.Numerics;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using csmatio.io;
using csmatio.types;
using csmatio.common;

using MathNet.Numerics;
using MathNet.Numerics.LinearAlgebra;
using MathNet.Numerics.LinearAlgebra.Complex;
using MathNet.Numerics.LinearAlgebra.Double;
using MathNet.Numerics.IntegralTransforms;


namespace ControlGUI
{
	public static class MathExtensions
	{
		public static double DegToRad(double val)
		{
			return (Math.PI / 180.0) * val;
		}

		public static double RadToDeg(double val)
		{
			return (180.0 / Math.PI) * val;
		}

		public static double PowerToDecibels(double val)
		{
			return 10.0 * Math.Log10(val);
		}

		public static void Swap(ref double val1, ref double val2)
		{
			double tmp = val1;
			val1 = val2;
			val2 = tmp;
		}

		public static double AbsSq(Complex val)
		{
			return val.Real * val.Real + val.Imaginary * val.Imaginary;
		}

		public static double PowerSum(Complex[] data)
		{
			// Compute the power sum.
			double sum = 0.0;
			for (int i = 0; i < data.Length; i++)
				sum += AbsSq(data[i]);

			// Return the result.
			return sum;
		}

		public static double PowerSum(Complex[,] data)
		{
			// Compute the power sum.
			double sum = 0.0;
			for (int p = 0; p < data.GetLength(0); p++)
				for (int q = 0; q < data.GetLength(1); q++)
					sum += AbsSq(data[p, q]);

			// Return the result.
			return sum;
		}

		public static double PowerSum(Complex[,][] data)
		{
			// Compute the power sum.
			double sum = 0.0;
			for (int p = 0; p < data.GetLength(0); p++)
				for (int q = 0; q < data.GetLength(1); q++)
					sum += MathExtensions.PowerSum(data[p, q]);

			// Return the result.
			return sum;
		}

		public static double PowerSum(Complex[][,][] data)
		{
			// Compute the power sum.
			double sum = 0.0;
			for (int n = 0; n < data.Length; n++)
				sum += MathExtensions.PowerSum(data[n]);

			// Return the result.
			return sum;
		}

		public static int IndexOfAbsMaximum(double[] data)
		{
			double max = 0.0;
			int index = -1;
			for (int n = 0; n < data.Length; n++)
			{
				double tmp = MathExtensions.AbsSq(data[n]);
				if (tmp > max)
				{
					max = tmp;
					index = n;
				}
			}
			return index;
		}

		public static void InverseFourierTransform(Complex[] data)
		{
			// Perform windowing and inverse DFT.
			double[] w = Window.Blackman(data.Length);
			for (int n = 0; n < w.Length; n++)
				data[n] *= w[n];
			Fourier.Inverse(data, FourierOptions.Default);
		}

		// This function returns the vector norm.
		public static double Norm(Vector3 v)
		{
			return Math.Sqrt(v.X * v.X + v.Y * v.Y + v.Z * v.Z);
		}

		// This function returns the dot product of two vectors.
		public static double Dot(Vector3 v1, Vector3 v2)
		{
			return v1.X * v2.X + v1.Y * v2.Y + v1.Z * v2.Z;
		}

		// This function returns the cross product of two vectors.
		public static Vector3 Cross(Vector3 v1, Vector3 v2)
		{
			return new Vector3(
				v1.Y * v2.Z - v1.Z * v2.Y,
				v1.Z * v2.X - v1.X * v2.Z,
				v1.X * v2.Y - v1.Y * v2.X);
		}
	}

	public class Vector3
	{
		private double _x, _y, _z;

		public Vector3(double x, double y, double z)
		{
			_x = x;
			_y = y;
			_z = z;
		}

		public double X
		{
			get { return _x; }
		}

		public double Y
		{
			get { return _y; }
		}

		public double Z
		{
			get { return _z; }
		}
	}
}