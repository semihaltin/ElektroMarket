using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2
{

    public partial class Adres : System.Web.UI.Page
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        Models.Toplam toplam = new Models.Toplam();

        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                DataTable dt = (DataTable)Session["sepet"];


                if (Session["Kullanici"] != null)
                {
                   

                        pnllogin.Visible = false;
                    if(dt!=null)
                    {
                        pnladres.Visible = true;

                    }
                    else
                    {
                        Response.Redirect("Default.aspx");

                    }
                    string email = Session["Kullanici"].ToString();
                        var kullanici = (from o in ent.Kullanicilar
                                         where o.KullaniciAd == email && o.Silindi == false
                                         select o).FirstOrDefault();
                        aditionalInfo.Value = kullanici.Adres;
                        inputil.Value = kullanici.Il;
                        inputilce.Value = kullanici.Ilce;
                        inputtelefon.Value = kullanici.Telefon;

                    




                }
                else
                {
                    pnladres.Visible = false;
                }



            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = Session["Kullanici"].ToString();
            var degisen = (from o in ent.Kullanicilar
                           where o.KullaniciAd == email && o.Silindi == false
                           select o).FirstOrDefault();

            degisen.Adres = aditionalInfo.Value;
            degisen.Il = inputil.Value;
            degisen.Ilce = inputilce.Value;
            degisen.Telefon = inputtelefon.Value;
            try
            {

                ent.SaveChanges();
                DataModel.Satislar satis = new DataModel.Satislar();
                int kullanicino = degisen.ID;
                satis.Tarih = DateTime.Now;
                satis.TeslimTarihi = DateTime.Now.AddDays(3);
                satis.KullaniciNo = kullanicino;
                satis.Miktar = toplam.ToplamAdetbul();
                satis.Tutar = toplam.ToplamTutarBul();
                satis.TeslimDurumu = (byte)Models.Enum.Satisdurumu.odemeonay;
                ent.Satislar.Add(satis);
                ent.SaveChanges();
                DataModel.SatisDetaylari detay = new DataModel.SatisDetaylari();
                int Sonsatisno = ent.Satislar.Where(s => s.KullaniciNo == satis.KullaniciNo).ToList().Last().SatisNo;

                DataTable dt = (DataTable)Session["sepet"];
                foreach (DataRow item in dt.Rows)
                {
                    detay.SatisNo = Sonsatisno;
                    detay.UrunID = Convert.ToInt32(item["urunID"]);
                    detay.Tutar = Convert.ToDecimal(item["tutar"]);
                    detay.BirimFiyat = Convert.ToDecimal(item["fiyat"]);
                    detay.Adet = Convert.ToInt32(item["adet"]);
                    ent.SatisDetaylari.Add(detay);
                    

                    var sonuc = (from o in ent.Urunler
                                 where o.UrunID == detay.UrunID
                                 select o).FirstOrDefault();

                    sonuc.Miktar = sonuc.Miktar - detay.Adet;
                    ent.SaveChanges();

                }

             
                Session.Remove("sepet");

                Response.Redirect("Default.aspx");
              

            }
            catch (Exception ex)
            {

                string hata = ex.Message;
            }
        }

    
     

    

        protected void ddltarih_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblkarttarih.Text = ddlay.Text + "/" + ddltarih.Text;
            lblkartnumara.Text = TextBox2.Text;
            lblkartisim.Text = TextBox1.Text;

        }

        protected void ddlay_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblkarttarih.Text = ddlay.Text + "/" + ddltarih.Text;
            lblkartnumara.Text = TextBox2.Text;
            lblkartisim.Text = TextBox1.Text;

        }

      
    }
}