using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2.Admin
{
    public partial class UrunEkle : System.Web.UI.Page
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KategoriGetir();
                if (ddlKategoriler.SelectedValue == "")
                {

                }
                else
                {
                    AltKategoriGetir(Convert.ToInt32(ddlKategoriler.SelectedValue));

                }
                UrunleriGetir();
            }
        }

        protected void UrunleriGetir()
        {
            int akno = 0;
            if (ddlAltKategoriler.SelectedValue == "")
            {
                akno = 0;
            }
            else
            {
                akno = Convert.ToInt32(ddlAltKategoriler.SelectedValue);

            }

            int kno = 0;
            if (ddlKategoriler.SelectedValue == "")
            {
                kno = 0;
            }
            else
            {
                kno = Convert.ToInt32(ddlKategoriler.SelectedValue);

            }
           

            var sonuc = (from o in ent.Urunler
                         where o.Silindi == false && o.UrunKategoriNo == kno && o.UrunAltKategoriNo == akno
                         select o).ToList();

            gvUrunler.DataSource = sonuc;
            gvUrunler.DataBind();
        }

        protected void AltKategoriGetir(int ID)
        {
            var Altkategori = (from o in ent.AltKategoriler
                               where o.Silindi == false && o.KategoriNo == ID
                               select o).ToList();

            ddlAltKategoriler.DataValueField = "ID";
            ddlAltKategoriler.DataTextField = "AltKategoriAd";
            ddlAltKategoriler.DataSource = Altkategori;
            ddlAltKategoriler.DataBind();

        }
        protected void KategoriGetir()
        {
            var kategori = (from o in ent.Kategoriler
                            where o.Silindi == false
                            select o).ToList();

            ddlKategoriler.DataValueField = "ID";
            ddlKategoriler.DataTextField = "KategoriAd";
            ddlKategoriler.DataSource = kategori;
            ddlKategoriler.DataBind();
        }

        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategoriGetir(Convert.ToInt32(ddlKategoriler.SelectedValue));
            UrunleriGetir();
        }

        protected void ddlAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            UrunleriGetir();
        }

        protected void gvUrunler_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUrunKodu.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[2].Text);
            txtUrunAdi.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[3].Text);
            txtUrunBilgisi.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[6].Text);
            txtMiktar.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[4].Text);
            txtFiyat.Text = HttpUtility.HtmlDecode(gvUrunler.SelectedRow.Cells[5].Text);
            pnlurun.Visible = true;
            btnKaydet.Visible = false;
            btnDegistir.Visible = true;
            btnSil.Visible = true;
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (fuAnasayfaresim.HasFile)
            {
                fuAnasayfaresim.SaveAs(Server.MapPath("/themes/images/products/") + fuAnasayfaresim.FileName);

            }
            if (fudetay1.HasFile)
            {
                fudetay1.SaveAs(Server.MapPath("/themes/images/products/detay1/") + fudetay1.FileName);

            }
            if (fudetay2.HasFile)
            {
                fudetay2.SaveAs(Server.MapPath("/themes/images/products/detay2/") + fudetay2.FileName);

            }
            if (fudetay3.HasFile)
            {
                fudetay3.SaveAs(Server.MapPath("/themes/images/products/detay3/") + fudetay3.FileName);

            }




            DataModel.Urunler urun = new DataModel.Urunler();

            urun.UrunKodu = txtUrunKodu.Text;
            urun.UrunKategoriNo = Convert.ToInt32(ddlKategoriler.SelectedValue);
            urun.UrunAltKategoriNo = Convert.ToInt32(ddlAltKategoriler.SelectedValue);
            urun.UrunAd = txtUrunAdi.Text;
            urun.UrunBilgisi = txtUrunBilgisi.Text;
            urun.Miktar = Convert.ToInt32(txtMiktar.Text);
            urun.UrunFiyat = Convert.ToDecimal(txtFiyat.Text);
            ent.Urunler.Add(urun);
            ent.SaveChanges();

            DataModel.Resimler resim = new DataModel.Resimler();
            int SonSatisNo = ent.Urunler.Where(s => s.Silindi == false).ToList().Last().UrunID;

            resim.UrunID = SonSatisNo;
            resim.Urunresimyolu1 = "themes/images/products/" + fuAnasayfaresim.FileName;
            resim.Urunresimyolu2 = "themes/images/products/detay1/" + fudetay1.FileName;
            resim.Urunresimyolu3 = "themes/images/products/detay2/" + fudetay2.FileName;
            resim.Urunresimyolu4 = "themes/images/products/detay3/" + fudetay3.FileName;
            ent.Resimler.Add(resim);

            ent.SaveChanges();
              
            
          




        }

        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(gvUrunler.SelectedValue);

            var sonuc = (from o in ent.Resimler
                         where o.UrunID == id
                         select o).FirstOrDefault();

            sonuc.Urunler.UrunAd = txtUrunAdi.Text;
            sonuc.Urunler.UrunBilgisi = txtUrunBilgisi.Text;
            sonuc.Urunler.Miktar = Convert.ToInt32(txtMiktar.Text);
            sonuc.Urunler.UrunFiyat = Convert.ToDecimal(txtFiyat.Text);
            sonuc.Urunler.UrunKodu = txtUrunKodu.Text;
            sonuc.Urunler.UrunKategoriNo = Convert.ToInt32(ddlKategoriler.SelectedValue);
            sonuc.Urunler.UrunAltKategoriNo = Convert.ToInt32(ddlAltKategoriler.SelectedValue);
            sonuc.Urunresimyolu1 = "themes/images/products/" + fuAnasayfaresim.FileName;
            sonuc.Urunresimyolu2 = "themes/images/products/detay1/" + fudetay1.FileName;
            sonuc.Urunresimyolu3 = "themes/images/products/detay2/" + fudetay2.FileName;
            sonuc.Urunresimyolu4 = "themes/images/products/detay3/" + fudetay3.FileName;
            try
            {
                ent.SaveChanges();
                UrunleriGetir();
                Temizle();

            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }

        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(gvUrunler.SelectedValue);

            var sonuc = (from o in ent.Resimler
                         where o.UrunID == id
                         select o).FirstOrDefault();

            sonuc.Urunler.Silindi = true;
            sonuc.Silindi = true;

            try
            {
                ent.SaveChanges();
                UrunleriGetir();
                Temizle();
            }
            catch (Exception ex)
            {

                string hata = ex.Message;
            }
        }
        protected void Temizle()
        {
            txtFiyat.Text = "";
            txtMiktar.Text = "";
            txtUrunAdi.Text = "";
            txtUrunBilgisi.Text = "";
            txtUrunKodu.Text = "";
            fuAnasayfaresim.Controls.Clear();
            fudetay1.Controls.Clear();
            fudetay2.Controls.Clear();
            fudetay3.Controls.Clear();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            btnKaydet.Visible = true;
            btnDegistir.Visible = false;
            btnSil.Visible = false;
            pnlurun.Visible = true;
            Temizle();
        }
    }
}