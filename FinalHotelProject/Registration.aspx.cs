using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    
    public partial class Registration : System.Web.UI.Page
    {
        Hotel hotel;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void CollectHotelData()
        {
            hotel = new Hotel() {Brand=TxtPropName.Text, BrandName=TxtPropBrand.Text, City=TxtPropCity.Text, GeneralManager=TxtPropGm.Text,Country=HdnCountry.Value,State=HdnState.Value,Phone=TxtPhone.Text,Address_Line1=TxtAddress1.Text,Address_Line2=TxtAddress2.Text,Email=TxtPropEmail.Text, PostalCode=TxtPropZip.Text};
        }
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            CollectHotelData();
            int result=Hotel.RegisterHotel(hotel);
            if (result == 0)
            {
                //email already exists
            }
            else
            {
                //you are registered
            }
        }
    }
}