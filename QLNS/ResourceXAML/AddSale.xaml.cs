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
    /// Interaction logic for AddSale.xaml
    /// </summary>
    public partial class AddSale : Window
    {
        private string _MaKM;
        public string makm { get => _MaKM; set { _MaKM = value; } }

        private string _TenKM;
        public string tenkm { get => _TenKM; set { _TenKM = value; } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; } }

        private int _LoaiKH;
        public int loaikh { get => _LoaiKH; set { _LoaiKH = value; } }

        private DateTime _NgayBatDau;
        public DateTime ngaybd { get => _NgayBatDau; set => _NgayBatDau = value; }

        private DateTime _NgayKetThuc;
        public DateTime ngaykt { get => _NgayKetThuc; set => _NgayKetThuc = value; }

        private short _GiamGia;
        public short giamgia { get => _GiamGia; set { _GiamGia = value; } }

        private int _LoaiND;
        public int loaind { get => _LoaiND; set { _LoaiND = value; } }

        public AddSale()
        {
            InitializeComponent();
            Binding_LoaiKH();
        }

        public List<LOAIKHACHHANG> lkh { get; set; }
        private void Binding_LoaiKH()
        {
            QLNSEntities qLNS = new QLNSEntities();
            var item = qLNS.LOAIKHACHHANGs.ToList();
            lkh = item;
            DataContext = lkh;
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
            //makm = maKM.Text;
            tenkm = tenKM.Text;
            mota = moTa.Text;
            loaikh = int.Parse(loaiKH.Text);
            ngaybd = (DateTime)ngayBatDau.SelectedDate;
            ngaykt = (DateTime)ngayKetThuc.SelectedDate;
            giamgia = short.Parse(giamGia.Text);
            //loaind = int.Parse(loaiND.Text);

            var KHUYENMAI = new KHUYENMAI()
            {
                //MaKM = makm,
                TenKM = tenkm,
                MoTa = mota,
                idLKH = loaikh,
                NgayBD = ngaybd,
                NgayKT = ngaykt,
                GiamGia = giamgia,
                //idND = loaind,
            };

            DataProvider.Ins.DB.KHUYENMAIs.Add(KHUYENMAI);
            DataProvider.Ins.DB.SaveChanges();
        }

    }
}
