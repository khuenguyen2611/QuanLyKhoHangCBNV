using QuanLyKhoHangCBNV.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace QuanLyKhoHangCBNV.ViewModel
{
    public class SupplierViewModel : BaseViewModel
    {
        private ObservableCollection<Supplier> _List;
        public ObservableCollection<Supplier> List { get { return _List; } set { _List = value; OnPropertyChanged(); } }

        private Supplier _SelectedItem;
        public Supplier SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value; OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    Phone = SelectedItem.Phone;
                    Email = SelectedItem.Email;
                    Address = SelectedItem.Address;
                    MoreInfo = SelectedItem.MoreInfo;
                    ContractDate = SelectedItem.ContractDate;
                }
            }
        }

        private string _DisplayName;
        public string DisplayName { get { return _DisplayName; } set { _DisplayName = value; OnPropertyChanged(); } }

        private string _Phone;
        public string Phone { get { return _Phone; } set { _Phone = value; OnPropertyChanged(); } }

        private string _Address;
        public string Address { get { return _Address; } set { _Address = value; OnPropertyChanged(); } }

        private string _Email;
        public string Email { get { return _Email; } set { _Email = value; OnPropertyChanged(); } }

        private string _MoreInfo;
        public string MoreInfo { get { return _MoreInfo; } set { _MoreInfo = value; OnPropertyChanged(); } }

        private DateTime? _ContractDate;
        public DateTime? ContractDate { get { return _ContractDate; } set { _ContractDate = value; OnPropertyChanged(); } }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public SupplierViewModel()
        {
            List = new ObservableCollection<Supplier>(DataProvider.Ins.DB.Suppliers);

            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName)) return false;

                var displayList = DataProvider.Ins.DB.Suppliers.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() != 0) return false;

                return true;
            }, (p) =>
            {
                var Supplier = new Supplier() { DisplayName = DisplayName, Phone = Phone, Address = Address, Email = Email, ContractDate = ContractDate, MoreInfo = MoreInfo };
                DataProvider.Ins.DB.Suppliers.Add(Supplier);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(Supplier);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Suppliers.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var Supplier = DataProvider.Ins.DB.Suppliers.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                Supplier.DisplayName = DisplayName;
                Supplier.Phone = Phone;
                Supplier.Address = Address;
                Supplier.Email = Email;
                Supplier.ContractDate = ContractDate;
                Supplier.MoreInfo = MoreInfo;
                DataProvider.Ins.DB.SaveChanges();
                
                //SelectedItem.DisplayName = DisplayName;
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Suppliers.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var Supplier = DataProvider.Ins.DB.Suppliers.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                Supplier.DisplayName = DisplayName;
                Supplier.Phone = Phone;
                Supplier.Address = Address;
                Supplier.Email = Email;
                Supplier.ContractDate = ContractDate;
                Supplier.MoreInfo = MoreInfo;
                DataProvider.Ins.DB.Suppliers.Remove(Supplier); 
                DataProvider.Ins.DB.SaveChanges();

                List.Remove(Supplier);
            });

        }
    }
}
