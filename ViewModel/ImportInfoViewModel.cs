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
    public class ImportInfoViewModel : BaseViewModel
    {
        private ObservableCollection<ImportInfo> _List;
        public ObservableCollection<ImportInfo> List { get { return _List; } set { _List = value; OnPropertyChanged(); } }
        //Supply
        private ObservableCollection<Supply> _Supplies;
        public ObservableCollection<Supply> Supplies { get { return _Supplies; } set { _Supplies = value; OnPropertyChanged(); } }

       
        private ImportInfo _SelectedItem;
        public ImportInfo SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value; OnPropertyChanged();
                if (SelectedItem != null)
                {
                    Quantity = SelectedItem.Quantity;
                    ImportPrice = SelectedItem.ImportPrice;
                    Status = SelectedItem.Status;
                    SelectedSupply = SelectedItem.Supply;
                    SelectedImport = SelectedItem.Import;
                    DateImport = SelectedImport.DateImport;
                }
            }
        }

        //SelectedSupply
        private Supply _SelectedSupply;
        public Supply SelectedSupply { get => _SelectedSupply; set { _SelectedSupply = value; OnPropertyChanged(); } }
        //SelectedImport
        private Import _SelectedImport;
        public Import SelectedImport { get => _SelectedImport; set { _SelectedImport = value; OnPropertyChanged(); } }
        //Quantity
        private Nullable<int> _Quantity;
        public Nullable<int> Quantity { get => _Quantity; set { _Quantity = value; OnPropertyChanged(); } }
        //ImportPrice
        private Nullable<double> _ImportPrice;
        public Nullable<double> ImportPrice { get => _ImportPrice; set { _ImportPrice = value; OnPropertyChanged(); } }
        //Status
        private string _Status;
        public string Status { get => _Status; set { _Status = value; OnPropertyChanged(); } }
        //DateImport
        private DateTime? _DateImport;
        public DateTime? DateImport { get => _DateImport; set { _DateImport = value; OnPropertyChanged(); } }
        

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public ImportInfoViewModel()
        {
            List = new ObservableCollection<ImportInfo>(DataProvider.Ins.DB.ImportInfoes);
            Supplies = new ObservableCollection<Supply>(DataProvider.Ins.DB.Supplies);

            AddCommand = new RelayCommand<object>((p) =>
            { 
                return true;
            }, (p) =>
            {
                string newIdImport = Guid.NewGuid().ToString();
                var newImport = new Import() { Id = newIdImport, DateImport = DateImport };
                DataProvider.Ins.DB.Imports.Add(newImport);
                DataProvider.Ins.DB.SaveChanges();
                var ImportInfo = new ImportInfo() { Id = Guid.NewGuid().ToString(), Quantity = Quantity, ImportPrice = ImportPrice, Status = Status, IdImport = newIdImport, IdSupply = SelectedSupply.Id };
                DataProvider.Ins.DB.ImportInfoes.Add(ImportInfo);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(ImportInfo);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.ImportInfoes.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var EditImport = DataProvider.Ins.DB.Imports.Where(x => x.Id == SelectedItem.Import.Id).SingleOrDefault();
                var EditImportInfo = DataProvider.Ins.DB.ImportInfoes.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                EditImport.DateImport = DateImport;
                EditImportInfo.IdSupply = SelectedSupply.Id;
                EditImportInfo.Quantity = Quantity;
                EditImportInfo.ImportPrice = ImportPrice;
                EditImportInfo.Status = Status;
                
                DataProvider.Ins.DB.SaveChanges();
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.ImportInfoes.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                //var Import = DataProvider.Ins.DB.Imports.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                //DataProvider.Ins.DB.Imports.Remove(Import);
                //DataProvider.Ins.DB.SaveChanges();
                var DeleteImportInfoes = DataProvider.Ins.DB.ImportInfoes.Where(x => x.IdImport == SelectedItem.IdImport).SingleOrDefault();
                var DeleteImport = DataProvider.Ins.DB.Imports.Where(x => x.Id == SelectedItem.Import.Id).SingleOrDefault();
                DataProvider.Ins.DB.Imports.Remove(DeleteImport);
                DataProvider.Ins.DB.SaveChanges();

                List.Remove(DeleteImportInfoes);

                //List.Remove(Import);
            });

        }
    }
}
