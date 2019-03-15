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
    public partial class Order : System.Web.UI.Page
    {
        string FName;
        string LName;
        string Address;
        string Zip;
        string City;
        string Province;
        string PhoneNumber;

        protected void Page_Load(object sender, EventArgs e)
        {
            //
        }

        protected void btn_payment_Click(object sender, ImageClickEventArgs e)
        {
            ArrayList orderInfoArr = new ArrayList();
            //DataTable dt = new DataTable();

            if (CheckEmptyText())
            {
                //Getting data from textbox
                FName = txtName_order.Text;
                LName = txtLName_order.Text;
                Address = txtAddress_order.Text;
                Zip = txtZipCode_order.Text;
                City = txtCity_order.Text;
                Province = txtProvince_order.Text;
                PhoneNumber = txtPhone.Text;

                orderInfoArr.Add(FName);
                orderInfoArr.Add(LName);
                orderInfoArr.Add(Address);
                orderInfoArr.Add(Zip);
                orderInfoArr.Add(City);
                orderInfoArr.Add(Province);
                orderInfoArr.Add(PhoneNumber);

                //Storing data in session
                Session["orderInfo"] = orderInfoArr;
                Response.Redirect("Payment.aspx");
            }
            else
            {
                //highlight which part should be filled out
            }
        }

        protected bool CheckEmptyText()
        {
            bool order = true;
            if(txtName_order.Text == null || txtLName_order.Text == null || txtAddress_order.Text == null || txtZipCode_order.Text == null || txtCity_order.Text == null || txtProvince_order.Text == null || txtPhone.Text == null)
            {
                order = false;
            }

            return order;
        }
    }
}