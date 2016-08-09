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
    public partial class Default : System.Web.UI.Page
    {

        EticaretEntities ent = new EticaretEntities();
        Models.Sepet spt = new Models.Sepet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
               
            {
                if (Request.QueryString["kategori"] == null)
                {
                    ResimleriGetir();

                }
                else
                {
                    string marka = Request.QueryString["marka"];
                    int kategorino = Convert.ToInt32(Request.QueryString["kategori"]);
                    var sonuc = (from o in ent.Resimler
                                 where o.Urunler.UrunKategoriNo == kategorino && o.Urunler.UrunAd.Contains(marka) && o.Silindi == false
                                 select new { o.Urunler.UrunAd, o.Urunresimyolu1, o.UrunID, o.ID, o.Urunler.UrunFiyat ,o.Urunler.Miktar}).ToList();

                    dlisturunler.DataSource = sonuc;
                    dlisturunler.DataBind();
                    
                 
                    
                }

            }

            Button btnarama = (Button)Master.FindControl("Button2");
            btnarama.Click += Ara_Click;

        }

        private void Ara_Click(object sender, EventArgs e)
        {
           
            TextBox txtarama = (TextBox)Master.FindControl("txtarama");
            DropDownList ddlarama = (DropDownList)Master.FindControl("ddlarama");


            string urunad = txtarama.Text;
            int kno = Convert.ToInt32(ddlarama.SelectedValue);
            var sonuc = (from o in ent.Resimler
                         where o.Urunler.UrunKategoriNo == kno && o.Urunler.UrunAd.Contains(urunad) && o.Silindi == false
                         select new { o.Urunler.UrunAd, o.Urunresimyolu1, o.UrunID, o.ID, o.Urunler.UrunFiyat,o.Urunler.Miktar }).ToList();

            dlisturunler.DataSource = sonuc;
            dlisturunler.DataBind();



        }

        private void ResimleriGetir()
        {
            var Resims = (from resim in ent.Resimler
                          where resim.Silindi == false
                          select new { resim.Urunler.UrunAd, resim.Urunresimyolu1, resim.UrunID, resim.ID, resim.Urunler.UrunFiyat, resim.Urunler.Miktar,resim.Urunler.UrunBilgisi }).ToList();

            dlisturunler.DataSource = Resims;
            dlisturunler.DataBind();






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

                Label urunAd = (Label)e.Item.FindControl("lblUrunAd");
                Label urunfiyat = (Label)e.Item.FindControl("lblUrunFiyat");
                TextBox miktar = (TextBox)e.Item.FindControl("txtMiktar");

                ImageButton resim = (ImageButton)e.Item.FindControl("imgResim");
                int id = Convert.ToInt32(e.CommandArgument);





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


                        item["adet"] = Convert.ToInt32(item["adet"]) + Convert.ToInt32(miktar.Text);
                        item["tutar"] = Convert.ToInt32(item["tutar"]) + Convert.ToInt32(miktar.Text) * Convert.ToDecimal(urunfiyat.Text);
                        varmi = true;

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