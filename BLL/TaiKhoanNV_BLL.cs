using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using DAL;

namespace BLL
{
    public class TaiKhoanNV_BLL
    {
        TaiKhoanNVAccess tknv = new TaiKhoanNVAccess();
        public string CheckLogic_NV(TaiKhoanNV tknv)
        {
            //Kiem tra nghiep vu
            if (tknv.TK == "")
            {
                return "requeid_taikhoan";
            }
            if (tknv.MK == "")
            {
                return "requeid_password";
            }
            string info = tknv.CheckLogic_NV(tknv);
            return info;
        }
    }
}