using QLNS.Controls;
using QLNS.Model;
using QLNS.Pages;
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
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for AddImportDetail.xaml
    /// </summary>
    public partial class AddImportDetail : Window
    {
        private int idND = -1;
        bool isTextChanged = false;
        private int idSP = 0;
        private decimal DonGiaSP = 0;
        private short SLSPNH = 1;
        private decimal ThanhTienSP = 0;

        public ImportProductManage importProductManage {  get; set; }

        QLNSEntities qLNSEntities = new QLNSEntities();
        public AddImportDetail()
        {
            idND = 1;
            InitializeComponent();
        }
        public AddImportDetail(int idImport)
        {
            idND = idImport;
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
            isTextChanged = true;
            if (productDataGrid.SelectedItem != null)
            {
                
                var selectedProduct = (dynamic)productDataGrid.SelectedItem;

                detailProductExpander.Visibility = Visibility.Visible;
                detailProductExpander.IsExpanded = true;
                idSP = selectedProduct.idSP;
                headerProductExpander.Text = selectedProduct.TenSP;
                
                if (selectedProduct.MoTa != "")
                {
                    lblMoTa.Text = selectedProduct.MoTa;
                }
                lblDanhMuc.Text = selectedProduct.TenDM;
                
                btnSub.IsEnabled = false;
                SLSPNH = 1;
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
            tempThanhTien = ThanhTienSP;
            lblThanhTienSanPham.Text = ThanhTienSP.ToString();
            CheckInputSoLuong(SLSPNH);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            SLSPNH++;
            txtSoLuongSanPham.Text = SLSPNH.ToString();
            ThanhTienSP = SLSPNH * Convert.ToDecimal(textBoxDonGia.Text);
            tempThanhTien = ThanhTienSP;
            lblThanhTienSanPham.Text = ThanhTienSP.ToString();
            CheckInputSoLuong(SLSPNH);
        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            //MessageBox.Show(lblThanhTienSanPham.Text);
            if (textBoxDonGia.Text == "0")
            {
                Message message = new Message();
                message.message.Text = "Vui lòng nhập số nguyên dương!";
                message.ShowDialog();
                return;
            }
            if (SLSPNH <= 0)
            {
                MessageBox.Show("Vui long nhap so luong lon hon 0");
                //txtSoLuongSanPham.Focus();
            }
            else
            {
               
                addProducttoBill();
                if (tempThanhTien > 0)
                {
                    detailProductExpander.Visibility = Visibility.Collapsed;
                }
                tempThanhTien = 0;
            }
        }
        public void LoadAllProduct()
        {
            var queryAllProduct = from sanpham in qLNSEntities.SANPHAMs
                                  join danhmuc in qLNSEntities.DANHMUCs
                                  on sanpham.idDM equals danhmuc.idDM
                                  orderby sanpham.idSP
                                  select new
                                  {
                                      idSP = sanpham.idSP,
                                      MaSP = sanpham.MaSP,
                                      TenSP = sanpham.TenSP,
       
                                      TenDM = danhmuc.TenDM,
                                      MoTa = sanpham.MoTa,
                                  };

            productDataGrid.ItemsSource = queryAllProduct.ToList();
        }

        public void SetValues()
        {
            MessageBox.Show("OKOKK");
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
                        //txtSoLuongSanPham.Focus();
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
            if(sl > 0 ) 
            {
                btnSub.IsEnabled = true;
            }
            
        }

        private int TongSoLuongSP = 0;
        private decimal TongTienNH = 0;
        private void addProducttoBill()
        {
            //MessageBox.Show(tempThanhTien.ToString());
            if(textBoxDonGia.Text == "")
            {
                //var selectedProduct = (dynamic)productDataGrid.SelectedItem;
                //detailProductExpander.Visibility = Visibility.Visible;
                //detailProductExpander.IsExpanded = true;
                //idSP = selectedProduct.idSP;
                //headerProductExpander.Text = selectedProduct.TenSP;
                Message message = new Message();
                message.message.Text = "Vui lòng nhập một số nguyên!";
                message.ShowDialog();
            }
            else
            {
                productListBox.Items.Add(new ImportItemListBox(
                    idSP,
                    headerProductExpander.Text,
                    SLSPNH,
                    Convert.ToDecimal(textBoxDonGia.Text),
                    tempThanhTien));

                TongSoLuongSP = TongSoLuongSP + SLSPNH;
                lblSoLuongNhapHang.Text = TongSoLuongSP.ToString();
                TongTienNH = TongTienNH + tempThanhTien;
                lblTongTienNhapHang.Text = TongTienNH.ToString();

                btnNext.IsEnabled = true;
            }
        }
        

        private void txtSoLuongSanPham_KeyDown(object sender, KeyEventArgs e)
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

        private void txtSoLuongSanPham_LostFocus(object sender, RoutedEventArgs e)
        {
            GetValueSoLuongSP();
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
            MessageBox.Show(tempThanhTien.ToString());
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
            Message message = new Message();
            message.message.Text = "Thêm đơn nhập hàng thành công";
            importProductManage.LoadData(importProductManage.pageNumber);
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
            nhaphang.idND = this.idND;
            
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
            ctsp.TinhTrang = 1;
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
                    product.TinhTrang = 0;
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

        private void textBoxDonGia_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!int.TryParse(textBoxDonGia.Text, out _) && textBoxDonGia.Text != "") 
            {
                textBoxDonGia.Clear();
                Message message = new Message();
                message.message.Text = "Vui lòng nhập số nguyên dương!";
                message.ShowDialog();
            }
            else if(int.TryParse(textBoxDonGia.Text, out _))
            {
                ThanhTienSP = SLSPNH * Convert.ToDecimal(textBoxDonGia.Text);
                lblThanhTienSanPham.Text = ThanhTienSP.ToString();
                tempThanhTien = ThanhTienSP;
            }
        }

        decimal tempThanhTien;
        private void txtSoLuongSanPham_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!int.TryParse(txtSoLuongSanPham.Text, out _) && txtSoLuongSanPham.Text != "")
            {
                txtSoLuongSanPham.Clear();
                Message message = new Message();
                message.message.Text = "Vui lòng nhập số nguyên dương!";
                message.ShowDialog();
            }
            else if (int.TryParse(txtSoLuongSanPham.Text, out _) && isTextChanged)
            {
                SLSPNH = short.Parse(txtSoLuongSanPham.Text);
                ThanhTienSP = SLSPNH * Convert.ToDecimal(textBoxDonGia.Text);
                tempThanhTien = ThanhTienSP;
                lblThanhTienSanPham.Text = ThanhTienSP.ToString();
                CheckInputSoLuong(SLSPNH);
            }
        }
    }
}
