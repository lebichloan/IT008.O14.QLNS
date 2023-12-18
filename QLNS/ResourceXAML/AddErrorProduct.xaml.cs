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
    /// Interaction logic for AddErrorProduct.xaml
    /// </summary>
    public partial class AddErrorProduct : Window
    {
        QLNSEntities qLNSEntities = new QLNSEntities();
        public AddErrorProduct()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadAllProduct();
        }

        private void LoadAllProduct()
        {
            var queryAllProduct = from ctsp in qLNSEntities.CTSPs 
                                  join sanpham in qLNSEntities.SANPHAMs
                                  on ctsp.idSP equals sanpham.idSP
                                  join nhaphang in qLNSEntities.NHAPHANGs
                                  on ctsp.idNH equals nhaphang.idNH
                                  orderby ctsp.idCTSP
                                  where ctsp.SLConLai > 0
                                  select new
                                  {
                                      idSP = ctsp.idCTSP,
                                      MaSP = ctsp.MaCTSP,
                                      TenSP = sanpham.TenSP,
                                      SLDB = ctsp.DaBan,
                                      SLCL = ctsp.SLConLai,
                                      NgayNhap = nhaphang.NgayNhap,
                                      MoTa = sanpham.MoTa,
                                      DonGia = ctsp.DonGiaXuat,
                                      GhiChu = ctsp.GhiChu,
                                  };

            productDataGrid.ItemsSource = queryAllProduct.ToList();
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

        private void errorProductListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {

        }


        private void txtSearchProduct_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                searchTerm = txtSearchProduct.Text.ToLower();
                if (searchTerm == "")
                {
                    isSearch = 0;
                    productTabItem.Header = "Tất cả sản phẩm";
                    LoadAllProduct();
                }
                else
                {
                    isSearch = 1;
                    productTabItem.Header = "Kết quả tìm kiếm";
                    FilterProduct(searchTerm);
                }
            }
        }

        private void FilterProduct(string searchTerm)
        {
            var queryFilterProduct = from sanpham in qLNSEntities.SANPHAMs
                                     join ctsp in qLNSEntities.CTSPs
                                     on sanpham.idSP equals ctsp.idSP
                                     orderby ctsp.idCTSP
                                     where
                                     ctsp.SLConLai > 0 &&
                                     (ctsp.MaCTSP.ToLower().Contains(searchTerm)
                                     || sanpham.TenSP.ToLower().Contains(searchTerm)
                                     || ctsp.SLConLai.ToString().ToLower().Contains(searchTerm)
                                     || ctsp.DonGiaXuat.ToString().ToLower().Contains(searchTerm)
                                     || ctsp.GhiChu.ToLower().Contains(searchTerm))
                                     select new
                                     {
                                         idSP = ctsp.idCTSP,
                                         MaSP = ctsp.MaCTSP,
                                         TenSP = sanpham.TenSP,
                                         SLDB = ctsp.DaBan,
                                         SLCL = ctsp.SLConLai,
                                         MoTa = sanpham.MoTa,
                                         DonGia = ctsp.DonGiaXuat,
                                         GhiChu = ctsp.GhiChu,
                                     };

            productDataGrid.ItemsSource = queryFilterProduct.ToList();
        }

        private void GetValueSoLuongSP()
        {
            //if (txtSoLuongSanPham.Text == "")
            //{
            //    MessageBox.Show("Vui long nhap so luong lon hon 0");
            //}
            //else
            //{
            //    try
            //    {
            //        int soLuongSPInput = int.Parse(txtSoLuongSanPham.Text);
            //        if (soLuongSPInput <= 0)
            //        {
            //            MessageBox.Show("Vui long nhap so luong lon hon 0");
            //            txtSoLuongSanPham.Focus();
            //        }
            //        else if (soLuongSPInput > SLSPCL)
            //        {
            //            MessageBox.Show("Kho khong the cung cap so luong nay");
            //            txtSoLuongSanPham.Focus();
            //        }
            //        else
            //        {
            //            SLSPHD = soLuongSPInput;
            //            ThanhTienSP = DonGiaSP * SLSPHD;
            //            lblThanhTienSanPham.Text = ThanhTienSP.ToString();
            //        }
            //        txtSoLuongSanPham.Text = SLSPHD.ToString();
            //    }
            //    catch (FormatException)
            //    {
            //        MessageBox.Show("Khong the doi thanh so");
            //        txtSoLuongSanPham.Text = SLSPHD.ToString();
            //    }
            //    CheckInputSoLuong(SLSPHD);
            //}
        }

        private void CheckInputSoLuong(int sl)
        {
            //if (sl <= 0)
            //{
            //    btnSub.IsEnabled = false;
            //}
            //if (sl >= SLSPCL)
            //{
            //    btnAdd.IsEnabled = false;
            //}
            //if (sl > 0 && sl < SLSPCL)
            //{
            //    btnAdd.IsEnabled = true;
            //    btnSub.IsEnabled = true;
            //}
        }

        private int TongSoLuongSP = 0;
        private decimal TongTienHD = 0;

        private int idCTSP = 0;
        private int SLSPCL = 0;
        private decimal DonGiaSP = 0;
        private int SLSPHD = 0;
        private decimal ThanhTienSP = 0;
        private void addProducttoBill()
        {
            //errorProductListBox.Items.Add(new BillProductListBoxItem(
            //    idCTSP,
            //    headerProductExpander.Text,
            //    SLSPHD,
            //    ));

            //TongSoLuongSP = TongSoLuongSP + SLSPHD;
            //lblSoLuongHoaDon.Text = TongSoLuongSP.ToString();
            //TongTienHD = TongTienHD + ThanhTienSP;
            //lblTongTienHoaDon.Text = TongTienHD.ToString();

            //btnSave.IsEnabled = true;
        }
        private List<BillProductListBoxItem> GetListBoxProduct()
        {
            List<BillProductListBoxItem> listProduct = new List<BillProductListBoxItem>();

            //foreach (BillProductListBoxItem item in productListBox.Items)
            //{
            //    BillProductListBoxItem billProductListBoxItem = item as BillProductListBoxItem;
            //    listProduct.Add(billProductListBoxItem);
            //}

            return listProduct;
        }

        private void btnSub_Click(object sender, RoutedEventArgs e)
        {

        }

        private void txtSoLuongSanPham_KeyDown(object sender, KeyEventArgs e)
        {

        }

        private void txtSoLuongSanPham_LostFocus(object sender, RoutedEventArgs e)
        {

        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {

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

        private void productDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (productDataGrid.SelectedItem != null)
            {
                var selectedProduct = (dynamic)productDataGrid.SelectedItem;

                detailProductExpander.Visibility = Visibility.Visible;
                detailProductExpander.IsExpanded = true;
                //    idCTSP = selectedProduct.idSP;
                //    headerProductExpander.Text = selectedProduct.TenSP;
                //    lblSoLuongDaBan.Text = string.Format("{0} {1}", "Đã bán", selectedProduct.SLDB.ToString());
                //    SLSPCL = selectedProduct.SLCL;
                //    lblSoLuongConLai.Text = string.Format("{0} {1}", "Còn lại", SLSPCL.ToString());
                //    if (selectedProduct.MoTa != "")
                //    {
                //        lblMoTa.Text = selectedProduct.MoTa;
                //    }
                //    DonGiaSP = selectedProduct.DonGia;
                //    lblDonGia.Text = DonGiaSP.ToString();
                //    btnSub.IsEnabled = false;
                //    SLSPHD = 0;
                //    txtSoLuongSanPham.Text = SLSPHD.ToString();
                //    ThanhTienSP = 0;
                //    lblThanhTienSanPham.Text = ThanhTienSP.ToString();
                //}
                //else
                //{
                //    detailProductExpander.Visibility = Visibility.Collapsed;
                //}
            }
        }

        private string searchTerm = "";
        private int isSearch = 0;
    }
}
