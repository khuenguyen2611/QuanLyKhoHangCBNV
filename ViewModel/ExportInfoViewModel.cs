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
    public class ExportInfoViewModel : BaseViewModel
    {
        private ObservableCollection<ExportInfo> _List;
        public ObservableCollection<ExportInfo> List { get { return _List; } set { _List = value; OnPropertyChanged(); } }
        //Supply
        private ObservableCollection<Supply> _Supplies;
        public ObservableCollection<Supply> Supplies { get { return _Supplies; } set { _Supplies = value; OnPropertyChanged(); } }
        //Customer
        private ObservableCollection<Customer> _Customers;
        public ObservableCollection<Customer> Customers { get => _Customers; set { _Customers = value; OnPropertyChanged(); } }


        private ExportInfo _SelectedItem;
        public ExportInfo SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value; OnPropertyChanged();
                if (SelectedItem != null)
                {
                    Quantity = SelectedItem.Quantity;
                    ExportPrice = SelectedItem.ExportPrice;
                    Status = SelectedItem.Status;
                    SelectedSupply = SelectedItem.Supply;
                    SelectedExport = SelectedItem.Export;
                    SelectedCustomer = SelectedItem.Customer;
                    ExportDate = SelectedExport.DateExport;
                }
            }
        }

        //SelectedSupply
        private Supply _SelectedSupply;
        public Supply SelectedSupply { get => _SelectedSupply; set { _SelectedSupply = value; OnPropertyChanged(); } }
        //SelectedImport
        private Export _SelectedExport;
        public Export SelectedExport { get => _SelectedExport; set { _SelectedExport = value; OnPropertyChanged(); } }
        //SelectedCustomer
        private Customer _SelectedCustomer;
        public Customer SelectedCustomer { get => _SelectedCustomer; set { _SelectedCustomer = value; OnPropertyChanged(); } }
        //Quantity
        private Nullable<int> _Quantity;
        public Nullable<int> Quantity { get => _Quantity; set { _Quantity = value; OnPropertyChanged(); } }
        //ImportPrice
        private Nullable<double> _ExportPrice;
        public Nullable<double> ExportPrice { get => _ExportPrice; set { _ExportPrice = value; OnPropertyChanged(); } }
        //Status
        private string _Status;
        public string Status { get => _Status; set { _Status = value; OnPropertyChanged(); } }
        //DateExport
        private DateTime? _ExportDate;
        public DateTime? ExportDate { get => _ExportDate; set { _ExportDate = value; OnPropertyChanged(); } }


        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public ExportInfoViewModel()
        {
            List = new ObservableCollection<ExportInfo>(DataProvider.Ins.DB.ExportInfoes);
            Supplies = new ObservableCollection<Supply>(DataProvider.Ins.DB.Supplies);
            Customers = new ObservableCollection<Customer>(DataProvider.Ins.DB.Customers);

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                //Validate
                string SupplyCheck = SelectedSupply.Id;
                ObservableCollection<ImportInfo> LsImports = new ObservableCollection<ImportInfo>(DataProvider.Ins.DB.ImportInfoes.Where(x => x.IdSupply == SupplyCheck));
                int sumImport = 0;
                foreach (ImportInfo import in LsImports)
                {
                    sumImport += (int) import.Quantity;
                }
                if(sumImport < Quantity)
                {
                    MessageBox.Show("Do not enough quantity in stock!!!", "Wrong Quantity", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    string newIdExport = Guid.NewGuid().ToString();
                    var newExport = new Export() { Id = newIdExport, DateExport = ExportDate };
                    DataProvider.Ins.DB.Exports.Add(newExport);
                    DataProvider.Ins.DB.SaveChanges();
                    var ExportInfo = new ExportInfo() { Id = Guid.NewGuid().ToString(), Quantity = Quantity, Status = Status, IdSupply = SelectedSupply.Id, IdCustomer = SelectedCustomer.Id, IdExport = newIdExport, ExportPrice = ExportPrice };
                    DataProvider.Ins.DB.ExportInfoes.Add(ExportInfo);
                    DataProvider.Ins.DB.SaveChanges();

                    List.Add(ExportInfo);
                }
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.ExportInfoes.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                string SupplyCheck = SelectedSupply.Id;
                ObservableCollection<ImportInfo> LsImports = new ObservableCollection<ImportInfo>(DataProvider.Ins.DB.ImportInfoes.Where(x => x.IdSupply == SupplyCheck));
                int sumImport = 0;
                foreach (ImportInfo import in LsImports)
                {
                    sumImport += (int)import.Quantity;
                }
                if (sumImport < Quantity)
                {
                    MessageBox.Show("Do not enough quantity in stock!!!", "Wrong Quantity", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    var EditExport = DataProvider.Ins.DB.Exports.Where(x => x.Id == SelectedItem.Export.Id).SingleOrDefault();
                    var ExportInfo = DataProvider.Ins.DB.ExportInfoes.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                    EditExport.DateExport = ExportDate;
                    ExportInfo.IdSupply = SelectedSupply.Id;
                    ExportInfo.IdCustomer = SelectedCustomer.Id;
                    ExportInfo.Quantity = Quantity;
                    ExportInfo.ExportPrice = ExportPrice;
                    ExportInfo.Status = Status;

                    DataProvider.Ins.DB.SaveChanges();
                }
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.ExportInfoes.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                //var Import = DataProvider.Ins.DB.Imports.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                //DataProvider.Ins.DB.Imports.Remove(Import);
                //DataProvider.Ins.DB.SaveChanges();

                var DeleteExportInfoes = DataProvider.Ins.DB.ExportInfoes.Where(x => x.IdExport == SelectedItem.IdExport).SingleOrDefault();
                var DeleteExport = DataProvider.Ins.DB.Exports.Where(x => x.Id == SelectedItem.Export.Id).SingleOrDefault();
                DataProvider.Ins.DB.Exports.Remove(DeleteExport);
                DataProvider.Ins.DB.SaveChanges();

                List.Remove(DeleteExportInfoes);
            });

        }
    }
}
