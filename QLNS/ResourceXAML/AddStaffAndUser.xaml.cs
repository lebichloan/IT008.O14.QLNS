using QLNS.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for AddStaffAndUser.xaml
    /// </summary>
    public partial class AddStaffAndUser : Window
    {
        public AddStaffAndUser()
        {
            InitializeComponent();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
            {
                this.WindowState = WindowState.Normal;
            }
        }

        // Start: Button Close | Restore | Minimize 
        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnRestore_Click(object sender, RoutedEventArgs e)
        {
            if (WindowState == WindowState.Normal)
                WindowState = WindowState.Maximized;
            else
                WindowState = WindowState.Normal;
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            var NHANVIEN = new NHANVIEN()
            {
                TenNV = tenNV.Text,
                GioiTinh = gioiTinh.Text,
                DiaChi = diaChi.Text,
                SDT = sDT.Text,
                TinhTrang = 1,
                ChucVu = chucVu.Text,
                GhiChu = ghiChu.Text,
            };
            if (ngaySinh.SelectedDate.HasValue) // Not NULL
            {
                NHANVIEN.NgaySinh = ngaySinh.SelectedDate.Value;
            }
            if (ngayVL.SelectedDate.HasValue) // Not NULL
            {
                NHANVIEN.NgayVL = ngayVL.SelectedDate.Value;
            }
            else
            {
                NHANVIEN.NgayVL = DateTime.Now;
            }
            DataProvider.Ins.DB.NHANVIENs.Add(NHANVIEN);
            DataProvider.Ins.DB.SaveChanges();
            int lastEmployeeID = DataProvider.Ins.DB.NHANVIENs.Max(nv => nv.idNV);
            var NGUOIDUNG = new NGUOIDUNG()
            { 
                TenDN = taiKhoan.Text,
                MatKhau = matKhau.Text,
                NgayTao = DateTime.Now,
                TinhTrang = 1,
                idNV = lastEmployeeID
            };
            if (idLND.Text == "Quản lý")
                NGUOIDUNG.idLND = 1;
            else if (idLND.Text == "Thu ngân")
                NGUOIDUNG.idLND = 2;
            else
                NGUOIDUNG.idLND = 3;
            DataProvider.Ins.DB.NGUOIDUNGs.Add(NGUOIDUNG);
            DataProvider.Ins.DB.SaveChanges();
        }
    }
}
