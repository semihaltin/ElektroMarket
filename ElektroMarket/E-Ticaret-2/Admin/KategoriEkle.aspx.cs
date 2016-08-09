using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2.Admin
{
    public partial class KategoriEkle : System.Web.UI.Page
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
                KategorileriGetir();
               
            }
        }

        protected void KategorileriGetir()
        {
            var sonuc = (from o in ent.Kategoriler
                         where o.Silindi == false
                         select o).ToList();
            gvkategoriler.DataSource = sonuc;
            gvkategoriler.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnkbtnkategori_Click(object sender, EventArgs e)
        {
            pnlyenikategori.Visible = true;
            btnDegistir.Visible = false;
            btnSil.Visible = false;
            btnKaydet.Visible = true;
        }

        protected void gvkategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtyenikategori.Text = HttpUtility.HtmlDecode(gvkategoriler.SelectedRow.Cells[1].Text);
            txtyeniaciklama.Text = HttpUtility.HtmlDecode(gvkategoriler.SelectedRow.Cells[2].Text);
            btnKaydet.Visible = false;
            btnDegistir.Visible = true;
            btnSil.Visible = true;
            pnlyenikategori.Visible = true;
            
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            DataModel.Kategoriler k = new DataModel.Kategoriler();
            k.KategoriAd = txtyenikategori.Text;
            k.Aciklama = txtyeniaciklama.Text;
            ent.Kategoriler.Add(k);
            try
            {
                ent.SaveChanges();
                KategorileriGetir();
                pnlyenikategori.Visible = false;
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }


        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvkategoriler.SelectedValue);
            var silinen = (from o in ent.Kategoriler
                           where o.ID == ID
                           select o).FirstOrDefault();

            silinen.Silindi = true;
            try
            {
                ent.SaveChanges();
                KategorileriGetir();
                pnlyenikategori.Visible = false;
                

            }
            catch (Exception ex)
            {

                string hata = ex.Message;
            }
        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvkategoriler.SelectedValue);
            var degisen = (from o in ent.Kategoriler
                           where o.ID == ID
                           select o).FirstOrDefault();

            degisen.KategoriAd = txtyenikategori.Text;
            degisen.Aciklama = txtyeniaciklama.Text;
            try
            {
                ent.SaveChanges();
                KategorileriGetir();
                pnlyenikategori.Visible = false;
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
    }
}