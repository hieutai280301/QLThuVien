using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BLL
{
    public class TaiKhoanDG_BLL
    {
        TaiKhoanDGAccess tkdgAcess = new TaiKhoanDGAccess();
        public string CheckLogic_DG(TaiKhoanDG tkdg)
        {
            //Kiem tra nghiep vu
            if (tkdg.TK == "")
            {
                return "requeid_taikhoan";
            }
            if (tkdg.MK == "")
            {
                return "requeid_password";
            }
            string info = tkdgAcess.CheckLogic_DG(tkdg);
            return info;
        }
    }
}