using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOTD
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ////List displayed items in products
                string IDCat = Request.QueryString["CatID"];
                if (IDCat != null)
                {
                    dlCategory.DataSource = DataAccess.SelectQuery("SELECT * FROM Products WHERE CatID=" + IDCat);
                    dlCategory.DataBind();
                }
            }
        }
    }
}