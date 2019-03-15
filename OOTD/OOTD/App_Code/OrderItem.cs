using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OOTD
{
    public class OrderItem
    {
        //Get and Set method to retrieve data
        public string UserID { get; set; }
        public string ProductName { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string Size { get; set; }

        public OrderItem()
        {
        }
        public OrderItem(string UserID, string Name, double Price, int Quantity, string Size)
        {
            this.UserID = UserID;
            this.ProductName = Name;
            this.Price = Price;
            this.Quantity = Quantity;
            this.Size = Size;

        }
    }
}