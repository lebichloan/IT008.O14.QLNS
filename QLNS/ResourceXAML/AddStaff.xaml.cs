using QLNS.Model;
using QLNS.ViewModel;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for AddStaff.xaml
    /// </summary>
    /// 
    public partial class AddStaff : Window
    {
        private string _TenNV;
        public string tennv { get => _TenNV; set { _TenNV = value;} }

        private string _DiaChi;
        public string diachi { get => _DiaChi; set { _DiaChi = value; } }

        private string _SDT;
        public string sdt { get => _SDT; set { _SDT = value; } }

        private string _GioiTinh;
        public string gioitinh { get => _GioiTinh; set { _GioiTinh = value; } }

        private string _ChucVu;
        public string chucvu { get => _ChucVu; set { _ChucVu = value; } }

        private int _TinhTrang;
        public int tinhtrang { get => _TinhTrang; set { _TinhTrang = value; } }

        private string _GhiChu;
        public string ghichu { get => _GhiChu; set { _GhiChu = value; } }

        private DateTime? _NgaySinh;
        public DateTime? ngaysinh { get => _NgaySinh; set => _NgaySinh = value; }

        private DateTime? _NgayVL;
        public DateTime? ngayvl { get => _NgayVL; set => _NgayVL = value; }
        public AddStaff()
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


        // End: Button Close | Restore | Minimize
        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            tennv = tenNV.Text;
            gioitinh = gioiTinh.Text;
            diachi = diaChi.Text;
            sdt = sDT.Text;
            chucvu = chucVu.Text;
            ghichu = ghiChu.Text;
            tinhtrang = int.Parse(tinhTrang.Text);
            ngaysinh = ngaySinh.SelectedDate;
            ngayvl = ngayVL.SelectedDate;

            var NHANVIEN = new NHANVIEN()
            {
                TenNV = tennv,
                GioiTinh = gioitinh,
                DiaChi = diachi,
                SDT = sdt,
                ChucVu = chucvu,
                GhiChu = ghichu,
                TinhTrang = tinhtrang,
            };

            if (ngaysinh.HasValue)
            {
                NHANVIEN.NgaySinh = ngaysinh.Value;
            }

            if (ngayvl.HasValue)
            {
                NHANVIEN.NgayVL = ngayvl.Value;
            }
            MessageBox.Show($"{NHANVIEN.TenNV}, {NHANVIEN.NgaySinh}, {NHANVIEN.GioiTinh}, {NHANVIEN.DiaChi}, {NHANVIEN.SDT}, {NHANVIEN.NgayVL}, {NHANVIEN.ChucVu}, {NHANVIEN.TinhTrang}, {NHANVIEN.GhiChu}");
        }
    }
}
