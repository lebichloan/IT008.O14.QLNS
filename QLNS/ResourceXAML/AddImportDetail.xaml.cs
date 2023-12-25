using QLNS.Controls;
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
    /// Interaction logic for AddImportDetail.xaml
    /// </summary>
    public partial class AddImportDetail : Window
    {
        public int idND {  get; set; }
        
        QLNSEntities qLNSEntities = new QLNSEntities();
        public AddImportDetail()
        {
            InitializeComponent();
        }
        
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadAllProduct();
            SetValues();
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

        private void productDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (productDataGrid.SelectedItem != null)
            {
                var selectedProduct = (dynamic)productDataGrid.SelectedItem;

                detailProductExpander.Visibility = Visibility.Visible;
                detailProductExpander.IsExpanded = true;
                //idSP = selectedProduct.idSP;
                headerProductExpander.Text = selectedProduct.TenSP;
                
                if (selectedProduct.MoTa != "")
                {
                    lblMoTa.Text = selectedProduct.MoTa;
                }
                lblDanhMuc.Text = selectedProduct.TenDM;
                
                btnSub.IsEnabled = false;
                SLSPNH = 0;
                txtSoLuongSanPham.Text = SLSPNH.ToString();
                textBoxDonGia.Text = "0";
                ThanhTienSP = 0;
                lblThanhTienSanPham.Text = ThanhTienSP.ToString();
            }
            else
            {
                detailProductExpander.Visibility = Visibility.Collapsed;
            }
        }

        private string searchTerm = "";
        private int isSearch = 0;

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

        

        private void btnSub_Click(object sender, RoutedEventArgs e)
        {
            SLSPNH--;
            txtSoLuongSanPham.Text = SLSPNH.ToString();
            ThanhTienSP = SLSPNH * Convert.ToDecimal(textBoxDonGia.Text);
            lblThanhTienSanPham.Text = ThanhTienSP.ToString();
            CheckInputSoLuong(SLSPNH);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            SLSPNH++;
            txtSoLuongSanPham.Text = SLSPNH.ToString();
            ThanhTienSP = SLSPNH * Convert.ToDecimal(textBoxDonGia.Text);
            lblThanhTienSanPham.Text = ThanhTienSP.ToString();
            CheckInputSoLuong(SLSPNH);
        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            if (SLSPNH <= 0)
            {
                MessageBox.Show("Vui long nhap so luong lon hon 0");
                //txtSoLuongSanPham.Focus();
            }
            
            else
            {
                addProducttoBill();
                detailProductExpander.Visibility = Visibility.Collapsed;
            }
        }
        public void LoadAllProduct()
        {
            var queryAllProduct = from sanpham in qLNSEntities.SANPHAMs
                                  join danhmuc in qLNSEntities.DANHMUCs
                                  on sanpham.idDM equals danhmuc.idDM
                                  orderby sanpham.MaSP
                                  select new
                                  {
                                      MaSP = sanpham.MaSP,
                                      TenSP = sanpham.TenSP,
                                      TenDM = danhmuc.TenDM,
                                      MoTa = sanpham.MoTa,
                                  };

            productDataGrid.ItemsSource = queryAllProduct.ToList();
        }

        public void SetValues()
        {
            lblSoLuongNhapHang.Text = "0";
            lblTongTienNhapHang.Text = "0";
            btnNext.IsEnabled = false;
            productListBox.Items.Clear();

            detailProductExpander.Visibility = Visibility.Collapsed;
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

        private int idSP = 0;
        private decimal DonGiaSP = 0;
        private short SLSPNH = 0;
        private decimal ThanhTienSP = 0;
        private void GetValueSoLuongSP()
        {
            if (txtSoLuongSanPham.Text == "")
            {
                MessageBox.Show("Vui long nhap so luong lon hon 0");
            }
            else
            {
                try
                {
                    short soLuongSPInput = short.Parse(txtSoLuongSanPham.Text);
                    if (soLuongSPInput <= 0)
                    {
                        MessageBox.Show("Vui long nhap so luong lon hon 0");
                        txtSoLuongSanPham.Focus();
                    }
                    else
                    {
                        SLSPNH = soLuongSPInput;
                        ThanhTienSP = DonGiaSP * SLSPNH;
                        lblThanhTienSanPham.Text = ThanhTienSP.ToString();
                    }
                    txtSoLuongSanPham.Text = SLSPNH.ToString();
                }
                catch (FormatException)
                {
                    MessageBox.Show("Khong the doi thanh so");
                    txtSoLuongSanPham.Text = SLSPNH.ToString();
                }
                CheckInputSoLuong(SLSPNH);
            }
        }

        private void CheckInputSoLuong(int sl)
        {
            if (sl <= 0)
            {
                btnSub.IsEnabled = false;
            }
            
        }

        private int TongSoLuongSP = 0;
        private decimal TongTienNH = 0;
        private void addProducttoBill()
        {
            productListBox.Items.Add(new ImportItemListBox(
                idSP,
                headerProductExpander.Text,
                SLSPNH,
                Convert.ToDecimal(textBoxDonGia.Text),
                ThanhTienSP));

            TongSoLuongSP = TongSoLuongSP + SLSPNH;
            lblSoLuongNhapHang.Text = TongSoLuongSP.ToString();
            TongTienNH = TongTienNH + ThanhTienSP;
            lblTongTienNhapHang.Text = TongTienNH.ToString();

            btnNext.IsEnabled = true;
        }
        

        private void txtSoLuongSanPham_KeyDown(object sender, KeyEventArgs e)
        {

        }

        private void txtSoLuongSanPham_LostFocus(object sender, RoutedEventArgs e)
        {

        }

        private void productListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void btnAddNewProduct_Click(object sender, RoutedEventArgs e)
        {
            AddNewProduct addNewProduct = new AddNewProduct();
            addNewProduct.addImportDetail = this;
            addNewProduct.Show();
        }
        private List<ImportItemListBox> listProduct;
        private List<ImportItemListBox> GetListBoxProduct()
        {
            List<ImportItemListBox> tempListProduct = new List<ImportItemListBox>();

            foreach (ImportItemListBox item in productListBox.Items)
            {
                ImportItemListBox importProductListBoxItem = item as ImportItemListBox;
                tempListProduct.Add(importProductListBoxItem);
            }
            listProduct = tempListProduct;
            return listProduct;
        }

        
        private int TongSLSP = 0;
        private decimal TongThanhTienNH = 0;

        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            NHAPHANG nhaphang = CreateImport();
            DataProvider.Ins.DB.NHAPHANGs.Add(nhaphang);
            DataProvider.Ins.DB.SaveChanges();
            int idNH = GetLastIdImport();

            listProduct = GetListBoxProduct();

            foreach (ImportItemListBox item in listProduct)
            {
                CTSP ctsp = CreateImportDetail(item, idNH);
                DataProvider.Ins.DB.CTSPs.Add(ctsp);
                DataProvider.Ins.DB.SaveChanges();
            }

            MessageBox.Show("Them don nhap hang thanh cong");
            
            this.Close();
        }


        private NHAPHANG CreateImport()
        {
            NHAPHANG nhaphang = new NHAPHANG();
            DateTime ngayNhap = DateTime.Now;
            nhaphang.NgayNhap = ngayNhap;
            
            nhaphang.GhiChu = "";
            TongThanhTienNH = Convert.ToDecimal(lblTongTienNhapHang.Text);
            nhaphang.ThanhTien = TongThanhTienNH;
            nhaphang.idND = idND;
            
            return nhaphang;
        }
        private CTSP CreateImportDetail(ImportItemListBox importItem, int idNH)
        {
            CTSP ctsp = new CTSP();
            ctsp.idSP = importItem.itemMaSP;
            ctsp.SoLuongNhap = importItem.itemSoLuongNhapSP;
            ctsp.DonGiaNhap = importItem.itemDonGiaNhapSP;
            ctsp.SLConLai = ctsp.SoLuongNhap;
            ctsp.DaBan = 0;
            ctsp.DonGiaXuat =0;
            ctsp.SoLuongLoi = 0;
            ctsp.GhiChu = "";
            //ctsp.TinhTrang = "Còn hàng";
            ctsp.idNH = idNH;
            ctsp.idCTSP = GetLastIdProductDetail();
            
            return ctsp;
        }
        private void SetSLSP(int idSP, int sl)
        {
            var product = qLNSEntities.CTSPs.FirstOrDefault(sp => sp.idCTSP == idSP);
            if (product != null)
            {
                product.SLConLai = (short)(product.SLConLai + sl);
                if (product.SLConLai == 0)
                {
                    ///product.TinhTrang = "Đã bán hết";
                }
                qLNSEntities.SaveChanges();
            }
        }
        private void UpdateExistingProductDetail()
        {

        }
        private int GetLastIdProductDetail()
        {
            var query =
                from ctsp in qLNSEntities.CTSPs
                orderby ctsp.idCTSP descending
                select new
                {
                    IdCTSP = ctsp.idCTSP,
                };

            var lastIDCTSP = query.FirstOrDefault();
            if (lastIDCTSP != null)
            {
                return lastIDCTSP.IdCTSP;
            }
            return 0;
        }
        private int GetLastIdImport()
        {
            var query =
                from nhaphang in qLNSEntities.NHAPHANGs
                orderby nhaphang.idNH descending
                select new
                {
                    idNH = nhaphang.idNH,
                };

            var lastNH = query.FirstOrDefault();
            if (lastNH != null)
            {
                return lastNH.idNH;
            }
            return 0;
        }
    }
}
