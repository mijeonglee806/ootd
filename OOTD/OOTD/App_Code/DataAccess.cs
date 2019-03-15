using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/*
 This class is used to connect to database
 */
namespace OOTD
{
    public static class DataAccess
    {
        private static string myConnectionString;
        static DataAccess()
        {
            myConnectionString = WebConfigurationManager.ConnectionStrings["myConnection"].ConnectionString;
        }

        public static DataTable SelectQuery(string query) // Reading data from database
        {
            //Query items from database
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(myConnectionString);

            connection.Open();
            SqlCommand cmd = new SqlCommand(query, connection);
            dt.Load(cmd.ExecuteReader());
            connection.Close();

            return dt;
        }

        /*
        public static DataTable InsertQuery(string query)
        {
            //Query items from database
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(myConnectionString);

            connection.Open();
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();

            return dt;
        }*/

    }
}