using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret_2.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        DataModel.EticaretEntities ent = new DataModel.EticaretEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                if(Session["Admin"]==null)
                {
                    pnlkategori.Visible = false;
                }

               
            }
        }
    }
}