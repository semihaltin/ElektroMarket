﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2
{
    public partial class login : System.Web.UI.UserControl
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) inputEmail.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var sonuc = (from o in ent.Kullanicilar
                         where o.KullaniciAd == inputEmail.Value && o.Sifre == inputPassword.Value && o.Silindi == false
                         select o).Count();
            if (sonuc > 0)
            {
                Session["Kullanici"] = inputEmail.Value;


               
                Response.Redirect("Adres.aspx");

            }
        }
    }
}