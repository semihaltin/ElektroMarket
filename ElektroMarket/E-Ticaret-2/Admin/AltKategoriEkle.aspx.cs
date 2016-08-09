using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2.Admin
{
    public partial class AltKategoriEkle : System.Web.UI.Page
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] == null)
                {
                    Response.Redirect("Admin.aspx");
                }
                KategoriGetir();
                AltKategoriGetir();

            }
        }
        protected void KategoriGetir()
        {
            var sonuc = (from o in ent.Kategoriler
                         where o.Silindi == false
                         select o).ToList();


            ddlkategorigetir.DataSource = sonuc;
            ddlkategorigetir.DataBind();
        }

        protected void AltKategoriGetir()
        {
            int kategoriNo = 0;
            if (ddlkategorigetir.SelectedValue == "")
            {
                kategoriNo = 0;
            }
            else
            {
                kategoriNo = Convert.ToInt32(ddlkategorigetir.SelectedValue);

            }
           
            var sonuc = (from o in ent.AltKategoriler
                         where o.Silindi == false && o.KategoriNo == kategoriNo
                         select o).ToList();
            gvAltKategoriEkle.DataSource = sonuc;
            gvAltKategoriEkle.DataBind();
        }

        protected void gvAltKategoriEkle_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtAltkategoriad.Text = HttpUtility.HtmlDecode(gvAltKategoriEkle.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(gvAltKategoriEkle.SelectedRow.Cells[3].Text);
            pnlaltkategori.Visible = true;
            btnKaydet.Visible = false;
            btnSil.Visible = true;
            btnDegistir.Visible = true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            pnlaltkategori.Visible = true;
            btnKaydet.Visible = true;
            btnDegistir.Visible = false;
            btnSil.Visible = false;
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            DataModel.AltKategoriler yeni = new DataModel.AltKategoriler();
            yeni.AltKategoriAd = txtAltkategoriad.Text;
            yeni.Aciklama = txtAciklama.Text;
            yeni.KategoriNo = Convert.ToInt32(ddlkategorigetir.SelectedValue);
            ent.AltKategoriler.Add(yeni);
            try
            {
                ent.SaveChanges();
                pnlaltkategori.Visible = false;
                AltKategoriGetir();
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvAltKategoriEkle.SelectedValue);
            var degisen = (from o in ent.AltKategoriler
                           where o.ID == ID
                           select o).FirstOrDefault();

            degisen.AltKategoriAd = txtAltkategoriad.Text;
            degisen.Aciklama = txtAciklama.Text;
            degisen.KategoriNo = Convert.ToInt32(ddlkategorigetir.SelectedValue);
            try
            {
                ent.SaveChanges();
                pnlaltkategori.Visible = false;
                AltKategoriGetir();
            }
            catch (Exception ex)
            {

                string hata = ex.Message;
            }


        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvAltKategoriEkle.SelectedValue);
            var silinen = (from o in ent.AltKategoriler
                           where o.ID == ID
                           select o).FirstOrDefault();

            silinen.Silindi = true;
            try
            {
                ent.SaveChanges();
                AltKategoriGetir();
                pnlaltkategori.Visible = false;

            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }

        }

        protected void ddlkategorigetir_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategoriGetir();
        }
    }
}