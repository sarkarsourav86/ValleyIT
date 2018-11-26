using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelDBApp
{
    public class UserProfile
    {
        public static int UpdateProfilePicture(byte[] image,string email)
        {
            SqlCommand cmd = new SqlCommand("spUpdateProfilePicture");
            cmd.Parameters.AddWithValue("@image",image);
            
            cmd.Parameters.AddWithValue("@emailid", email);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return DBOperations.UpdateOrInsert(cmd);
        }
        public static byte[] GetProfilePhotoById(string email)
        {
            SqlCommand cmd = new SqlCommand("spGetProfilePictureById");
            cmd.Parameters.AddWithValue("@email", email);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            return (byte[]) DBOperations.InsertAndReturn(cmd);

        }

    }
}
