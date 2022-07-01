using QuanLyKhoHangCBNV.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyKhoHangCBNV.ViewModel
{
    public class SupplyViewModel : BaseViewModel
    {
        private ObservableCollection<Supply> _List;
        public ObservableCollection<Supply> List { get { return _List; } set { _List = value; OnPropertyChanged(); } }
        //Measure
        private ObservableCollection<Measure> _Measures;
        public ObservableCollection<Measure> Measures { get { return _Measures; } set { _Measures = value; OnPropertyChanged(); } }
        //Supplier
        private ObservableCollection<Supplier> _Suppliers;
        public ObservableCollection<Supplier> Suppliers { get { return _Suppliers; } set { _Suppliers = value; OnPropertyChanged(); } }


        private Supply _SelectedItem;
        public Supply SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value; OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    QRCode = SelectedItem.QRCode;
                    BarCode = SelectedItem.BarCode;
                    SelectedMeasure = SelectedItem.Measure;
                    SelectedSupplier = SelectedItem.Supplier;
                }
            }
        }
        //SelectedMeasure
        private Measure _SelectedMeasure;
        public Measure SelectedMeasure { get { return _SelectedMeasure; } set { _SelectedMeasure = value; OnPropertyChanged(); } }
        //SelectedSupplier
        private Supplier _SelectedSupplier;
        public Supplier SelectedSupplier { get { return _SelectedSupplier; } set { _SelectedSupplier = value; OnPropertyChanged(); } }

        private string _DisplayName;
        public string DisplayName { get { return _DisplayName; } set { _DisplayName = value; OnPropertyChanged(); } }

        private string _QRCode;
        public string QRCode { get { return _QRCode; } set { _QRCode = value; OnPropertyChanged(); } }

        private string _BarCode;
        public string BarCode { get { return _BarCode; } set { _BarCode = value; OnPropertyChanged(); } }

        private string _Email;
        public string Email { get { return _Email; } set { _Email = value; OnPropertyChanged(); } }

        private string _MoreInfo;
        public string MoreInfo { get { return _MoreInfo; } set { _MoreInfo = value; OnPropertyChanged(); } }

        private DateTime? _ContractDate;
        public DateTime? ContractDate { get { return _ContractDate; } set { _ContractDate = value; OnPropertyChanged(); } }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand LoadedWindowCommand { get; set; }

        public SupplyViewModel()
        {
            List = new ObservableCollection<Supply>(DataProvider.Ins.DB.Supplies);
            

            AddCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedSupplier == null || SelectedMeasure == null) return false;
                return true;
            }, (p) =>
            {
                var Supply = new Supply() {Id = Guid.NewGuid().ToString(), DisplayName = DisplayName, BarCode = BarCode, QRCode = QRCode, IdSupplier = SelectedSupplier.Id, IdMeasure = SelectedMeasure.Id};
                DataProvider.Ins.DB.Supplies.Add(Supply);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(Supply);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Supplies.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var Supply = DataProvider.Ins.DB.Supplies.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                Supply.DisplayName = DisplayName;
                Supply.BarCode = BarCode;
                Supply.QRCode = QRCode;
                Supply.IdSupplier = SelectedSupplier.Id;
                Supply.IdMeasure = SelectedMeasure.Id;
                DataProvider.Ins.DB.SaveChanges();
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Supplies.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var Supply = DataProvider.Ins.DB.Supplies.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                DataProvider.Ins.DB.Supplies.Remove(Supply);
                DataProvider.Ins.DB.SaveChanges();

                List.Remove(Supply);
            });

            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) => {
                Measures = new ObservableCollection<Measure>(DataProvider.Ins.DB.Measures);
                Suppliers = new ObservableCollection<Supplier>(DataProvider.Ins.DB.Suppliers);
            }
            );
        }
    }
}
