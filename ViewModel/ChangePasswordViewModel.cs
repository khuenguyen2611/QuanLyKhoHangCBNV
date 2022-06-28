using QuanLyKhoHangCBNV.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyKhoHangCBNV.ViewModel
{
    public class ChangePasswordViewModel : BaseViewModel
    {
        //UserName
        private string _username;
        public string Username { get { return _username; } set { _username = value; OnPropertyChanged(); } }
        //Password
        private string _password;
        public string Password { get { return _password; } set { _password = value; OnPropertyChanged(); } }
        //NewPassword
        private string _newPassword;
        public string NewPassword { get { return _newPassword; } set { _newPassword = value; OnPropertyChanged(); } }
        //ConfirmPassword
        private string _confirmPassword;
        public string ConfirmPassword { get { return _confirmPassword; } set { _confirmPassword = value; OnPropertyChanged(); } }

        public ICommand ChangePasswordCommand { get; set; }
        public ICommand OldPasswordChangedCommand { get; set; }
        public ICommand NewPasswordChangedCommand { get; set; }
        public ICommand ConfirmPasswordChangedCommand { get; set; }
        public ICommand CloseCommand { get; set; }

        public ChangePasswordViewModel()
        {
            Username = "";
            Password = "";
            NewPassword = "";
            ConfirmPassword = "";
            ChangePasswordCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                ChangePassword(p);
            });

            CloseCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                p.Close();
            });

            OldPasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) =>
            {
                Password = p.Password;
            });

            NewPasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) =>
            {
                NewPassword = p.Password;
            });

            ConfirmPasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) =>
            {
                ConfirmPassword = p.Password;
            });
        }

        void ChangePassword(Window p)
        {
            if (p == null) return;

            string passEncoded = MD5Hash(Base64Encode(Password));
            var accountC = DataProvider.Ins.DB.Users.Where(x => x.UserName == Username && x.Password == passEncoded).Count();
            var account = DataProvider.Ins.DB.Users.Where(x => x.UserName == Username && x.Password == passEncoded).SingleOrDefault();
            if (accountC > 0)
            {
                if(NewPassword == ConfirmPassword)
                {
                    string newPassEncoded = MD5Hash(Base64Encode(NewPassword));
                    account.Password = newPassEncoded;
                    DataProvider.Ins.DB.SaveChanges();
                    MessageBox.Show("Password Change Successfully");
                    p.Close();
                }
                else
                {
                    MessageBox.Show("New Password and Confirm Password is not match", "Password Conflict", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Username or old password are wrong !!!", "Password Conflict", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }
    }
}
