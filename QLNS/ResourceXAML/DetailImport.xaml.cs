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
    /// Interaction logic for DetailImport.xaml
    /// </summary>
    public partial class DetailImport : Window
    {

        private int idImport = -1;


        QLNSEntities qLNSEntities = new QLNSEntities();
        public DetailImport()
        {
            InitializeComponent();
        }
        public DetailImport(int idNH)
        {
            idImport = idNH;
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadDetailImportProduct(idImport);
            LoadImport(idImport);
        }

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

        private void LoadImport(int idNH)
        {
            var query = from nhaphang in qLNSEntities.NHAPHANGs
                        where nhaphang.idNH == idNH
                        join nhanvien in qLNSEntities.NHANVIENs
                        on nhaphang.idND equals nhanvien.idNV
                        select new
                        {
                            MaNH = nhaphang.MaNH,
                            NgayNhap = nhaphang.NgayNhap,
                            ThanhTien = nhaphang.ThanhTien,
                            GhiChu = nhaphang.GhiChu,
                            MaNV = nhanvien.MaNV,
                            TenNV = nhanvien.TenNV,

                        };

            var currentBill = query.ToList().FirstOrDefault();

            lblSoNH.Text = currentBill.MaNH;
            lblNgayNH.Text = currentBill.NgayNhap.ToString();
            lblNhanVien.Text = string.Format("{0} | {1}", currentBill.MaNV, currentBill.TenNV);
            lblThanhTien.Text = currentBill.ThanhTien.ToString();
            
        }
        private void LoadDetailImportProduct(int idNH)
        {
            var queryDetailBill = from ctsp in qLNSEntities.CTSPs
                                  where ctsp.idNH == idNH
                                  join sanpham in qLNSEntities.SANPHAMs
                                  on ctsp.idSP equals sanpham.idSP
                                  select new
                                  {
                                      itemTenSP = sanpham.TenSP,
                                      itemSoLuongSP = ctsp.SoLuongNhap,
                                      itemDonGiaSP = ctsp.DonGiaNhap,
                                      itemThanhTienSP = (decimal)(ctsp.SoLuongNhap * ctsp.DonGiaNhap),
                                  };

            productListBox.ItemsSource = queryDetailBill.ToList();
        }

        
    }
}
