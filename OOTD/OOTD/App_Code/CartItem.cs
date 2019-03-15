using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OOTD
{
    public class CartItem
    {
        //Get and Set method to retrieve data
        public int ID { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string Size { get; set; }
        public CartItem()
        {
        }
        public CartItem(int ID, string Name, string Image, string Descritpion, double Price, int Quantity, string Size)
        {
            this.ID = ID;
            this.Name = Name;
            this.Image = Image;
            this.Description = Description;
            this.Price = Price;
            this.Size = Size;

            //Quantity
            if (Quantity >= 1)
                this.Quantity = Quantity;
            else
                this.Quantity = 1;
        }
    }
}