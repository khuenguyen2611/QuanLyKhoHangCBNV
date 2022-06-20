using QuanLyKhoHangCBNV.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKhoHangCBNV.Model
{
    public class Warehouse : BaseViewModel
    {
        private Supply _Supply;
        public Supply Supply { get => _Supply; set { _Supply = value; OnPropertyChanged(); } }
        private int _No;
        public int No { get => _No; set { _No = value; OnPropertyChanged(); } }
        private int _Count;
        public int Count { get => _Count; set { _Count = value; OnPropertyChanged(); } }
    }
}
