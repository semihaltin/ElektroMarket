using E_Ticaret_2.DataModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2
{
    public partial class Products : System.Web.UI.Page
    {
        EticaretEntities ent = new EticaretEntities();
        Models.Sepet spt = new Models.Sepet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int kno = Convert.ToInt32(Request.QueryString["kno"]);
                int akno = Convert.ToInt32(Request.QueryString["akno"]);
                if (akno == 0)
                {
                    var Resims = (from resim in ent.Resimler
                                  where resim.Silindi == false && resim.Urunler.UrunKategoriNo == kno
                                  select new { resim.Urunler.UrunAd, resim.Urunresimyolu1, resim.UrunID, resim.ID, resim.Urunler.UrunFiyat,resim.Urunler.Miktar}).ToList();
                    dlisturunler.DataSource = Resims;
                    dlisturunler.DataBind();
                }
                else
                {
                    var Resims = (from resim in ent.Resimler
                                  where resim.Silindi == false && resim.Urunler.UrunKategoriNo == kno && resim.Urunler.UrunAltKategoriNo == akno
                                  select new { resim.Urunler.UrunAd, resim.Urunresimyolu1, resim.UrunID, resim.ID, resim.Urunler.UrunFiyat,resim.Urunler.Miktar }).ToList();
                    dlisturunler.DataSource = Resims;
                    dlisturunler.DataBind();
                }

            }



        }



        protected void dlisturunler_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName == "detay")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Details.aspx?urunid=" + id);
            }
            else if (e.CommandName == "sepet")
            {
                if (Session["sepet"] == null)
                {
                    Session["sepet"] = spt.YeniSepet();
                }
                DataTable dt = (DataTable)Session["sepet"];
                int id = Convert.ToInt32(e.CommandArgument);
                Label urunAd = (Label)e.Item.FindControl("lblUrunAd");
                Label urunfiyat = (Label)e.Item.FindControl("lblUrunFiyat");
                TextBox miktar = (TextBox)e.Item.FindControl("txtAdet");
                ImageButton resim = (ImageButton)e.Item.FindControl("imgResim");
                bool varmi = false;
                foreach (DataRow item in dt.Rows)
                {
                    if (Convert.ToInt32(item["urunID"]) == id)
                    {
                        varmi = true;
                        item["adet"] = Convert.ToInt32(item["adet"]) + Convert.ToInt32(miktar.Text);
                        item["tutar"] = Convert.ToInt32(item["tutar"]) + Convert.ToInt32(miktar.Text) * Convert.ToDecimal(urunfiyat.Text);
                    }
                }
                if (varmi == false)
                {
                    DataRow dr;
                    dr = dt.NewRow();
                    dr["urunID"] = id;
                    dr["urunAd"] = urunAd.Text;
                    dr["adet"] = Convert.ToInt32(miktar.Text);
                    dr["fiyat"] = Convert.ToDecimal(urunfiyat.Text);
                    dr["tutar"] = Convert.ToInt32(miktar.Text) * Convert.ToDecimal(urunfiyat.Text);
                    dr["urunresim"] = resim.ImageUrl;
                    dt.Rows.Add(dr);

                }
                Session["sepet"] = dt;
                Response.Redirect("sepet.aspx");

            }
        }
    }
}