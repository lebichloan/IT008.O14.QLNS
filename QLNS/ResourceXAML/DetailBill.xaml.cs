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
    /// Interaction logic for DetailBill.xaml
    /// </summary>
    public partial class DetailBill : Window
    {
        QLNSEntities qLNSEntities = new QLNSEntities();

        public DetailBill()
        {
            InitializeComponent();
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

        private void detailBill_Loaded(object sender, RoutedEventArgs e)
        {
            var query =
                from hoadon in qLNSEntities.HOADONs
                orderby hoadon.idHD
                select new { hoadon.idHD, hoadon.SoHD, hoadon.NgayHD, TenKH = hoadon.KHACHHANG.TenKH, hoadon.ThanhTien, PTThanhToan = hoadon.PTTHANHTOAN.TenPT, hoadon.GhiChu };

            productDataGrid.ItemsSource = query.ToList();

        }

    }
}
