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
    public class MeasureViewModel : BaseViewModel
    {
        private ObservableCollection<Measure> _List;
        public ObservableCollection<Measure> List { get { return _List; } set { _List = value; OnPropertyChanged(); } }

        private Measure _SelectedItem;
        public Measure SelectedItem { get { return _SelectedItem; } 
            set { 
                _SelectedItem = value; OnPropertyChanged(); 
                if (SelectedItem != null) { 
                    DisplayName = SelectedItem.DisplayName; 
                } 
            } 
        }

        private string _DisplayName;
        public string DisplayName { get { return _DisplayName; } set { _DisplayName = value; OnPropertyChanged(); } }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public MeasureViewModel()
        {
            List = new ObservableCollection<Measure>(DataProvider.Ins.DB.Measures);

            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName)) return false;

                var displayList = DataProvider.Ins.DB.Measures.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() != 0) return false;

                return true;
            }, (p) =>
            {
                var measure = new Measure() { DisplayName = DisplayName };
                DataProvider.Ins.DB.Measures.Add(measure);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(measure);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName) || SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Measures.Where(x => x.DisplayName == DisplayName);
                if (displayList == null || displayList.Count() != 0) return false;

                return true;
            }, (p) =>
            {
                var measure = DataProvider.Ins.DB.Measures.Where(x=>x.Id == SelectedItem.Id).SingleOrDefault();
                measure.DisplayName = DisplayName;
                DataProvider.Ins.DB.SaveChanges();
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(DisplayName)) return false;
                return true;
            }, (p) =>
            {
                var measure = DataProvider.Ins.DB.Measures.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                DataProvider.Ins.DB.Measures.Remove(measure);
                DataProvider.Ins.DB.SaveChanges();
                List.Remove(measure);
            });

        }
    }
}
