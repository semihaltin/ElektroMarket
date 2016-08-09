using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace E_Ticaret_2.Models
{
    public class Toplam : System.Web.UI.Page
    {
        public int ToplamAdetbul()
        {
            int ToplamAdet = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow item in dt.Rows)
            {
                ToplamAdet += Convert.ToInt32(item["adet"]);
            }
            return ToplamAdet;
        }

    
        public decimal ToplamTutarBul()
        {
            decimal ToplamTutar = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamTutar += Convert.ToDecimal(dr["tutar"]);
            }
            return ToplamTutar;
        }

    }
  
}