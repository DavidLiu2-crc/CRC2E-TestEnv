using System;
using System.Collections.Generic;
using System.Drawing.Text;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

using LadybugAPI;

namespace ControlGUI
{
    public class ContextHolder : IDisposable
    {
        private IntPtr ladybugContext = IntPtr.Zero;
        private IntPtr readerContext = IntPtr.Zero;
        private IntPtr writerContext = IntPtr.Zero;

        public ContextHolder()
        {

            LadybugError error;
            if (ladybugContext == IntPtr.Zero)
            {
                error = Ladybug.CreateContext(out ladybugContext);
            }

            if (readerContext == IntPtr.Zero)
            {
                error = Ladybug.CreateStreamContext(out readerContext);
            }

            if (writerContext == IntPtr.Zero)
            {
                error = Ladybug.CreateStreamContext(out writerContext);
            }

        }

        public void Dispose()
        {
            LadybugError error;
            if(readerContext != IntPtr.Zero)
            {
                error = Ladybug.DestroyContext(ref ladybugContext);
            }

            if (ladybugContext != IntPtr.Zero)
            {
                error = Ladybug.DestroyStreamContext(ref readerContext);
            }
            if (writerContext != IntPtr.Zero)
            {
                error = Ladybug.DestroyStreamContext(ref writerContext);
            }
        }

        public IntPtr GetLadybugContext() { return ladybugContext; }
        public IntPtr GetReaderContext() { return readerContext; }
        public IntPtr GetWriterContext() { return writerContext; }
    }
}
