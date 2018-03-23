using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HotelDBApp;

namespace HotelBusinessLayer
{
    public class Utilities
    {
        public static Boolean HasUserCheckedIn(Object session)
        {
            return session != null;
        }
    }
}
