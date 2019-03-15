using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOTD
{
    public partial class LeftMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //List displayed on the menu bar is the category name
                dlMenu.DataSource = DataAccess.SelectQuery("SELECT * FROM Categories;");
                dlMenu.DataBind();
            }
        }
    }
}