using QLNS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QLNS.ViewModel
{
    public class LoginViewModel: BaseViewModel
    {
        //UserName
        private string _UserName;
        public string UserName
        {
            get
            {
                return _UserName;
            }
            set
            {
                _UserName = value;
                OnPropertyChanged();
            }
        }
        // Password
        private string _Password;
        public string Password
        {
            get
            {
                return _Password;
            }
            set
            {
                _Password = value;
                OnPropertyChanged();
            }
        }
        // kiem tra login
        public bool IsLogin { get; set; }
        public int IdWindowShow { get; set; }
        public ICommand LoginCommand { get; set; }
        public ICommand PasswordChangedCommand { get; set; }
        public LoginViewModel()
        {
            IsLogin = false;
            IdWindowShow = 0;
            Password = string.Empty;
            UserName = string.Empty;
            // Thực hiện chức năng đăng nhập thông qua relaycommand
            LoginCommand = new RelayCommand<Window>
                (
                (p) => { return true; }, // Can excute
                (p) => { Login(p); } // Excute
                );
            // Mã hóa Password
            PasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) => { Password = p.Password; });
        }
        void Login(Window p)
        {
            if (p == null)
                return;
            // Tim người dùng tương ứng bằng Dataprovider.Ins.DB
            var existingUser = DataProvider.Ins.DB.NGUOIDUNGs.SingleOrDefault(nguoidung => nguoidung.TenDN == UserName && nguoidung.MatKhau == Password);
            if (existingUser != null)
            {
                IsLogin = true;
                // Loại người dùng
                if (existingUser.idLND == 1)
                    IdWindowShow = 1;
                else if (existingUser.idLND == 2)
                    IdWindowShow = 2;
                else if (existingUser.idLND == 3)
                    IdWindowShow = 3;
                p.Close();
            }
            else
            {
                IsLogin = false;
                MessageBox.Show("Thông tin tài khoản hoặc mật khẩu không chính xác");
            }
        }
    }
}
