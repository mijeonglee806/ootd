using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOTD
{
    public partial class Payment : System.Web.UI.Page
    {
        public object Messagebox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void storeInOrderInfo()
        {
            ArrayList order = (ArrayList)Session["orderInfo"];
            string insertQuery;
            Guid orderInfoGUID;

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString);
            connection.Open();

            for(int idx = 0; idx<order.Count; idx++)
            {
                insertQuery = "insert into [Orders](OrderId,FirstName,LastName,Address,Zip, City,Province, PhoneNumber) values (@id1,@fn1 ,@ln1 ,@ad1 ,@zip1, @city1,@prov1, @phone1)";
                SqlCommand com = new SqlCommand(insertQuery, connection);

                orderInfoGUID = Guid.NewGuid();

                com.Parameters.AddWithValue("@id1", orderInfoGUID);
                com.Parameters.AddWithValue("@fn1", order[0]);
                com.Parameters.AddWithValue("@ln1", order[1]);
                com.Parameters.AddWithValue("@ad1", order[2]);
                com.Parameters.AddWithValue("@zip1", order[3]);
                com.Parameters.AddWithValue("@city1", order[4]);
                com.Parameters.AddWithValue("@prov1", order[5]);
                com.Parameters.AddWithValue("@phone1", order[6]);
                com.ExecuteNonQuery();
            }
        }
        public void storeInOrderItems()
        {
            DataTable items = (DataTable)Session["orderItems"];

            Guid itemIdGUID;
            string insertItems;
            
                SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString);
                connection.Open();

                System.Diagnostics.Debug.WriteLine("orderitem connection successful");

                //Add items into database
                foreach (DataRow dr in items.Rows)
                {
                    System.Diagnostics.Debug.WriteLine("user id" + dr["userID"].ToString());

                    insertItems = "insert into [OrderItems](UserID,CartProductName,CartProductPrice,CartProductQuantity,CartProductItemSize, ItemID) values (@id1,@pn1 ,@pp1 ,@quan1 ,@size1, @itemid)";
                    SqlCommand com = new SqlCommand(insertItems, connection);

                    itemIdGUID = Guid.NewGuid();
                    com.Parameters.AddWithValue("@id1", dr["userID"].ToString());
                    com.Parameters.AddWithValue("@pn1", dr["productName"]);
                    com.Parameters.AddWithValue("@pp1", dr["productPrice"]);
                    com.Parameters.AddWithValue("@quan1", dr["Quantity"]);
                    com.Parameters.AddWithValue("@size1", dr["Size"]);
                    com.Parameters.AddWithValue("@itemid", itemIdGUID);
                    com.ExecuteNonQuery();
            }
                connection.Close();
        }

        protected void btnPayment_Click(object sender, ImageClickEventArgs e)
        {
            bool changeScreen = false;
            string script = "";
            if (IsPostBack)
            {
                if (!checkEmptyTxt())
                {
                    if (validateCardInfo())
                    {
                        storeInOrderItems(); // store items into database
                        storeInOrderInfo(); // store order information into database

                        script = "alert(\"The payment completed!\");";
                        changeScreen = true;
                    }
                    else
                    {
                        script = "alert(\"Invalid card information.\");";
                        //System.Diagnostics.Debug.WriteLine("Card validation: " + validateCardInfo());
                    }
                }
                else
                {
                    //message
                    script = "alert(\"Please enter valid information.\");";
                }

                if (changeScreen)
                {
                    Response.Redirect("Home.aspx");
                }
            }

            ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
        }
        protected bool checkEmptyTxt()
        {
            bool empty = false;
            if(txtCartNumber.Text == null || txtCardHolder.Text == null || txtCVV.Text == null)
            {
                empty = true;
            }
            if(Request.Form["sbxYear"] == null || Request.Form["sbxMonth"] == null || Request.Form["sbxPayment"] == null)
            {
                empty = true;
            }
            return empty;
        }
        protected bool validateCardInfo()
        {
            bool validate = false;
            if (IsPostBack)
            { 
                try
                {
                    DataTable dt = DataAccess.SelectQuery("SELECT * FROM [Payment] WHERE CardNum = '" + txtCartNumber.Text + "'"); //Check the same value cardnumber from database
                    DataRow cardInfo = dt.Rows[0];
                    

                    if (cardInfo != null)
                    {
                        string month = cardInfo["Month"].ToString().Replace(" ", "");
                        string year = cardInfo["Year"].ToString().Replace(" ", "");
                        string cvv = cardInfo["CVV"].ToString().Replace(" ", "");
                        string cardHolder = cardInfo["CardHolder"].ToString().Replace(" ", "");
                        string cardType = cardInfo["CartType"].ToString().Replace(" ", "");

                        string inputCardType =  Request.Form["sbxPayment"];
                        int inputCardTypeInt = Convert.ToInt32(inputCardType);
                        string cType = "";
                        
                        switch (inputCardTypeInt)
                        {
                            case 1: cType = "VISA"; break;
                            case 2: cType = "Master Card"; break;
                            case 3: cType = "PayPal";  break;
                        }

                        string inputYear = Request.Form["sbxYear"];
                        int inputYearInt = Convert.ToInt32(inputYear);
                        string cYear = "";

                        switch (inputYearInt)
                        {
                            case 1: cYear = "2018"; break;
                            case 2: cYear = "2019"; break;
                            case 3: cYear = "2020"; break;
                            case 4: cYear = "2021"; break;
                            case 5: cYear = "2022"; break;
                            case 6: cYear = "2023"; break;
                            case 7: cYear = "2024"; break;
                            case 8: cYear = "2025"; break;
                        }

                        string inputMonth = Request.Form["sbxMonth"];
                        int inputMonthInt = Convert.ToInt32(inputMonth);
                        string cMonth = "";

                        switch (inputMonthInt)
                        {
                            case 1: cMonth = "01"; break;
                            case 2: cMonth = "02"; break;
                            case 3: cMonth = "03"; break;
                            case 4: cMonth = "04"; break;
                            case 5: cMonth = "05"; break;
                            case 6: cMonth = "06"; break;
                            case 7: cMonth = "07"; break;
                            case 8: cMonth = "08"; break;
                            case 9: cMonth = "09"; break;
                            case 10: cMonth = "10"; break;
                            case 11: cMonth = "11"; break;
                            case 12: cMonth = "12"; break;
                        }
                        if (cardType == cType
                            && cardHolder == txtCardHolder.Text.Replace(" ","")
                            && year == cYear
                            && month == cMonth
                            && cvv == txtCVV.Text)
                        {
                            validate = true;

                        }
                        else
                        {
                            validate = false;
                        }
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Card number invalid");
                    }
                }
                catch (Exception ex)
                {
                    //if input boxes for login is empty
                }
            }
            return validate;
        }
            
    }
}