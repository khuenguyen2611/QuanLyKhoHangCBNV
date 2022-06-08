using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKhoHangCBNV.Model
{
    public class DataProvider
    {
        void Demo()
        {
            QuanLyKhoHangEntities db = new QuanLyKhoHangEntities();
            db.Supplies.ToList();
        }
    }
}
