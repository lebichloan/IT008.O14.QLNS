﻿using QLNS.Model;
using QLNS.ResourceXAML;
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
    public class LoginViewModel : BaseViewModel
    {
        //UserName
        private string _UserName;
        public string UserName { get { return _UserName; } set { _UserName = value; OnPropertyChanged(); } }
        // Password
        private string _Password;
        public string Password { get { return _Password; } set { _Password = value; OnPropertyChanged(); } }
        // Kiểm tra login
        public ICommand LoginCommand { get; set; }
        public ICommand PasswordChangedCommand { get; set; }

        public LoginViewModel()
        {
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

        public int idND = -1;
        public int isLogin = 0;
        void Login(Window p)
        {
            if (p == null)
                return;
            // Tim người dùng tương ứng bằng Dataprovider.Ins.DB
            var existingUser = DataProvider.Ins.DB.NGUOIDUNGs.SingleOrDefault(nguoidung => nguoidung.TenDN == UserName && nguoidung.MatKhau == Password);
            if (existingUser != null && existingUser.TinhTrang == 1)
            {
                idND = existingUser.idND;
                App.Current.Properties["idND_Sale"] = existingUser.idND;
                App.Current.Properties["idLND"] = existingUser.idLND;

                // Loại người dùng
                if (existingUser.idLND == 1)
                {
                    isLogin = 1;
                    MainQuanLy mainQuanLy = new MainQuanLy(idND, existingUser.idLND);
                    App.Current.Properties["isLogin"] = 1;
                    p.Close();
                    mainQuanLy.Show();
                }
                else if (existingUser.idLND == 2)
                {
                    isLogin = 1;
                    MainThuNgan mainThuNgan = new MainThuNgan(idND, existingUser.idLND);
                    App.Current.Properties["isLogin"] = 1;
                    p.Close();
                    mainThuNgan.Show();
                }
                else if (existingUser.idLND == 3)
                {
                    isLogin = 1;
                    MainNhanVienKho mainNhanVienKho = new MainNhanVienKho(idND, existingUser.idLND);
                    App.Current.Properties["isLogin"] = 1;
                    p.Close();
                    mainNhanVienKho.Show();
                }
            }
            else
            {
                Message message = new Message();
                message.message.Text = "Thông tin tài khoản hoặc mật khẩu không chính xác!";
                message.ShowDialog();
            }
        }
    }
}
