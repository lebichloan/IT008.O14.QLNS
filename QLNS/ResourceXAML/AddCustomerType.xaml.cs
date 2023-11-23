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
    /// Interaction logic for AddCustomerType.xaml
    /// </summary>
    public partial class AddCustomerType : Window
    {
        private string _MaLKH;
        public string malkh { get => _MaLKH; set { _MaLKH = value; } }

        private string _TenLKH;
        public string tenlkh { get => _TenLKH; set { _TenLKH = value; } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; } }

        private int _DiemTLTT;
        public int diemtltt { get => _DiemTLTT; set { _DiemTLTT = value; } }

        public AddCustomerType()
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
            //malkh = maLKH.Text;
            tenlkh = tenLKH.Text;
            mota = moTa.Text;
            diemtltt = int.Parse(diemTLTT.Text);

            var LOAIKHACHHANG = new LOAIKHACHHANG()
            {
                //MaLKH = malkh,
                TenLKH = tenlkh,
                MoTa = mota,
                DiemTichLuyToiThieu = diemtltt,
            };

            DataProvider.Ins.DB.LOAIKHACHHANGs.Add(LOAIKHACHHANG);
            DataProvider.Ins.DB.SaveChanges();
        }

    }
}
