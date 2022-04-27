using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAL
{
    public class TaiKhoanNVAccess : DatabaseAccess_NV
    {
        public string CheckLogic_NV(TaiKhoanNV tknv)
        {
            string info = CheckLogicDTO_NV(tknv);
            return info;
        }
    }
}