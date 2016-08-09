using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2
{
    public partial class Sepet : System.Web.UI.Page
    {
        Models.Sepet spt = new Models.Sepet();
        Models.Toplam tplm = new Models.Toplam();

        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Kullanici"] == null)
                {
                    Button1.Visible = true;
                }
                else
                {
                    Button1.Visible = false;
                }


                pnlDolusepet.Visible = false;


                if (Session["sepet"] != null)
                {
                    DataTable dt = (DataTable)Session["sepet"];
                    if (dt.Rows.Count > 0)
                    {
                        pnlbossepet.Visible = false;
                        pnlDolusepet.Visible = true;
                    }


                    Sepetigoster(dt);

                }
                else
                {
                    DataTable dt = spt.YeniSepet();
                    Session["sepet"] = dt;

                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }
            }


        }

        private void Sepetigoster(DataTable dt)
        {


            foreach (DataRow item in dt.Rows)
            {
                int id = Convert.ToInt32(item["urunID"]);
                var sonuc = (from o in ent.Urunler
                             where o.UrunID == id
                             select o).FirstOrDefault();

                if (Convert.ToInt32(item["adet"]) > Convert.ToInt32(sonuc.Miktar))
                {
                    item["adet"] = Convert.ToInt32(sonuc.Miktar);
                    item["tutar"] = Convert.ToInt32(sonuc.Miktar) * Convert.ToInt32(item["fiyat"]);
                }


            }


            DataList1.DataSource = dt;
            DataList1.DataBind();

        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Bosalt")
            {
                DataTable dt = (DataTable)Session["sepet"];
                dt.Rows.Clear();
                Session["sepet"] = dt;
                Sepetigoster(dt);
                pnlDolusepet.Visible = false;
                pnlbossepet.Visible = true;


            }
            else if (e.CommandName == "Satinal")
            {
                DataTable dt = (DataTable)Session["sepet"];
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("Adres.aspx");
                }
            }
            else if (e.CommandName == "Devam")
            {
                Response.Redirect("Default.aspx");
            }
            else if (e.CommandName == "eksi")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = (DataTable)Session["sepet"];
                foreach (DataRow item in dt.Rows)
                {
                    if (Convert.ToInt32(item["urunID"]) == id)
                    {

                        item["adet"] = Convert.ToInt32(item["adet"]) - 1;
                        item["tutar"] = Convert.ToDecimal(item["tutar"]) - Convert.ToDecimal(item["fiyat"]);
                        Sepetigoster(dt);

                    }


                }


            }
            else if (e.CommandName == "artir")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = (DataTable)Session["sepet"];
                foreach (DataRow item in dt.Rows)
                {
                    if (Convert.ToInt32(item["urunID"]) == id)
                    {
                        item["adet"] = Convert.ToInt32(item["adet"]) + 1;
                        item["tutar"] = Convert.ToDecimal(item["tutar"]) + Convert.ToDecimal(item["fiyat"]);
                        Sepetigoster(dt);

                    }
                }

            }
            else if (e.CommandName == "sil")
            {
                ImageButton sil = (ImageButton)e.Item.FindControl("ImageButton3");
                int id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = (DataTable)Session["sepet"];
                bool varmi = false;
                int sira = -1;

                foreach (DataRow item in dt.Rows)
                {
                    if (varmi == false)
                    {
                        sira++;

                    }

                    if (Convert.ToInt32(item["urunID"]) == id)
                    {


                        varmi = true;

                    }
                }

                dt.Rows.RemoveAt(sira);
                Session["sepet"] = dt;
                Sepetigoster(dt);
                if (dt.Rows.Count == 0)
                {
                    pnlDolusepet.Visible = false;
                    pnlbossepet.Visible = true;

                }


            }



        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label labeladet = (Label)e.Item.FindControl("lbladet");
                labeladet.Text = tplm.ToplamAdetbul().ToString();
                Label labeltutar = (Label)e.Item.FindControl("lbltutar");
                labeltutar.Text = tplm.ToplamTutarBul().ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adres.aspx");
        }
    }
}