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

        int pageNumber = 1;
        int pageSize = 10;

        private void billManage_Loaded(object sender, RoutedEventArgs e)
        {
            LoadData(0);
        }

        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            pageNumber--;
            LoadData(pageNumber);
        }

        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            pageNumber++;
            LoadData(pageNumber);
        }

        private void LoadData(int page)
        {
            var query =
                from hoadon in qLNSEntities.HOADONs
                orderby hoadon.idHD
                //where hoadon.idHD == 0
                select new
                {
                    idHD = hoadon.idHD,
                    SoHD = hoadon.SoHD,
                    NgayHD = hoadon.NgayHD,
                    TenKH = hoadon.KHACHHANG.TenKH,
                    ThanhTien = hoadon.ThanhTien,
                    PTThanhToan = hoadon.PTTHANHTOAN.TenPT,
                    GhiChu = hoadon.GhiChu
                };

            memberDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }
    }

}
