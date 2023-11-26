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
        private int idND = -1;
        QLNSEntities qLNSEntities = new QLNSEntities();

        public CheckOutBill()
        {
            InitializeComponent();
        }

        public CheckOutBill(int idND, List<BillProductListBoxItem> listProduct, int tongSLSP, decimal tongThanhTienHD)
        {
            InitializeComponent();
            this.idND = idND;
            this.listProduct = listProduct;
            this.TongSLSP = tongSLSP;
            this.TongThanhTienHD = tongThanhTienHD;
            this.TongThanhToanHD = TongThanhTienHD - GiamGiaHD;
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

        private void checkOutBill_Loaded(object sender, RoutedEventArgs e)
        {
            LoadListProduct();
            LoadAllCustomer();
            LoadVoucher(idLKHSelected);
            LoadAllPayment();
            SetValues();
        }

        private void SetValues()
        {
            lblSoLuongHoaDon.Text = TongSLSP.ToString();
            lblTongTienHoaDon.Text = TongThanhTienHD.ToString();
            lblGiamGiaHoaDon.Text = GiamGiaHD.ToString();
            lblTongThanhToanHoaDon.Text = TongThanhToanHD.ToString();
            lblTongThanhToan.Text = TongThanhToanHD.ToString();
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

        private int idKHSelected = -1;
        private int idLKHSelected = 0;
        private void LoadAllCustomer()
        {
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
                                       idLKH = khachhang.idLKH,
                                       itemLoaiKH = khachhang.LOAIKHACHHANG.TenLKH,
                                       itemNgayTG = khachhang.NgayTG
                                   };       
            
            customerListBox.ItemsSource = queryAllCustomer.ToList();
        }

        private int idVoucherSelected = -1;
        private decimal GiamGiaHD = 0;
        private decimal TongThanhToanHD = 0;
        private void LoadVoucher(int idLKH)
        {
            var queryVoucher = from khuyenmai in qLNSEntities.KHUYENMAIs
                               where khuyenmai.idLKH == idLKH
                               && khuyenmai.NgayKT >= DateTime.Now
                               && khuyenmai.NgayBD <= DateTime.Now
                               orderby khuyenmai.GiamGia
                               select new
                               {
                                   idKM = khuyenmai.idKM,
                                   itemTenKM = khuyenmai.TenKM,
                                   itemNgayBD = khuyenmai.NgayBD,
                                   itemNgayKT = khuyenmai.NgayKT,
                                   itemGiamGia = khuyenmai.GiamGia,
                                   itemMoTa = khuyenmai.MoTa,
                               };

            voucherListBox.ItemsSource = queryVoucher.ToList();
        }

        private int idPaymentSelected = 0;
        private void LoadAllPayment()
        {
            var queryAllPayment = from ptthanhtoan in qLNSEntities.PTTHANHTOANs
                                  orderby ptthanhtoan.idPT
                                  select new
                                  {
                                      idPT = ptthanhtoan.idPT,
                                      TenPT = ptthanhtoan.TenPT,
                                  };

            paymentComboBox.ItemsSource = queryAllPayment.ToList();
        }

        private void customerListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (customerListBox.SelectedItems != null)
            {
                var selectedCustomer = (dynamic)customerListBox.SelectedItems[0];
                idKHSelected = selectedCustomer.idKH;
                idLKHSelected = selectedCustomer.idLKH;

                idVoucherSelected = -1;
                GiamGiaHD = 0;
                TongThanhToanHD = TongThanhTienHD;
                lblGiamGiaHoaDon.Text = GiamGiaHD.ToString();
                lblTongThanhToanHoaDon.Text = TongThanhToanHD.ToString();
                lblTongThanhToan.Text = TongThanhToanHD.ToString();

                LoadVoucher(idLKHSelected);

                lblTenKH.Text = selectedCustomer.itemTenKH;
                lblSDT.Text = selectedCustomer.itemSDT;
                lblDiaChi.Text = selectedCustomer.itemDiaChi;
                lblLoaiKH.Text = selectedCustomer.itemLoaiKH;
                lblDiemTichLuy.Text = selectedCustomer.itemDiemTichLuy.ToString();            
            }
        }

        private void voucherListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (voucherListBox.SelectedItems != null)
            {
                var selectedVoucher = (dynamic)voucherListBox.SelectedItems[0];
                idVoucherSelected = selectedVoucher.idKM;

                int giamgia = selectedVoucher.itemGiamGia;
                GiamGiaHD = TongThanhTienHD * giamgia / 100;
                TongThanhToanHD = TongThanhTienHD - GiamGiaHD;
                lblGiamGiaHoaDon.Text = GiamGiaHD.ToString();
                lblTongThanhToanHoaDon.Text = TongThanhToanHD.ToString();
                lblTongThanhToan.Text = TongThanhToanHD.ToString();
            }
        }

        private void paymentComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (paymentComboBox.SelectedItem != null)
            {
                var selectedPayment = (dynamic)paymentComboBox.SelectedItem;
                idPaymentSelected = selectedPayment.idPT;
            }
        }

        private void btnCheckOut_Click(object sender, RoutedEventArgs e)
        {
            HOADON hoadon = CreateBill();
            DataProvider.Ins.DB.HOADONs.Add(hoadon);
            DataProvider.Ins.DB.SaveChanges();
        }

        private HOADON CreateBill()
        {
            HOADON hoadon = new HOADON();
            DateTime ngayHD = DateTime.Now;
            hoadon.NgayHD = ngayHD;
            hoadon.GiamGia = GiamGiaHD;
            hoadon.ThanhTien = TongThanhTienHD;
            hoadon.GhiChu = txtGhiChu.Text;
            hoadon.idLKH = idLKHSelected;
            if (idKHSelected != -1)
            {
                hoadon.idKH = idKHSelected;
            }
            if (idVoucherSelected != -1)
            {
                hoadon.idKM = idVoucherSelected;
            }
            hoadon.idND = idND;
            hoadon.idPT = idPaymentSelected;
            hoadon.SLSP = TongSLSP;
            hoadon.ThanhToan = TongThanhToanHD;
            return hoadon;
        }
    }
}
