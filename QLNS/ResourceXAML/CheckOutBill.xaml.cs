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
    /// Interaction logic for CheckOutBill.xaml
    /// </summary>
    public partial class CheckOutBill : Window
    {
        QLNSEntities qLNSEntities = new QLNSEntities();

        public CheckOutBill()
        {
            InitializeComponent();
        }

        public CheckOutBill(List<BillProductListBoxItem> listProduct, int tongSLSP, decimal tongThanhTienHD)
        {
            InitializeComponent();
            this.listProduct = listProduct;
            this.TongSLSP = tongSLSP;
            this.TongThanhTienHD = tongThanhTienHD;
            LoadListProduct();
            LoadAllCustomer();
            LoadAllVoucher();
            LoadAllPayment();
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

        private List<BillProductListBoxItem> listProduct;
        private int TongSLSP = 0;
        private decimal TongThanhTienHD = 0;
        private void LoadListProduct()
        {
            foreach (BillProductListBoxItem item in listProduct)
            {
                productListBox.Items.Add(new BillProductListBoxItem(item));
            }
        }

        private void LoadAllCustomer()
        {
            //var queryAllCustomer = from khachhang in qLNSEntities.KHACHHANGs
            //                       orderby khachhang.idKH
            //                       select new
            //                       {
            //                           khachhang.idKH,
            //                           khachhang.MaKH,
            //                           khachhang.TenKH,
            //                           khachhang.DiemTichLuy,
            //                           khachhang.SDT,
            //                           khachhang.DiaChi,
            //                           khachhang.LOAIKHACHHANG.TenLKH,
            //                           khachhang.NgayTG
            //                       };

            var queryAllCustomer = from khachhang in qLNSEntities.KHACHHANGs
                                   orderby khachhang.idKH
                                   select new
                                   {
                                       idKH = khachhang.idKH,
                                       itemMaKH = khachhang.MaKH,
                                       itemTenKH = khachhang.TenKH,
                                       itemDiemTichLuy = khachhang.DiemTichLuy,
                                       itemSDT = khachhang.SDT,
                                       itemDiaChi = khachhang.DiaChi,
                                       itemLoaiKH = khachhang.LOAIKHACHHANG.TenLKH,
                                       itemNgayTG = khachhang.NgayTG
                                   };

            var listCustomer = queryAllCustomer.ToList().Select(item => 
                new BillCustomerListBoxItem(
                    item.idKH,
                    item.itemMaKH,
                    item.itemTenKH,
                    item.itemDiemTichLuy,
                    item.itemSDT,
                    item.itemDiaChi,
                    item.itemLoaiKH,
                    item.itemNgayTG
                    ));


            customerListBox.ItemsSource = listCustomer;
            //foreach(BillCustomerListBoxItem item in listCustomer)
            //{
            //    customerListBox.Items.Add(new BillCustomerListBoxItem(item));
            //}

        }

        private void LoadAllVoucher()
        {

        }

        private void LoadAllPayment()
        {
            var queryAllPayment = from ptthanhtoan in qLNSEntities.PTTHANHTOANs
                                  orderby ptthanhtoan.idPT
                                  select new
                                  {
                                      idPT = ptthanhtoan.idPT,
                                      MaPT = ptthanhtoan.MaPT,
                                      TenPT = ptthanhtoan.TenPT,
                                  };

            paymentComboBox.ItemsSource = queryAllPayment.ToList();
        }
    }
}
