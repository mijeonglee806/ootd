using System;
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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, ImageClickEventArgs e)
        {
            //Save data user entered into database Customers
            if (check_emptyText())
            {
                if (check_duplicatedID() && check_matchingPw())
                {
                    try
                    {
                        Guid CustomerGUID = Guid.NewGuid();// this is for unique id for customers

                        //Check the same value id from database
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnection"].ConnectionString);
                        con.Open();
                        //insert user informations into Customers database
                        string insertUser = "insert into [Customers] (CustomerId,UserId,Email,UserPassword,FirstName,LastName,Address,Phone) values (@id ,@Uname ,@email ,@password ,@firstName ,@lastName ,@address ,@phone)";
                        SqlCommand com = new SqlCommand(insertUser, con);
                        com.Parameters.AddWithValue("@id", CustomerGUID.ToString());
                        com.Parameters.AddWithValue("@Uname", txtId.Text);
                        com.Parameters.AddWithValue("@email", txtEmail.Text);
                        com.Parameters.AddWithValue("@password", txtPw.Text);
                        com.Parameters.AddWithValue("@firstName", txtFName.Text);
                        com.Parameters.AddWithValue("@lastName", txtLName.Text);
                        com.Parameters.AddWithValue("@address", txtAddress.Text);
                        com.Parameters.AddWithValue("@phone", txtPhone.Text);
                        com.ExecuteNonQuery();

                        Response.Redirect("Login.aspx");

                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error:" + ex.ToString());
                    }
                }
            }
        }

        protected bool check_duplicatedID()
        {
            bool validID = false;
            //if user id already exists
            if (IsPostBack)
            {
                DataTable dt = DataAccess.SelectQuery("SELECT * FROM[Customers] WHERE UserID = '" + txtId.Text + "'"); //Check the same value id from database
                int duplicatedUser = dt.Rows.Count;

                //Check if the entered ID already exists
                if (duplicatedUser != 0)
                {
                    userWarning.Style["visibility"] = "visible";
                }
                else
                {
                    validID = true;
                    //id is valid to use
                }
            }

            return validID;
        }
        protected bool check_matchingPw()
        {
            bool matchingPw = false;
            if (txtPw.Text == txtPwConfirm.Text)
            {
                matchingPw = true;
            }
            else
            {
                userWarningPw.Style["visibility"] = "visible";
            }
            return matchingPw;
        }
        protected bool check_emptyText()
        {
            bool notEmtpyText = false;
            if (txtId.Text == null || txtEmail.Text == null || txtPw.Text == null || txtFName.Text == null || txtLName.Text == null || txtAddress.Text == null || txtPhone.Text == null)
            {
                //change to switch method
            }
            else
            {
                notEmtpyText = true;
            }

            return notEmtpyText;
        }
    }
}