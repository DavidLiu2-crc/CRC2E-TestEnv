using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AnokiwaveControllerGUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        [DllImport("AnokiwaveControllerLibrary", EntryPoint = "CMD_LoadPointingAngles", CallingConvention = CallingConvention.Cdecl)]
        public static extern bool CMD_LoadPointingAngles(String csvfilename);

        [DllImport("AnokiwaveControllerLibrary", EntryPoint = "CMD_GetCommandBitSequence", CallingConvention = CallingConvention.Cdecl)]
        public static extern void CMD_getCommandBitSequence(out IntPtr intptr, out ulong len);

        public void InitializeDLL()
        {
            
        }
    }
}
