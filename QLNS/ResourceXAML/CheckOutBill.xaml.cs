﻿using QLNS.Controls;
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

            lblTenKH.Visibility = Visibility.Collapsed;
            lblSDT.Visibility = Visibility.Collapsed;
            lblDiaChi.Visibility = Visibility.Collapsed;
            lblLoaiKH.Visibility = Visibility.Collapsed;
            lblDiemTichLuy.Visibility = Visibility.Collapsed;
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
                               where (khuyenmai.idLKH == idLKH || khuyenmai.idLKH == 0)
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
            if (customerListBox.SelectedItems != null && customerListBox.Items.Count > 0)
            {
                var selectedCustomer = (dynamic)customerListBox.SelectedItems[0];
                idKHSelected = selectedCustomer.idKH;
                idLKHSelected = selectedCustomer.idLKH;

                idVoucherSelected = -1;
                lblTenKM.Visibility = Visibility.Collapsed;
                btnCancelVoucher.Visibility = Visibility.Collapsed;
                GiamGiaHD = 0;
                TongThanhToanHD = TongThanhTienHD;
                lblGiamGiaHoaDon.Text = GiamGiaHD.ToString();
                lblTongThanhToanHoaDon.Text = TongThanhToanHD.ToString();
                lblTongThanhToan.Text = TongThanhToanHD.ToString();

                LoadVoucher(idLKHSelected);

                lblTenKH.Visibility = Visibility.Visible;
                lblSDT.Visibility = Visibility.Visible;
                lblDiaChi.Visibility = Visibility.Visible;
                lblLoaiKH.Visibility = Visibility.Visible;
                lblDiemTichLuy.Visibility = Visibility.Visible;

                lblTenKH.Text = selectedCustomer.itemTenKH;
                lblSDT.Text = selectedCustomer.itemSDT;
                lblDiaChi.Text = selectedCustomer.itemDiaChi;
                lblLoaiKH.Text = selectedCustomer.itemLoaiKH;
                lblDiemTichLuy.Text = selectedCustomer.itemDiemTichLuy.ToString();

                btnCancel.Visibility = Visibility.Visible;
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

                lblTenKM.Visibility = Visibility.Visible;
                lblTenKM.Text = selectedVoucher.itemTenKM;
                btnCancelVoucher.Visibility = Visibility.Visible;
            }
        }

        private void paymentComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (paymentComboBox.SelectedItem != null)
            {
                var selectedPayment = (dynamic)paymentComboBox.SelectedItem;
                idPaymentSelected = selectedPayment.idPT;
                if (paymentComboBox.SelectedIndex == 0)
                {
                    paymentCast.Visibility = Visibility.Visible;
                    lblThanhToan.Text = TongThanhToanHD.ToString();
                }
                else
                {
                    paymentCast.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void LoadPaymentCash()
        {
            decimal TienKhachDua = 0;
            try
            {
                TienKhachDua = decimal.Parse(txtTienKhachDua.Text);
                if (TienKhachDua < TongThanhToanHD)
                {
                    Message message = new Message();
                    message.message.Text = "Số tiền khách đưa nhỏ hơn tổng thanh toán hóa đơn!";
                    message.ShowDialog();
                    return;
                }
                else
                {
                    decimal TienThua = TienKhachDua - TongThanhToanHD;
                    lblTienThua.Text = TienThua.ToString();
                }
            }
            catch (FormatException)
            {
                Message message = new Message();
                message.message.Text = "Vui lòng nhập số tiền khách đưa hợp lệ!";
                message.ShowDialog();
            }

        }

        private void btnCheckOut_Click(object sender, RoutedEventArgs e)
        {
            if (idPaymentSelected == 0)
            {
                Message message = new Message();
                message.message.Text = "Vui lòng chọn phương thức thanh toán!";
                message.ShowDialog();
            }
            else
            {
                if (txtTienKhachDua.Text == "" && paymentComboBox.SelectedIndex == 0)
                {
                    Message message = new Message();
                    message.message.Text = "Vui lòng nhập vào số tiền khách đưa!";
                    message.ShowDialog();
                }
                else
                {
                    HOADON hoadon = CreateBill();
                    DataProvider.Ins.DB.HOADONs.Add(hoadon);
                    DataProvider.Ins.DB.SaveChanges();
                    int idHD = GetLastIdHD();

                    foreach (BillProductListBoxItem item in listProduct)
                    {
                        CTHD cthd = CreateDetailBill(item, idHD);
                        DataProvider.Ins.DB.CTHDs.Add(cthd);
                        DataProvider.Ins.DB.SaveChanges();
                        SetSLSP(item.itemIdCTSP, item.itemSoLuongSP);
                    }
                    Message message = new Message();
                    message.message.Text = "Thêm hóa đơn thành công!";
                    message.ShowDialog();
                    this.Close();
                }
            }
        }

        private int GetLastIdHD()
        {
            var query =
                from hoadon in qLNSEntities.HOADONs
                orderby hoadon.idHD descending
                select new
                {
                    idHD = hoadon.idHD,
                };

            var lastHD = query.FirstOrDefault();
            if (lastHD != null)
            {
                return lastHD.idHD;
            }
            return 0;
        }

        private void SetSLSP(int idSP, int sl)
        {
            var product = qLNSEntities.CTSPs.FirstOrDefault(sp => sp.idCTSP == idSP);
            if (product != null)
            {
                product.DaBan = (short)(product.DaBan + sl);
                product.SLConLai = (short)(product.SLConLai - sl);
                if (product.SLConLai == 0)
                {
                    product.TinhTrang = 0;
                    //product.TinhTrang = "Đã bán hết";
                }
                qLNSEntities.SaveChanges();
            }
        }

        private HOADON CreateBill()
        {
            HOADON hoadon = new HOADON();
            DateTime ngayHD = DateTime.Now;
            hoadon.NgayHD = ngayHD;
            hoadon.GiamGia = GiamGiaHD;
            hoadon.ThanhTien = TongThanhTienHD;
            if (txtGhiChu.Text != "")
            {
                hoadon.GhiChu = txtGhiChu.Text;
            }
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

        private CTHD CreateDetailBill(BillProductListBoxItem billProductListBoxItem, int idHD)
        {
            CTHD cthd = new CTHD();
            cthd.idHD = idHD;
            cthd.idCTSP = billProductListBoxItem.itemIdCTSP;
            cthd.SoLuong = billProductListBoxItem.itemSoLuongSP;
            cthd.DonGia = billProductListBoxItem.itemDonGiaSP;
            cthd.ThanhTien = billProductListBoxItem.itemThanhTienSP;
            return cthd;
        }

        private void customerExpander_Expanded(object sender, RoutedEventArgs e)
        {
            voucherExpander.IsExpanded = false;
            paymentExpander.IsExpanded = false;
        }

        private void voucherExpander_Expanded(object sender, RoutedEventArgs e)
        {
            customerExpander.IsExpanded = false;
            paymentExpander.IsExpanded = false;
        }

        private void paymentExpander_Expanded(object sender, RoutedEventArgs e)
        {
            customerExpander.IsExpanded = false;
            voucherExpander.IsExpanded = false;
        }

        private string customerSearchTerm = "";
        private void txtSearchCustomer_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                customerSearchTerm = txtSearchCustomer.Text.ToLower();
                if (customerSearchTerm == "")
                {
                    LoadAllCustomer();
                }
                else
                {
                    FilterCustomer(customerSearchTerm);
                }
            }
        }
        private void FilterCustomer(string searchTerm)
        {
            var queryAllCustomer = from khachhang in qLNSEntities.KHACHHANGs
                                   orderby khachhang.idKH
                                   where
                                   khachhang.idKH.ToString().ToLower().Contains(searchTerm.ToLower())
                                   || khachhang.MaKH.ToLower().Contains(searchTerm.ToLower())
                                   || khachhang.TenKH.ToLower().Contains(searchTerm.ToLower())
                                   || khachhang.SDT.ToLower().Contains(searchTerm.ToLower())
                                   || khachhang.DiaChi.ToLower().Contains(searchTerm.ToLower())
                                   || khachhang.idLKH.ToString().ToLower().Contains(searchTerm.ToLower())
                                   || khachhang.NgayTG.ToString().ToLower().Contains(searchTerm.ToLower())
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


        private string voucherSearchTerm = "";
        private void txtSearchVoucher_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                voucherSearchTerm = txtSearchVoucher.Text.ToLower();
                if (voucherSearchTerm == "")
                {
                    LoadVoucher(idLKHSelected);
                }
                else
                {
                    FilterVoucher(idLKHSelected, voucherSearchTerm);
                }
            }
        }
        private void FilterVoucher(int idLKH, string searchTerm)
        {
            var queryVoucher = from khuyenmai in qLNSEntities.KHUYENMAIs
                               where khuyenmai.idLKH == idLKH
                               && khuyenmai.NgayKT >= DateTime.Now
                               && khuyenmai.NgayBD <= DateTime.Now
                               && (khuyenmai.TenKM.ToLower().Contains(searchTerm.ToLower())
                               || khuyenmai.NgayBD.ToString().ToLower().Contains(searchTerm.ToLower())
                               || khuyenmai.NgayKT.ToString().ToLower().Contains(searchTerm.ToLower())
                               || khuyenmai.GiamGia.ToString().ToLower().Contains(searchTerm.ToLower()))
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

        private void txtTienKhachDua_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                LoadPaymentCash();
            }

        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            lblTenKH.Visibility = Visibility.Collapsed;
            lblSDT.Visibility = Visibility.Collapsed;
            lblDiaChi.Visibility = Visibility.Collapsed;
            lblLoaiKH.Visibility = Visibility.Collapsed;
            lblDiemTichLuy.Visibility = Visibility.Collapsed;

            idKHSelected = -1;
            idLKHSelected = 0;
            lblTenKM.Visibility = Visibility.Collapsed;
            idVoucherSelected = -1;
            GiamGiaHD = 0;
            TongThanhToanHD = TongThanhTienHD;
            lblGiamGiaHoaDon.Text = GiamGiaHD.ToString();
            lblTongThanhToanHoaDon.Text = TongThanhToanHD.ToString();
            lblTongThanhToan.Text = TongThanhToanHD.ToString();
            LoadVoucher(idLKHSelected);

            btnCancel.Visibility = Visibility.Collapsed;
            btnCancelVoucher.Visibility = Visibility.Collapsed;
        }

        private void btnCancelVoucher_Click(object sender, RoutedEventArgs e)
        {
            lblTenKM.Visibility = Visibility.Collapsed;
            idVoucherSelected = -1;
            GiamGiaHD = 0;
            TongThanhToanHD = TongThanhTienHD;
            lblGiamGiaHoaDon.Text = GiamGiaHD.ToString();
            lblTongThanhToanHoaDon.Text = TongThanhToanHD.ToString();
            lblTongThanhToan.Text = TongThanhToanHD.ToString();

            btnCancelVoucher.Visibility = Visibility.Collapsed;
        }
    }
}
