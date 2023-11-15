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
    public class LoginViewModel: BaseViewModel
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

        void Login(Window p)
        {
            if (p == null)
                return;
            // Tim người dùng tương ứng bằng Dataprovider.Ins.DB
            var existingUser = DataProvider.Ins.DB.NGUOIDUNGs.SingleOrDefault(nguoidung => nguoidung.TenDN == UserName && nguoidung.MatKhau == Password);
            if (existingUser != null && existingUser.TinhTrang == 1)
            {
                
                // Loại người dùng
                if (existingUser.idLND == 1 )
                {
                    MainQuanLy mainQuanLy = new MainQuanLy();
                    p.Close();
                    mainQuanLy.ShowDialog();
                }
                else if (existingUser.idLND == 2 )
                {
                    MainThuNgan mainThuNgan = new MainThuNgan();
                    p.Close();
                    mainThuNgan.ShowDialog();
                }
                else if (existingUser.idLND == 3 )
                {
                    MainNhanVienKho mainNhanVienKho = new MainNhanVienKho();
                    p.Close();
                    mainNhanVienKho.ShowDialog();
                }  
            }
            else
            {
                MessageBox.Show("Thông tin tài khoản hoặc mật khẩu không chính xác");
            }
        }
    }
}
