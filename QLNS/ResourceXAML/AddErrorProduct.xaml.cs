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
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for AddErrorProduct.xaml
    /// </summary>
    /// 
    
    public partial class AddErrorProduct : Window
    {
        private int idND = -1;
        public ProductManage productManage {  get; set; }
        
        QLNSEntities qLNSEntities = new QLNSEntities();
        public AddErrorProduct()
        {
            InitializeComponent();
        }
        public AddErrorProduct(int userID)
        {
            InitializeComponent();
            idND = userID;
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

        private List<ErrorItemListBox> listProduct;
        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            listProduct = GetListBoxProduct();

            foreach (ErrorItemListBox item in listProduct)
            {
                SANPHAMLOI spl = CreateErrorProduct(item);
                DataProvider.Ins.DB.SANPHAMLOIs.Add(spl);
                CTSP ctsp = DataProvider.Ins.DB.CTSPs.Find(spl.idCTSP);
                ctsp.SLConLai = (short)(ctsp.SLConLai - spl.SoLuongLoi);
                DataProvider.Ins.DB.SaveChanges();
            }
            Message message = new Message();
            message.message.Text = "Thêm sản phẩm lỗi thành công";
            message.Show();
            productManage.LoadDataCurrent();
            this.Close();
        }
        private SANPHAMLOI CreateErrorProduct(ErrorItemListBox errorItem)
        {
            SANPHAMLOI spl = new SANPHAMLOI();
            spl.idCTSP = errorItem.itemIDCTSP;
            spl.idND = errorItem.idND;
            spl.NgayLoi = errorItem.NgayLoi;
            spl.SoLuongLoi = errorItem.itemSoLuongSPL;
            spl.ChiTietLoi = errorItem.ChiTietLoi;
            spl.GhiChu = "";
            
            

            return spl;
        }
        private List<ErrorItemListBox> GetListBoxProduct()
        {
            List<ErrorItemListBox> tempListProduct = new List<ErrorItemListBox>();

            foreach (ErrorItemListBox item in errorProductListBox.Items)
            {
                ErrorItemListBox errorProductListBoxItem = item as ErrorItemListBox;
                tempListProduct.Add(errorProductListBoxItem);
            }
            listProduct = tempListProduct;
            return listProduct;
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
        private string MaSP = "";
        private int idSP = 0;
        private int SLSPCL = 0;
        private decimal DonGiaSP = 0;
        private short SLSP = 0;
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
                        Message message = new Message();
                        message.message.Text = "Vui lòng nhập số lượng lớn hơn 0";
                        message.Show();
                        txtSoLuongSanPham.Focus();
                    }
                    else if (soLuongSPInput > SLSPCL)
                    {
                        Message message = new Message();
                        message.message.Text = "Số lượng sản phẩm lỗi vượt quá số lượng sản phẩm hiện có";
                        message.Show();
                        txtSoLuongSanPham.Focus();
                    }
                    else
                    {
                        SLSP = soLuongSPInput;
                        ThanhTienSP = DonGiaSP * SLSP;
                    }
                    txtSoLuongSanPham.Text = SLSP.ToString();
                }
                catch (FormatException)
                {
                    Message message = new Message();
                    message.message.Text = "Không thể đổi thành số";
                    message.Show();
                    txtSoLuongSanPham.Text = SLSP.ToString();
                }
                CheckInputSoLuong(SLSP);
            }
        }

        private void CheckInputSoLuong(int sl)
        {
            if (sl <= 0)
            {
                btnSub.IsEnabled = false;
            }
            if (sl >= SLSPCL)
            {
                btnAdd.IsEnabled = false;
            }
            if (sl > 0 && sl < SLSPCL)
            {
                btnAdd.IsEnabled = true;
                btnSub.IsEnabled = true;
            }
        }

        private int TongSoLuongSP = 0;
        private decimal TongTienNH = 0;
        private void addProducttoBill()
        {
            errorProductListBox.Items.Add(new ErrorItemListBox(
                MaSP,
                headerProductExpander.Text,
                idSP,
                SLSP,
                txtChiTietLoi.Text,
                DateTime.Now,
                idND
                ));

            TongSoLuongSP = TongSoLuongSP + SLSP;
            lblSoLuongLoi.Text = TongSoLuongSP.ToString();
            

            btnSave.IsEnabled = true;
        }

        private void btnSub_Click(object sender, RoutedEventArgs e)
        {
            SLSP--;
            txtSoLuongSanPham.Text = SLSP.ToString();
            
            CheckInputSoLuong(SLSP);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            SLSP++;
            txtSoLuongSanPham.Text = SLSP.ToString();
            
            CheckInputSoLuong(SLSP);
        }
        private void txtSoLuongSanPham_KeyDown(object sender, KeyEventArgs e)
        {
            if (txtSoLuongSanPham.Text == "0")
            {
                txtSoLuongSanPham.Text = "";
                btnSub.IsEnabled = false;
            }

            if (e.Key == Key.Enter)
            {
                GetValueSoLuongSP();
            }
        }

        private void txtSoLuongSanPham_LostFocus(object sender, RoutedEventArgs e)
        {
            GetValueSoLuongSP();
        }



        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            if (SLSP <= 0)
            {
                MessageBox.Show("Vui long nhap so luong lon hon 0");
                //txtSoLuongSanPham.Focus();
            }
            else if (SLSP > SLSPCL)
            {
                MessageBox.Show("Kho khong the cung cap so luong nay");
            }
            else
            {
                addProducttoBill();
                detailProductExpander.Visibility = Visibility.Collapsed;
            }
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
                MaSP = selectedProduct.MaSP;
                idSP = selectedProduct.idSP;
                headerProductExpander.Text = selectedProduct.TenSP;
                lblSoLuongDaBan.Text = string.Format("{0} {1}", "Đã bán", selectedProduct.SLDB.ToString());
                SLSPCL = selectedProduct.SLCL;
                lblSoLuongConLai.Text = string.Format("{0} {1}", "Còn lại", SLSPCL.ToString());
                if (selectedProduct.MoTa != "")
                {
                    lblMoTa.Text = selectedProduct.MoTa;
                }
                
                btnSub.IsEnabled = false;
                SLSP = 0;
                txtSoLuongSanPham.Text = SLSP.ToString();
                txtChiTietLoi.Text = "";
                btnAdd.IsEnabled = true;
            }
            else
            {
                detailProductExpander.Visibility = Visibility.Collapsed;
            }
        }

        private string searchTerm = "";
        private int isSearch = 0;
    }
}
