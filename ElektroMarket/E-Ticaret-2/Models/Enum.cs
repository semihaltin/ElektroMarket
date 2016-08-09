using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Ticaret_2.Models
{
    public class Enum
    {
        public enum Satisdurumu:byte
        {
            siparis=1,
            odemeonay = 2,
            hazirlama = 3,
            kargo = 4,
            teslim = 5
        }
    }
}