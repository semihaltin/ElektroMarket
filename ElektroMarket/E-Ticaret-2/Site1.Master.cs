using E_Ticaret_2.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace E_Ticaret_2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        EticaretEntities ent = new EticaretEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Label1.Visible = false;

                var categories = (from kategori in ent.Kategoriler
                                  where kategori.Silindi == false
                                  select kategori).ToList();
              
               
                ddlarama.DataTextField = "KategoriAd";
                ddlarama.DataValueField = "ID";
                ddlarama.DataSource = categories;
                ddlarama.DataBind();

                foreach (var item in categories)
                {
                    MenuItem mitm = new MenuItem();
                    mitm.Text = item.KategoriAd;
                    mitm.Value = item.ID.ToString();
                    Menu1.Items.Add(mitm);

                    var subcategories = (from altkategori in ent.AltKategoriler
                                         where altkategori.Silindi == false && altkategori.KategoriNo == item.ID
                                         select altkategori).ToList();
                    foreach (var eleman in subcategories)
                    {
                        MenuItem citm = new MenuItem();
                        citm.Text = eleman.AltKategoriAd;
                        citm.Value = eleman.ID.ToString();
                        mitm.ChildItems.Add(citm);
                    }
                }

                if (Session["Kullanici"] != null)
                {
                    string ad = Session["Kullanici"].ToString();
                    var sonuc = (from kategori in ent.Kullanicilar
                                      where kategori.Silindi == false&&kategori.KullaniciAd==ad
                                      select kategori).FirstOrDefault();
                    Label1.Visible = true;
                    Label1.Text = sonuc.Ad +"  " + sonuc.Soyad;
                    Button1.Visible = false;
                }
              
                //var sonuc = from foto in ent.Resimler

                //            select foto.Urunresimyolu1;

                //List<string> liste = new List<string>();


                //foreach (var item in sonuc)
                //{
                //    liste.Add(item);
                //}


                //if (liste.Count > 0)
                //{
                //    Image1.ImageUrl = liste[0];
                //    Image1.DataBind();
                //}

                //if (liste.Count > 1)
                //{
                //    Image2.ImageUrl = liste[1];
                //    Image2.DataBind();
                //}
                //else
                //{
                //    Image2.ImageUrl = liste[0];
                //    Image2.DataBind();
                //}
                //if (liste.Count > 2)
                //{
                //    Image3.ImageUrl = liste[2];
                //    Image3.DataBind();
                //}
                //else
                //{
                //    Image3.ImageUrl = liste[0];
                //    Image3.DataBind();

                //}
                //if (liste.Count > 3)
                //{
                //    Image4.ImageUrl = liste[3];
                //    Image4.DataBind();
                //}
                //else
                //{
                //    Image4.ImageUrl = liste[0];
                //    Image4.DataBind();
                //}
                //if (liste.Count>4)
                //{
                //    Image5.ImageUrl = liste[4];
                //    Image5.DataBind();
                //}
                //else
                //{
                //    Image5.ImageUrl = liste[0];
                //    Image5.DataBind();
                //}

                // if (liste.Count > 5)
                //{
                //    Image6.ImageUrl = liste[5];
                //    Image6.DataBind();
                //}
                // else
                //{
                //    Image6.ImageUrl = liste[0];
                //    Image6.DataBind();
                //}

            }


        }



        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Write("Kategori : " + e.Item.Text + ", ID : " + e.Item.Value);
            Response.Write(e.Item.ValuePath);
            string[] Degerler = e.Item.ValuePath.Split('/');
            int altkno = 0;
            if (Degerler.Length > 1)
            {
                altkno = Convert.ToInt32(Degerler[1]);

            }
            Response.Redirect("Products.aspx?kno=" + Degerler[0] + "&akno=" + altkno);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["Kullanici"] == null)
            {
                Response.Redirect("Adres.aspx");
               

            }
          

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string marka = txtarama.Text;
            int kno = Convert.ToInt32(ddlarama.SelectedValue);
            

            Response.Redirect("Default.aspx?marka=" + marka + "&kategori=" + kno);




        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Sepet.aspx");
        }
    }
}