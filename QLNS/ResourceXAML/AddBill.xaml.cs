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
    /// Interaction logic for AddBill.xaml
    /// </summary>
    public partial class AddBill : Window
    {
        public AddBill()
        {
            InitializeComponent();
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

        private void addBill_Loaded(object sender, RoutedEventArgs e)
        {
            LoadAllProduct();
        }

        // End: Button Close | Restore | Minimize

        QLNSEntities qLNSEntities = new QLNSEntities();

        private void LoadAllProduct()
        {
            var queryAllProduct = from sanpham in qLNSEntities.SANPHAMs
                                  join ctsp in qLNSEntities.CTSPs
                                  on sanpham.idSP equals ctsp.idSP
                                  orderby ctsp.idCTSP
                                  where ctsp.SLConLai > 0
                                  select new
                                  {
                                      MaSP = ctsp.MaCTSP,
                                      TenSP = sanpham.TenSP,
                                      SLCL = ctsp.SLConLai,
                                      DonGia = ctsp.DonGiaXuat,
                                      GhiChu = ctsp.GhiChu,
                                  };

            allProductDataGrid.ItemsSource = queryAllProduct.ToList();
        }

        private string searchterm = null;
        private int isSearch = 0;
        private void txtSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                searchterm = txtSearch.Text.ToLower();
                if (searchterm == null)
                {
                    //Khong tim kiem
                    isSearch = 0;
                }
                else
                {
                    FilterData(searchterm);
                    isSearch = 1;
                }
            }
        }

        private void FilterData(string searchTerm)
        {
            var queryFilterProduct = from sanpham in qLNSEntities.SANPHAMs
                                     join ctsp in qLNSEntities.CTSPs
                                     on sanpham.idSP equals ctsp.idSP
                                     orderby ctsp.idCTSP
                                     where
                                     ctsp.SLConLai > 0 &&
                                     (ctsp.MaCTSP.ToLower().Contains(searchTerm)
                                     || sanpham.TenSP.ToLower().Contains(searchTerm)
                                     || ctsp.GhiChu.ToLower().Contains(searchTerm))
                                     select new
                                     {
                                         MaSP = ctsp.MaCTSP,
                                         TenSP = sanpham.TenSP,
                                         SLCL = ctsp.SLConLai,
                                         DonGia = ctsp.DonGiaXuat,
                                         GhiChu = ctsp.GhiChu,
                                     };

            if (queryFilterProduct.ToList().Count > 0 )
            {
                if (searchTerm == "")
                {
                    allProductTabItem.Header = "Tất cả sản phẩm";
                }
                else
                {
                    allProductTabItem.Header = "Kết quả tìm kiếm";
                }

                allProductDataGrid.ItemsSource = queryFilterProduct.ToList();
            }
            else
            {
                // Khong tim thay san pham
                allProductDataGrid.ItemsSource = queryFilterProduct.ToList();
            }

        }

        private void allProductDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (allProductDataGrid.SelectedItems.Count > 0)
            {
                var selectedSanPham = (dynamic)allProductDataGrid.SelectedItems[0];
                string selectedId = selectedSanPham.MaSP;

                productExpander.Visibility = Visibility.Visible;
                GetDataSelected(selectedId);
            }
            else
            {
                productExpander.Visibility = Visibility.Collapsed;
            }
        }

        private int SLSPCL = 0;
        private int SLSP = 0;
        private decimal DonGia = 0;

        private void GetDataSelected(string maSP)
        {
            if (maSP != "")
            {
                var queryProduct = from sanpham in qLNSEntities.SANPHAMs
                                   join ctsp in qLNSEntities.CTSPs
                                   on sanpham.idSP equals ctsp.idSP
                                   orderby ctsp.idCTSP
                                   where
                                   ctsp.MaCTSP.ToLower().Contains(maSP)
                                   select new
                                   {
                                       idSP = ctsp.idCTSP,
                                       MaSP = ctsp.MaCTSP,
                                       TenSP = sanpham.TenSP,
                                       SLCL = ctsp.SLConLai,
                                       SLDB = ctsp.DaBan,
                                       DonGia = ctsp.DonGiaXuat,
                                       GhiChu = ctsp.GhiChu,
                                   };

                var selectedProduct = queryProduct.FirstOrDefault();
                if (selectedProduct != null)
                {
                    headerExpander.Text = selectedProduct.TenSP;
                    lblSLDaBan.Text = string.Format("{0} {1}", "Đã bán", selectedProduct.SLDB.ToString());
                    lblSLConLai.Text = string.Format("{0} {1}", "Còn lại", selectedProduct.SLCL.ToString());
                    lblDonGia.Text = selectedProduct.DonGia.ToString();
                    DonGia = selectedProduct.DonGia;
                    lblMoTa.Text = selectedProduct.GhiChu;
                    SLSPCL = selectedProduct.SLCL;
                    SLSP = 0;
                    txtSoLuong.Text = SLSP.ToString();
                    lblThanhTien.Text = "0";
                    CheckInputSoLuong(SLSP);
                }
            }
        }

        private void txtSoLuong_KeyDown(object sender, KeyEventArgs e)
        {
            if (txtSoLuong.Text == "0")
            {
                txtSoLuong.Text = "";
                btnSub.IsEnabled = false;
            }

            if (e.Key == Key.Enter)
            {
                GetValueSoLuong();
            }
        }

        private void txtSoLuong_LostFocus(object sender, RoutedEventArgs e)
        {
            GetValueSoLuong();
        }

        private void CheckInputSoLuong (int sl)
        {
            if (sl <= 0)
            {
                btnSub.IsEnabled = false;
            }
            else if (sl >= SLSPCL)
            {
                btnAdd.IsEnabled = false;
            }
            else
            {
                btnAdd.IsEnabled = true;
                btnSub.IsEnabled = true;
            }
        }

        private void GetValueSoLuong()
        {
            if (txtSoLuong.Text == "")
            {
                MessageBox.Show("Vui long nhap so luong");
            }
            else
            {
                try
                {
                    int soLuongInput = int.Parse(txtSoLuong.Text);
                    if (soLuongInput <= 0)
                    {
                        MessageBox.Show("Vui long nhap so luong lon hon 0");
                        txtSoLuong.Focus();
                        txtSoLuong.Text = SLSP.ToString();
                    }
                    else if (soLuongInput > SLSPCL)
                    {
                        MessageBox.Show("Kho khong the cung cap so luong nay");
                        txtSoLuong.Focus();
                        txtSoLuong.Text = SLSP.ToString();
                    }
                    else
                    {
                        SLSP = soLuongInput;
                        txtSoLuong.Text = SLSP.ToString();
                        lblThanhTien.Text = (SLSP * DonGia).ToString();
                    }
                }
                catch (FormatException)
                {
                    MessageBox.Show("Invalid input. Please enter a valid integer.");
                    txtSoLuong.Text = SLSP.ToString();
                }
                CheckInputSoLuong(SLSP);
            }
        }

        private void btnSub_Click(object sender, RoutedEventArgs e)
        {
            SLSP--;
            txtSoLuong.Text = SLSP.ToString();
            lblThanhTien.Text = (SLSP * DonGia).ToString();
            CheckInputSoLuong(SLSP);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            SLSP++;
            txtSoLuong.Text = SLSP.ToString();
            lblThanhTien.Text = (SLSP * DonGia).ToString();
            CheckInputSoLuong(SLSP);
        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            addProducttoBill();
        }

        private void addProducttoBill()
        {

        }

        private void btnCheckOut_Click(object sender, RoutedEventArgs e)
        {

        }

    }
}
