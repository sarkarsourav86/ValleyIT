using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;

namespace HotelDBApp
{
    class DBOperations
    {
        static String con_str = ConfigurationManager.ConnectionStrings["GraphicsDB"].ConnectionString;
    }
}
