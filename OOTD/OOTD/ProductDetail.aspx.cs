using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOTD
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        ShoppingCart myCart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Product detail page when description 
                string id = Request.QueryString["ProductId"];
                if (id != null)
                {
                    dlProduct.DataSource = DataAccess.SelectQuery("SELECT * FROM Products WHERE ProductId = " + id);
                    dlProduct.DataBind();
                }
            }
        }

        protected void dlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void imgBtnCart_Click(object sender, ImageClickEventArgs e)
        {
            //When button to shopping cart is clicked
            if (Session["myCart"] == null)
            {
                myCart = new ShoppingCart();
                Session["myCart"] = myCart;
            }
            string id = Request.QueryString["ProductId"];
            myCart = (ShoppingCart)Session["myCart"];

            //Getting product where id matches with requested id
            DataTable dt = DataAccess.SelectQuery("SELECT * FROM Products WHERE ProductId = " + id);
            DataRow row = dt.Rows[0];

            //Quantity
            string quantityRaw = Request.Form["sbxQuantity"];
            int quantity = Convert.ToInt32(quantityRaw);

            //Size
            string sizeRaw = Request.Form["sbxSize"];
            int sizeInt = Convert.ToInt32(sizeRaw);
            string size = "";
            switch (sizeInt)
            {
                case 1: size = "Small"; break;
                case 2: size = "Medium"; break;
                case 3: size = "Large"; break;
            }

            string script = "alert(\"Successfully added the item.\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);

            //Constructor getting value 
            myCart.Insert(new CartItem(Int32.Parse(id), row["Name"].ToString(), row["Image"].ToString(), row["Description"].ToString(), Double.Parse(row["Price"].ToString()), quantity, size));
        }
    }
    public class ShoppingCart
    {
        public List<CartItem> Items { get; set; } // get array of items of cart

        public ShoppingCart()
        {
            Items = new List<CartItem>();
        }

        private int ItemIndexOf(int ID)
        {
            //get the same index of item
            foreach (CartItem item in Items)
            {
                if (item.ID == ID)
                {
                    return Items.IndexOf(item); //return index
                }
            }
            return -1;
        }

        public void Insert(CartItem item)
        {
            int index = ItemIndexOf(item.ID);

            if (index == -1) //which means that there is no matching id in the item list therefore include new one into cart
            {
                Items.Add(item);
            }
            else
            {
                Items[index].Quantity += item.Quantity;
            }
        }

        public void Delete(int rowID)
        {
            Items.RemoveAt(rowID);
        }
        public void Update(int rowID, int Quantity)
        {
            //Update quantity of items in shopping cart
            if (Quantity > 0)
            {
                Items[rowID].Quantity = Quantity;
            }
            else
            {
                Delete(rowID);
            }
        }

        public double GrandTotal
        {
            //Calculate Total
            get
            {
                if (Items == null)
                {
                    //If shopping cart is empty
                    return 0;
                }
                else
                {
                    double grandTotal = 0;
                    foreach (CartItem item in Items)
                    {
                        grandTotal += item.Quantity * item.Price;
                    }
                    return grandTotal;
                }
            }
        }
    }
}