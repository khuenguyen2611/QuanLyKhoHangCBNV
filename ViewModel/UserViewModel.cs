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
    public class UserViewModel : BaseViewModel
    {
        private ObservableCollection<User> _List;
        public ObservableCollection<User> List { get { return _List; } set { _List = value; OnPropertyChanged(); } }

        private ObservableCollection<UserRole> _Role;
        public ObservableCollection<UserRole> Role { get { return _Role; } set { _Role = value; OnPropertyChanged(); } }

        private User _SelectedItem;
        public User SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value; OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    UserName = SelectedItem.UserName;
                    SelectedRole = SelectedItem.UserRole;
                }
            }
        }
        //DíplayName
        private string _DisplayName;
        public string DisplayName { get { return _DisplayName; } set { _DisplayName = value; OnPropertyChanged(); } }
        //UserName
        private string _UserName;
        public string UserName { get { return _UserName; } set { _UserName = value; OnPropertyChanged(); } }
        //Role
        private UserRole _SelectedRole;
        public UserRole SelectedRole { get { return _SelectedRole; } set { _SelectedRole = value; OnPropertyChanged(); } }


        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand ChangePasswordCommand { get; set; }

        public UserViewModel()
        {
            List = new ObservableCollection<User>(DataProvider.Ins.DB.Users);
            Role = new ObservableCollection<UserRole>(DataProvider.Ins.DB.UserRoles);

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                var User = new User() { DisplayName = DisplayName, UserName = UserName, IdRole = SelectedRole.Id, Password = "80432911e07b111f6a05fd7c904c1bc9" };
                DataProvider.Ins.DB.Users.Add(User);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(User);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Users.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var User = DataProvider.Ins.DB.Users.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                User.DisplayName = DisplayName;
                User.UserName = UserName;
                User.IdRole = SelectedRole.Id;
                DataProvider.Ins.DB.SaveChanges();

                //SelectedItem.DisplayName = DisplayName;
            });

            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null) return false;

                var displayList = DataProvider.Ins.DB.Users.Where(x => x.Id == SelectedItem.Id);
                if (displayList != null && displayList.Count() != 0) return true;

                return false;
            }, (p) =>
            {
                var User = DataProvider.Ins.DB.Users.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();
                User.DisplayName = DisplayName;
                DataProvider.Ins.DB.Users.Remove(User);
                DataProvider.Ins.DB.SaveChanges();

                List.Remove(User);
            });

            ChangePasswordCommand = new RelayCommand<object>((p) => { return true; }, (p) =>
            {
                ChangePassword changePasswordWindow = new ChangePassword();
                changePasswordWindow.ShowDialog();
            });
        }
    }
}
