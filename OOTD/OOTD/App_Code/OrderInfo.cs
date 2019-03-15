using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OOTD
{
    public class OrderInfo
    {
        //Get and Set method to retrieve data
        public string FName { get; set; }
        public string LName { get; set; }
        public string Address { get; set; }
        public string ZIP { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PhoneNumber { get; set; }
        public OrderInfo()
        {
               //
        }
        public OrderInfo(string FName, string LName, string Address, string ZIP, string City, string Province, string PhoneNumber)
        {
            this.FName = FName;
            this.LName = LName;
            this.Address = Address;
            this.ZIP = ZIP;
            this.City = City;
            this.Province = Province;
            this.PhoneNumber = PhoneNumber;
        }
    }
}