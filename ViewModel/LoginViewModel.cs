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
    public class LoginViewModel : BaseViewModel
    {
        public bool IsLoggedIn { get; set; }
        private string _username;
        public string Username { get { return _username; } set { _username = value;OnPropertyChanged(); } }
        private string _password;
        public string Password { get { return _password; } set { _password = value;OnPropertyChanged(); } }

        public ICommand LoginCommand { get; set; }
        public ICommand PasswordChangedCommand { get; set; }
        public ICommand CloseCommand { get; set; }

        public LoginViewModel()
        {
            IsLoggedIn = false;
            Username = "";
            Password = "";
            LoginCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                Login(p);
            });

            CloseCommand = new RelayCommand<Window>((p) => { return true; }, (p) =>
            {
                p.Close();
            });

            PasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) =>
            {
                Password = p.Password;
            });
        }

        void Login(Window p)
        {
            if (p == null) return;

            string passEncoded = MD5Hash(Base64Encode(Password));
            var account = DataProvider.Ins.DB.Users.Where(x=>x.UserName == Username && x.Password == passEncoded).Count();
            if(account > 0)
            {
                IsLoggedIn = true;
                p.Close();
            }
            else
            {
                IsLoggedIn=false;
                MessageBox.Show("Username or password are wrong !!!");
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
