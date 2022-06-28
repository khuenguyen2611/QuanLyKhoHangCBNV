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
    public class MainViewModel : BaseViewModel
    {
        private ObservableCollection<Warehouse> _WarehouseList;
        public ObservableCollection<Warehouse> WarehouseList { get { return _WarehouseList; } set { _WarehouseList = value; OnPropertyChanged(); } }
        public bool isLoaded = false;

        int sumCardImport = 0;
        public int SumCardImport { get { return sumCardImport; } set { sumCardImport = value; OnPropertyChanged(); } }

        int sumCardExport = 0;
        public int SumCardExport { get { return sumCardExport; } set { sumCardExport = value; OnPropertyChanged(); } }

        int sumCardStore = 0;
        public int SumCardStore { get => sumCardStore; set { sumCardStore = value; OnPropertyChanged(); } }
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand LoadedWareHouseCommand { get; set; }
        public ICommand MeasureCommand { get; set; }
        public ICommand SupplierCommand { get; set; }
        public ICommand CustomerCommand { get; set; }
        public ICommand SupplyCommand { get; set; }
        public ICommand UserCommand { get; set; }
        public ICommand ImportCommand { get; set; }
        public ICommand ExportCommand { get; set; }


        public MainViewModel()
        {
            int idRole = 0;

            LoadedWindowCommand = new RelayCommand<Window>((p) => { return true; }, (p) => {
                isLoaded = true;
                if (p == null) return;

                p.Hide();
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();

                if (loginWindow.DataContext == null) return;
                
                var loginVM = loginWindow.DataContext as LoginViewModel;

                string usernameLogged = loginVM.Username;
                var userLogged = DataProvider.Ins.DB.Users.Where(x => x.UserName == usernameLogged).SingleOrDefault();

                if (loginVM.IsLoggedIn)
                {
                    p.Show();
                    idRole = userLogged.IdRole;
                    LoadWareHouseData();
                }
                else
                {
                    p.Close();
                }
            }
            );

            LoadedWareHouseCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                RefreshWHData();
            });

            MeasureCommand = new RelayCommand<object>((p) => {
                if (idRole == 1) return true;
                return false;
            }, (p) =>
            {
                MeasureWindow measureWindow = new MeasureWindow();
                measureWindow.ShowDialog();
            });

            SupplierCommand = new RelayCommand<object>((p) => {
                if (idRole == 1) return true;
                return false;
            }, (p) => {
                SupplierWindow supplierWindow = new SupplierWindow();
                supplierWindow.ShowDialog();
            }
            );

            CustomerCommand = new RelayCommand<object>((p) => {
                if (idRole == 1) return true;
                return false;
            }, (p) => {
                CustomerWindow customerWindow = new CustomerWindow();
                customerWindow.ShowDialog();
            }
            );

            SupplyCommand = new RelayCommand<object>((p) => {
                if (idRole == 1) return true;
                return false;
            }, (p) => {
                SupplyWindow supplyWindow = new SupplyWindow();
                supplyWindow.ShowDialog();
            }
            );

            UserCommand = new RelayCommand<object>((p) => {
                if(idRole == 1) return true;
                return false;
            }, (p) => {
                UserWindow userWindow = new UserWindow();
                userWindow.ShowDialog();
            }
            );

            ImportCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                ImportWindow importWindow = new ImportWindow();
                importWindow.ShowDialog();
            }
            );

            ExportCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                ExportWindow exportWindow = new ExportWindow();
                exportWindow.ShowDialog();
            }
            );
        }

        void LoadWareHouseData()
        {
            WarehouseList = new ObservableCollection<Warehouse>();

            var SupplyList = DataProvider.Ins.DB.Supplies;

            int i = 1;

            foreach (var Supply in SupplyList)
            {
                var importList = DataProvider.Ins.DB.ImportInfoes.Where(p => p.IdSupply == Supply.Id);
                var exportList = DataProvider.Ins.DB.ExportInfoes.Where(p => p.IdSupply == Supply.Id);

                int sumImport = 0;
                int sumExport = 0;

                if(importList != null && importList.Count() > 0)
                {
                    sumImport = (int) importList.Sum(p=>p.Quantity);
                    SumCardImport += sumImport;
                }

                if(exportList != null && exportList.Count() > 0)
                {
                    sumExport = (int) exportList.Sum(p=>p.Quantity);
                    SumCardExport += sumExport;
                }

                Warehouse warehouse = new Warehouse();
                warehouse.No = i;
                warehouse.Count = sumImport - sumExport;
                warehouse.Supply = Supply;

                WarehouseList.Add(warehouse);

                i++;
            }
            SumCardStore = SumCardImport - SumCardExport;
        }

        void RefreshWHData()
        {
            WarehouseList = new ObservableCollection<Warehouse>();

            var SupplyList = DataProvider.Ins.DB.Supplies;

            int i = 1;
            SumCardImport = 0;
            SumCardExport = 0;
            SumCardStore = 0;

            foreach (var Supply in SupplyList)
            {
                var importList = DataProvider.Ins.DB.ImportInfoes.Where(p => p.IdSupply == Supply.Id);
                var exportList = DataProvider.Ins.DB.ExportInfoes.Where(p => p.IdSupply == Supply.Id);

                int sumImport = 0;
                int sumExport = 0;

                if (importList != null && importList.Count() > 0)
                {
                    sumImport = (int)importList.Sum(p => p.Quantity);
                    SumCardImport += sumImport;
                }

                if (exportList != null && exportList.Count() > 0)
                {
                    sumExport = (int)exportList.Sum(p => p.Quantity);
                    SumCardExport += sumExport;
                }

                Warehouse warehouse = new Warehouse();
                warehouse.No = i;
                warehouse.Count = sumImport - sumExport;
                warehouse.Supply = Supply;

                WarehouseList.Add(warehouse);

                i++;
            }
            SumCardStore = SumCardImport - SumCardExport;
        }
    }
}
