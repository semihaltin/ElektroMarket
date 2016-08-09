using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2
{
    public partial class Details : System.Web.UI.Page
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        Models.Sepet spt = new Models.Sepet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int urunid = Convert.ToInt32(Request.QueryString["urunid"]);
                var sonuc = (from o in ent.Resimler
                             where o.UrunID == urunid
                             select new { o.Urunresimyolu1,o.Urunresimyolu2, o.Urunresimyolu3,o.Urunresimyolu4,o.Urunler.UrunBilgisi,o.Urunler.UrunAd,o.Urunler.UrunFiyat}).FirstOrDefault();


                lblurundbilgisi.Text = sonuc.UrunBilgisi;
                lblmarka.Text = sonuc.UrunAd;
                lblfiyat.Text = sonuc.UrunFiyat.ToString();

                imgilk.ImageUrl = sonuc.Urunresimyolu1.ToString();
                imgbir.ImageUrl = sonuc.Urunresimyolu2.ToString();
                imgiki.ImageUrl = sonuc.Urunresimyolu3.ToString();
                imguc.ImageUrl = sonuc.Urunresimyolu4.ToString();
                lblilk.Text = "<a href='" + sonuc.Urunresimyolu2.ToString() + "' title='resimyolu1'" + ">";
                lblbir.Text = "<a href='"+sonuc.Urunresimyolu2.ToString()+"' title='resimyolu2'"+">";
                lbliki.Text = "<a href='" + sonuc.Urunresimyolu3.ToString() + "' title='resimyolu3'" + ">";
                lbluc.Text = "<a href='" + sonuc.Urunresimyolu4.ToString() + "' title='resimyolu4'" + ">";

            }
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["urunid"]);
            
            if (Session["sepet"] == null)
            {
                Session["sepet"] = spt.YeniSepet();
            }
            DataTable dt = (DataTable)Session["sepet"];

            bool varmi = false;
            foreach (DataRow item in dt.Rows)
            {
                if (Convert.ToInt32(item["urunID"]) == id)
                {


                    item["adet"] = Convert.ToInt32(item["adet"]) + 1;
                    item["tutar"] = Convert.ToInt32(item["tutar"]) + Convert.ToDecimal(lblfiyat.Text);
                    varmi = true;

                }
            }
            if (varmi == false)
            {
                DataRow dr;
                dr = dt.NewRow();
                dr["urunID"] = id;
                dr["urunAd"] = lblmarka.Text;
                dr["adet"] = 1;
                dr["fiyat"] = Convert.ToDecimal(lblfiyat.Text);
                dr["tutar"] = Convert.ToDecimal(lblfiyat.Text);
                dr["urunresim"] = imgilk.ImageUrl;
                dt.Rows.Add(dr);

            }
            Session["sepet"] = dt;
            Response.Redirect("sepet.aspx");
        }
    }
}