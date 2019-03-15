using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOTD
{
    public partial class Login : System.Web.UI.Page
    {
        ShoppingCart myCart;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            myCart = (ShoppingCart)Session["myCart"];

            //If login button is clicked
            if (IsPostBack)
            {
                try
                {
                    DataTable dt = DataAccess.SelectQuery("SELECT * FROM[Customers] WHERE UserID = '" + txtID.Text + "'"); //Check the same value id from database
                    DataRow customerInfo = dt.Rows[0];

                    if (customerInfo != null)
                    {
                        String customerPW = customerInfo["UserPassword"].ToString().Replace(" ", "");

                        if (customerPW == txtPassword.Text)
                        {
                            Session["userId"] = txtID.Text;
                            Server.Transfer("Home.aspx", true);
                        }
                        else
                        {
                            Response.Write("<br />Please enter the correct password");
                        }
                    }
                }
                catch (Exception ex)
                {
                    //if input boxes for login is empty
                }

            }
        }
        protected void btnRegister_Click(object sender, ImageClickEventArgs e)
        {
            Server.Transfer("Registration.aspx", true);
        }
    }
}