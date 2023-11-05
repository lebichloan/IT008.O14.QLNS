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
            var query =
                from hoadon in qLNSEntities.HOADONs
                orderby hoadon.idHD
                //where hoadon.idHD == 0
                select new { 
                    idHD = hoadon.idHD, 
                    SoHD = hoadon.SoHD, 
                    NgayHD = hoadon.NgayHD, 
                    TenKH = hoadon.KHACHHANG.TenKH, 
                    ThanhTien = hoadon.ThanhTien, 
                    PTThanhToan = hoadon.PTTHANHTOAN.TenPT, 
                    GhiChu = hoadon.GhiChu 
                };

            //memberDataGrid.ItemsSource = query.ToList();
            memberDataGrid.ItemsSource = query.Skip(pageSize * (pageNumber)).Take(pageSize).ToList();
            btnPre.IsEnabled = false;
            lblPage.Text = string.Format("{0}/{1}", pageNumber, query.Count() / pageSize);
        }

        private void btnPre_Click(object sender, RoutedEventArgs e)
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

            pageNumber--;
            memberDataGrid.ItemsSource = query.Skip(pageSize * (pageNumber)).Take(pageSize).ToList();
            if (query.Skip(pageSize * (pageNumber + 1)).Take(pageSize).Count() > 0)
            {
                btnPre.IsEnabled = true;
            }
            else
            {
                btnPre.IsEnabled = false;
            }
            btnNext.IsEnabled = true;
            btnPre.IsEnabled = !(pageNumber == 1);
            lblPage.Text = string.Format("{0}/{1}", pageNumber, query.Count() / pageSize);
        }

        private void btnNext_Click(object sender, RoutedEventArgs e)
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

            pageNumber++;
            memberDataGrid.ItemsSource = query.Skip(pageSize * pageNumber).Take(pageSize).ToList();
            if (query.Skip(pageSize * (pageNumber + 1)).Take(pageSize).Count() >= 0)
            {
                btnNext.IsEnabled = true;
            }
            else
            {
                btnNext.IsEnabled = false;
            }
            btnPre.IsEnabled = true;
            btnNext.IsEnabled = !(pageNumber == 1);
            lblPage.Text = string.Format("{0}/{1}", pageNumber, query.Count() / pageSize);
        }
    }
}
