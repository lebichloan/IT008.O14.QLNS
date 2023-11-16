using QLNS.Model;
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
    /// Interaction logic for AddCustomer.xaml
    /// </summary>
    public partial class AddCustomer : Window
    {
        private string _MaKH;
        public string makh { get => makh; set { makh = value; } }

        private string _TenKH;
        public string tenkh { get => _TenKH; set { _TenKH = value; } }

        private DateTime? _NgaySinh;
        public DateTime? ngaysinh { get => _NgaySinh; set => _NgaySinh = value; }

        private string _DiaChi;
        public string diachi { get => _DiaChi; set { _DiaChi = value; } }

        private string _SDT;
        public string sdt { get => _SDT; set { _SDT = value; } }

        private string _GioiTinh;
        public string gioitinh { get => _GioiTinh; set { _GioiTinh = value; } }

        private DateTime? _NgayTG;
        public DateTime? ngaytg { get => ngaytg; set => ngaytg = value; }

        private int _DiemTichLuy;
        public int diemtl { get => diemtl; set { diemtl = value; } }

        private int _LoaiKH;
        public int loaikh { get => loaikh; set { loaikh = value; } }

        public AddCustomer()
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
            makh = maKH.Text;
            tenkh = tenKH.Text;
            gioitinh = gioiTinh.Text;
            diachi = diaChi.Text;
            sdt = sDT.Text;
            loaikh = int.Parse(loaiKH.Text);
            if (diemTL.Text == string.Empty)
            {
                diemtl = 0;
            }
            else
            {
                diemtl = int.Parse(diemTL.Text);
            }
            ngaysinh = ngaySinh.SelectedDate;
            ngaytg = ngayTG.SelectedDate;

            var KHACHHANG = new KHACHHANG()
            {
                MaKH = makh,
                TenKH = tenkh,
                GioiTinh = gioitinh,
                DiemTichLuy = diemtl,
                idLKH = loaikh,
            };

            if (ngaysinh.HasValue)
            {
                KHACHHANG.NgaySinh = ngaysinh.Value;
            }
            if (ngaytg.HasValue)
            {
                KHACHHANG.NgayTG = ngaytg.Value;
            }
            if (diachi != "")
            {
                KHACHHANG.DiaChi = diachi;
            }
            if (sdt != "")
            {
                KHACHHANG.SDT = sdt;
            }
            DataProvider.Ins.DB.KHACHHANGs.Add(KHACHHANG);
            DataProvider.Ins.DB.SaveChanges();
        }
    }
    // End: Button Close | Restore | Minimize
}

