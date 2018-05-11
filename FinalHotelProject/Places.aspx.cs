using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelDBApp;

namespace FinalHotelProject
{
    public partial class Places : System.Web.UI.Page
    {
        Hotel hotel;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetLatLon();
        }
        private void SetHomeLink(String id)
        {
            HypHome.NavigateUrl = String.Format("/Login.aspx?hotelid={0}", id);
        }
        private void SetLatLon()
        {
            if(Session["Hotel"]!=null)
            {
                hotel = (Hotel)Session["Hotel"];
            }
            else
            {
                hotel = Hotel.GetHotel(GetId());
            }
            if(hotel!=null)
            {
                HdnLat.Value = hotel.LatLong.Split(',')[0].Trim();
                HdnLong.Value = hotel.LatLong.Split(',')[1].Trim();
                SetHomeLink(GetId());
            }
        }
        private String GetId()
        {
            return Request.QueryString["hotelid"] == null ? String.Empty : Request.QueryString["hotelid"];
        }
    }
}