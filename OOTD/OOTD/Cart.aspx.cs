using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOTD
{
    public partial class Cart : System.Web.UI.Page
    {
        ShoppingCart myCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["myCart"] == null)
            {
                myCart = new ShoppingCart();
            }

            myCart = (ShoppingCart)Session["myCart"];

            //Load Cart Item
            if (!IsPostBack)
            {
                myCart = (ShoppingCart)Session["myCart"];
                FillData();
            }
        }
        private void FillData()
        {
            try
            {
                //GridView with shopping Cart items
                gvShoppingCart.DataSource = myCart.Items;
                gvShoppingCart.DataBind();
                System.Diagnostics.Debug.WriteLine(myCart.Items);
                //Label with grand total
                if (myCart.Items.Count == 0)
                {
                    lblGrandTotal.Visible = false;
                    imgBtnCheckOut.Visible = false;
                    imgEmtpyCart.Visible = true;
                }
                else
                {
                    lblGrandTotal.Visible = true;
                    imgBtnCheckOut.Visible = true;
                    imgEmtpyCart.Visible = false;
                    lblGrandTotal.Text = string.Format("Grand Total = {0, 19:C}", myCart.GrandTotal);
                }
            }
            catch (Exception e)
            {
                //
            }
        }

        protected void gvShoppingCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvShoppingCart.EditIndex = -1;
            FillData();
        }

        protected void gvShoppingCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            myCart.Delete(e.RowIndex);
            FillData();
        }

        protected void gvShoppingCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtQuantity = (TextBox)gvShoppingCart.Rows[e.RowIndex].Cells[4].Controls[0];
            int quantity = Int32.Parse(txtQuantity.Text);
            myCart.Update(e.RowIndex, quantity);
            gvShoppingCart.EditIndex = -1;
            FillData();
        }

        protected void gvShoppingCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvShoppingCart.EditIndex = e.NewEditIndex;
            FillData();
        }

        protected void imgBtnCheckOut_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["userId"] != null)
            {
                //Checkout button event handler
                string id = Request.QueryString["ProductId"];

                if (myCart.Items.Count != 0) //if cart item isnt empty
                {
                    checkoutItems();
                    Response.Redirect("Order.aspx");
                }
                else
                {
                    //Popup message showing the cart is empty
                    System.Diagnostics.Debug.WriteLine("Failed to add items into database");
                }
            }
            else
            {
                //popup message directing user to log in

                //redirect user to login page
                Response.Redirect("Login.aspx");
            }
        }
        
        protected void checkoutItems()
        {
            string userID;
            string productName;
            double productPrice;
            int productQuantity;
            string productSize;
            DataTable dt = new DataTable();

            //ArrayList itemsArr = new ArrayList();
            try
            {
                if (IsPostBack)
                {
                    System.Diagnostics.Debug.WriteLine("Hello");
                    dt.Columns.Add("userID", typeof(string));
                    dt.Columns.Add("productName", typeof(string));
                    dt.Columns.Add("productPrice", typeof(double));
                    dt.Columns.Add("Quantity", typeof(int));
                    dt.Columns.Add("Size", typeof(string));


                    foreach (GridViewRow row in gvShoppingCart.Rows)
                    {
                        userID = Session["userId"].ToString();
                        productName = row.Cells[0].Text;
                        productPrice = Convert.ToInt32(row.Cells[2].Text);
                        productQuantity = Convert.ToInt32(row.Cells[4].Text);
                        productSize = row.Cells[3].Text;

                        System.Diagnostics.Debug.WriteLine(userID + " " + productName + " " + productPrice + " " + productQuantity + " " + productSize);

                        //itemsArr.Add(new OrderItem(userID, productName, productPrice, productQuantity, productSize));
                        dt.Rows.Add(new object[] { userID, productName, productPrice, productQuantity, productSize });
                    }

                    Session["orderItems"] = dt;
                }
            }catch(Exception ex)
            {
                //
            }
               

        }
    }
}