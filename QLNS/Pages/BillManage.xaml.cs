using QLNS.Model;
using QLNS.ResourceXAML;
using System.Data.Entity.Core.Objects;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for BillManage.xaml
    /// </summary>
    public partial class BillManage : Page
    {
        QLNSEntities qLNSEntities = new QLNSEntities();

        public BillManage()
        {
            InitializeComponent();
        }

        private void btnAddBill_Click(object sender, RoutedEventArgs e)
        {
            AddBill addBill = new AddBill();
            addBill.ShowDialog();
        }

        private void billManage_Loaded(object sender, RoutedEventArgs e)
        {
            var query =
                from hoadon in qLNSEntities.HOADONs
                orderby hoadon.idHD
                select new { hoadon.idHD, hoadon.SoHD, hoadon.NgayHD, TenKH = hoadon.KHACHHANG.TenKH, hoadon.ThanhTien, PTThanhToan = hoadon.PTTHANHTOAN.TenPT, hoadon.GhiChu };

            memberDataGrid.ItemsSource = query.ToList();
        }
    }
}
