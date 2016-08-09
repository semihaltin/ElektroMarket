using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2
{
    public partial class UyeKayit : System.Web.UI.Page
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmesaj.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(cbxSozlesme.Checked==false)
            {
                lblmesaj.Text = "Lütfen Gizlilik Sçzleşmesini Onaylayınız";
            }
            else
            {
                if(Mailkontrol(inputmail.Value))
                {
                    lblmesaj.Text = "Girdiğiniz mail adresi sisteme kayıtlıdır";
                    inputmail.Focus();
                }
                else
                {
                    DataModel.Kullanicilar yeni = new DataModel.Kullanicilar();
                    yeni.Ad = inputisim.Value;
                    yeni.Soyad = inputsoyisim.Value;
                    yeni.Adres = aditionalInfo.Value;
                    yeni.Il = inputil.Value;
                    yeni.KargoID = 1;
                    yeni.Sifre = sifre.Value;
                    yeni.Tckno = inputtckno.Value;
                    yeni.KullaniciAd = inputmail.Value;
                    yeni.Telefon = inputtelefon.Value;
                    yeni.Ilce = inputilce.Value;
                    ent.Kullanicilar.Add(yeni);
                    try
                    {
                        ent.SaveChanges();
                        Response.Redirect("Adres.aspx");
                    }
                    catch (Exception ex)
                    {
                        string hata = ex.Message;
                    }
                    
                }
            }
        }

        private bool Mailkontrol(string mail)
        {
            var sonuc = (from o in ent.Kullanicilar
                         where o.KullaniciAd == mail && o.Silindi == false
                         select o).FirstOrDefault();
            if (sonuc != null) return true;
            return false;
        }
    }
}