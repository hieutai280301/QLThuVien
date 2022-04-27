using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace DAL
{
    public class TaiKhoanDGAccess_DG
    {
        public string CheckLogic_DG(TaiKhoanDG tkdg)
        {
            string info = CheckLogicDTO_DG(tkdg);
            return info;
        }

        private string CheckLogicDTO_DG(TaiKhoanDG tkdg)
        {
            throw new NotImplementedException();
        }
    }
}