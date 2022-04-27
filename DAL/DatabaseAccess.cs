using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data;

namespace DAL
{
    public class SqlConnectionData
    {
        //Tao chuoi ket noi CSDL
        public static SqlConnection Connect()
        {
            string strcon = @"Data Source=DESKTOP-AI6EGS6\HIEUTAI;Initial Catalog=QLTHUVIEN;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strcon); //Khoi tao connection
            return conn;
        }
    }

    public class DatabaseAccess_NV
    {
        public static string CheckLogicDTO_NV(TaiKhoanNV tknv)
        {
            string TK = null;
            //Ham connect toi CSDl
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("proc_logic_nv", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@TK", tknv.TK);
            command.Parameters.AddWithValue("@MK", tknv.MK);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TK = reader.GetString(0);
                    return TK;
                }
                reader.Close();
                conn.Close();
            }
            else
            {
                return "Tài khoản hoặc mật khẩu không chính xác!";
            }

            return TK;
        }


    }

    public class DatabaseAccess_DG
    {
        public static string CheckLogicDTO_DG(TaiKhoanDG tkdg)
        {
            string TK = null;
            //Ham connect toi CSDl
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("proc_logic_dg", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@TK", tkdg.TK);
            command.Parameters.AddWithValue("@MK", tkdg.MK);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    TK = reader.GetString(0);
                    return TK;
                }
                reader.Close();
                conn.Close();
            }
            else
            {
                return "Tài khoản hoặc mật khẩu không chính xác!";
            }

            return TK;
        }
    }
}
