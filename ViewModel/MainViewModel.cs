using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyKhoHangCBNV.ViewModel
{
    public class MainViewModel
    {
        public bool isLoaded = false;
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand MeasureCommand { get; set; }
        public ICommand SupplierCommand { get; set; }
        public ICommand CustomerCommand { get; set; }
        public ICommand SupplyCommand { get; set; }
        public ICommand UserCommand { get; set; }
        public ICommand ImportCommand { get; set; }
        public ICommand ExportCommand { get; set; }


        public MainViewModel()
        {
            LoadedWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                isLoaded = true;

                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();
            }
            );

            MeasureCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                MeasureWindow measureWindow = new MeasureWindow();
                measureWindow.ShowDialog();
            });

            SupplierCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                SupplierWindow supplierWindow = new SupplierWindow();
                supplierWindow.ShowDialog();
            }
            );

            CustomerCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                CustomerWindow customerWindow = new CustomerWindow();
                customerWindow.ShowDialog();
            }
            );

            SupplyCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                SupplyWindow supplyWindow = new SupplyWindow();
                supplyWindow.ShowDialog();
            }
            );

            UserCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
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
    }
}
