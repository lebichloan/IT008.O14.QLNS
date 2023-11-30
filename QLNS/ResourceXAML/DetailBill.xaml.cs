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
        private int idHD = -1;
        public DetailBill()
        {
            InitializeComponent();
        }

        public DetailBill(int idHD)
        {
            InitializeComponent();
            this.idHD = idHD;
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
            LoadBill(idHD);
            LoadDetailBill(idHD);
        }

        private void LoadBill(int idHD)
        {
            var query = from hoadon in qLNSEntities.HOADONs
                        where hoadon.idHD == idHD
                        select new
                        {
                            SoHD = hoadon.SoHD,
                            NgayHD = hoadon.NgayHD,
                            MaKH = hoadon.KHACHHANG.MaKH,
                            TenKH = hoadon.KHACHHANG.TenKH,
                            SDT = hoadon.KHACHHANG.SDT,
                            MaNV = hoadon.NGUOIDUNG.NHANVIEN.MaNV,
                            TenNV = hoadon.NGUOIDUNG.NHANVIEN.TenNV,
                            SLSP = hoadon.SLSP,
                            ThanhTien = hoadon.ThanhTien,
                            GiamGia = hoadon.GiamGia,
                            TongThanhToan = hoadon.ThanhToan,
                            TenPTTT = hoadon.PTTHANHTOAN.TenPT,
                        };

            var currentBill = query.ToList().FirstOrDefault();

            lblSoHD.Text = currentBill.SoHD;
            lblNgayHD.Text = currentBill.NgayHD.ToString();
            lblKhachHang.Text = currentBill.TenKH;
            lblSDT.Text = currentBill.SDT;
            lblNhanVien.Text = string.Format("{0} | {1}", currentBill.MaNV, currentBill.TenNV);
            lblSLSP.Text = currentBill.SLSP.ToString();
            lblThanhTien.Text = currentBill.ThanhTien.ToString();
            lblGiamGia.Text = currentBill.GiamGia.ToString();
            lblTongThanhToan.Text = currentBill.TongThanhToan.ToString();
            lblTenPT.Text = currentBill.TenPTTT;
        }

        private void LoadDetailBill(int idHD)
        {
            var queryDetailBill = from cthd in qLNSEntities.CTHDs
                                  where cthd.idHD == idHD
                                  select new
                                  {
                                      itemTenSP = cthd.CTSP.SANPHAM.TenSP,
                                      itemSoLuongSP = cthd.SoLuong,
                                      itemDonGiaSP = cthd.DonGia,
                                      itemThanhTienSP = cthd.ThanhTien,
                                  };

            productListBox.ItemsSource = queryDetailBill.ToList();
        }

    }
}
