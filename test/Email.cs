using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDBApp
{
    public class Email
    {
        public String ToAddress { get; set; }
        public String CustName { get; set; }
        public String RoomNo { get; set; }
        public String ProblemType { get; set; }
        public String ProblemValue { get; set; }
        public String Comments { get; set; }
        public DateTime CheckoutDate { get; set; }
    }
}
