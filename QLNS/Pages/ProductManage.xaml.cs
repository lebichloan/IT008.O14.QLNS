﻿using QLNS.Model;
using QLNS.ResourceXAML;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for ProductManage.xaml
    /// </summary>
    public class StatusProductConvert : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            int status = (int)value;
            if (status == 0)
            {
                return "Đã bán hết";
            }
            else if (status == 1)
            {
                return "Còn hàng";
            }
            else if (status == 2)
            {
                return "Đã ẩn";
            }
            else if (status == 3)
            {
                return "Ngừng bán";
            } 
            else
            {
                return null;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string status = value.ToString();
            return status;
        }
    }
    public partial class ProductManage : Page
    {
        public class ErrorProduct
        {
            public int idSPL { get; set; }
            

            public string maSPL { get; set; }
            public string tenSPL { get; set; }
            public string chitietloi { get; set; }
            public short soluongloi { get; set; }
            public DateTime ngayloi { get; set; }
            public string danhmuc { get; set; }

            public int idctsp { get; set; }

        }
        public class Product
        {
            public int idSP {  get; set; }
            public int idCTSP { get; set; }
            public string MaSP { get; set; }
            public string MaCTSP {  get; set; }

            public string TenSP { get; set; }
            public string MoTa { get; set; }
            public int TinhTrang {  get; set; }
            public int DaBan {  get; set; }
            public int SoLuongLoi {  get; set; }
            public decimal DonGiaNhap {  get; set; }
            public decimal DonGiaXuat {  get; set; }
            public int SoLuongConLai {  get; set; }
            
            public string TenDM { get; set; }
        }


        QLNSEntities qLNSEntities = new QLNSEntities();
        public ProductManage()
        {
            InitializeComponent();
        }

        
        int pageNumber = 0;
        int pageSize = 15;

        private void productManage_Loaded(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu ban đầu khi vừa vào
            
            LoadData(0);
        }
        
        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber--;
            LoadData(pageNumber);
        }
        public void LoadDataCurrent()
        {
            LoadData(pageNumber);
            LoadCategory(categoryPageNumber);
            LoadErrorProduct(errorProductPage);
        }
        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            pageNumber++;
            LoadData(pageNumber);
        }

        private void LoadData(int page)
        {
            var query =
                from ctsp in qLNSEntities.CTSPs
                join sanpham in qLNSEntities.SANPHAMs
                on ctsp.idSP equals sanpham.idSP
                join danhmuc in qLNSEntities.DANHMUCs
                on sanpham.idDM equals danhmuc.idDM

                orderby ctsp.MaCTSP
                select new Product
                {
                    idSP = sanpham.idSP,
                    idCTSP = ctsp.idCTSP,
                    MaSP = sanpham.MaSP,
                    MaCTSP = ctsp.MaCTSP,
                    TenSP = sanpham.TenSP,
                    MoTa = sanpham.MoTa,
                    TinhTrang = ctsp.TinhTrang,
                    DaBan = ctsp.DaBan,
                    DonGiaNhap = ctsp.DonGiaNhap,
                    SoLuongLoi = ctsp.SoLuongLoi,
                    DonGiaXuat = ctsp.DonGiaXuat,
                    SoLuongConLai = ctsp.SLConLai,
                    TenDM = sanpham.DANHMUC.TenDM,
                };

            productDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }





        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QLNSEntities"].ToString();
            if (connectionString.ToLower().StartsWith("metadata="))
            {
                System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder efBuilder = new System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder(connectionString);
                connectionString = efBuilder.ProviderConnectionString;
            }
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            

            if (productDataGrid.SelectedItems.Count > 0)
            {
                // get id hoa don duoc chon
                var selectedSanPham = (dynamic)productDataGrid.SelectedItem;
                string selectedMaCTSP = selectedSanPham.MaCTSP;
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Xác nhận xóa sản phẩm có mã " + selectedMaCTSP + "?";
                messageOption.ShowDialog();
                bool isUpdate = MessageOption.isAgree;
                messageOption.Close();
                if (isUpdate)
                {
                    sqlCommand.CommandText = "DELETE FROM CTSP WHERE MaCTSP = '" + selectedMaCTSP + "'";
                    try
                    {
                        sqlConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                    }
                    catch
                    {
                        
                    }
                    finally { sqlConnection.Close(); }
                }
                LoadData(pageNumber);
                
            }
                

        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            AddNewProduct addNewProduct = new AddNewProduct(); 
            addNewProduct.ShowDialog();
        }

        private void btnDetail_Click(object sender, RoutedEventArgs e)
        {
            try 
            {
                Product product = (Product)productDataGrid.SelectedItem;
                DetailProduct detail = new DetailProduct();
                detail.productManage = this;
                detail.idSP = product.idSP;
                detail.idCTSP = product.idCTSP;

                List<TextBlock> danhmucItems = new List<TextBlock>();
                foreach (var danhmuc in DataProvider.Ins.DB.DANHMUCs)
                {
                    TextBlock textBlock = new TextBlock();
                    textBlock.Text = danhmuc.TenDM;
                    danhmucItems.Add(textBlock);
                }
                detail.LoaiSP.ItemsSource = danhmucItems;

                detail.TenSP.Text = product.TenSP.ToString();
                detail.GiaBan.Text = product.DonGiaXuat.ToString();
                detail.GiaNhap.Text = product.DonGiaNhap.ToString();
                detail.SLCL.Text = product.SoLuongConLai.ToString();
                detail.SLDB.Text = product.DaBan.ToString();
                detail.TinhTrang.SelectedIndex = product.TinhTrang;
                detail.LoaiSP.Text = product.TenDM.ToString();

                if (product.MoTa == null)
                {
                    detail.MoTa.Text = "";
                }
                else
                {
                    detail.MoTa.Text = product.MoTa.ToString();
                }

                detail.ShowDialog();
            }
            catch { }
        }

        
        //Product Error Tab
        

        private void btnPreErrorTab_Click(object sender, RoutedEventArgs e)
        {
            errorProductPage--;
            LoadErrorProduct(errorProductPage);
        }

        private void btnNextErrorTab_Click(object sender, RoutedEventArgs e)
        {
            errorProductPage++;
            LoadErrorProduct(errorProductPage);
        }

        

        private void errorProductTabItem_Loaded(object sender, RoutedEventArgs e)
        {
            LoadErrorProduct(0);
            
        }
        private int errorProductPage = 0;
        private void LoadErrorProduct(int page)
        {
            var query =
                from spl in qLNSEntities.SANPHAMLOIs
                


                
                join ctsp in qLNSEntities.CTSPs
                on spl.idCTSP equals ctsp.idCTSP
                join sanpham in qLNSEntities.SANPHAMs
                on ctsp.idSP equals sanpham.idSP
                join danhmuc in qLNSEntities.DANHMUCs
                on sanpham.idDM equals danhmuc.idDM
                orderby spl.MaSPL
                //where hoadon.idHD == 0
                select new
                {
                    idSPL = spl.idSPL,
                    maSPL = spl.MaSPL,
                    tenSPL = sanpham.TenSP,
                    chitietloi = spl.ChiTietLoi,
                    soluongloi = spl.SoLuongLoi,
                    ngayloi = spl.NgayLoi,
                    danhmuc = danhmuc.TenDM,
                    idctsp = spl.idCTSP,
                };

            errorProductDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPreErrorTab.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNextErrorTab.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPageErrorTab.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnErrorDetail_Click(object sender, RoutedEventArgs e)
        {
            {
                var errorProduct = (dynamic)errorProductDataGrid.SelectedItem;
                DetailErrorProduct detailErrorProduct = new DetailErrorProduct();

                detailErrorProduct.productManage = this;
                detailErrorProduct.idSPL = errorProduct.idSPL;
                detailErrorProduct.idCTSP = errorProduct.idctsp;



                detailErrorProduct.TenSP.Text = errorProduct.tenSPL;
                detailErrorProduct.SL.Text = errorProduct.soluongloi.ToString();
                detailErrorProduct.NgayLoi.SelectedDate = errorProduct.ngayloi;


                if (errorProduct.chitietloi == null)
                {
                    detailErrorProduct.ChiTietLoi.Text = "";
                }
                else
                {
                    detailErrorProduct.ChiTietLoi.Text = errorProduct.chitietloi.ToString();
                }

                detailErrorProduct.ShowDialog();
            }
        }

        private void btnErrorDelete_Click(object sender, RoutedEventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QLNSEntities"].ToString();
            if (connectionString.ToLower().StartsWith("metadata="))
            {
                System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder efBuilder = new System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder(connectionString);
                connectionString = efBuilder.ProviderConnectionString;
            }
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            SqlCommand sqlCommand1 = sqlConnection.CreateCommand();
            SqlCommand sqlCommand2 = sqlConnection.CreateCommand();


            if (errorProductDataGrid.SelectedItems.Count > 0)
            {
                // get id hoa don duoc chon
                var selectedSanPhamLoi = (dynamic)errorProductDataGrid.SelectedItem;
                string selectedMaSPL = selectedSanPhamLoi.MaSPL;
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Xác nhận xóa sản phẩm lỗi có mã " + selectedMaSPL + "?";
                messageOption.ShowDialog();
                bool isUpdate = MessageOption.isAgree;
                messageOption.Close();
                if (isUpdate)
                {
                    sqlCommand1.CommandText = "DELETE FROM SANPHAMLOI WHERE MaSPL = '" + selectedMaSPL + "'";
                    sqlCommand2.CommandText = "UPDATE CTSP SET SoLuongLoi = SoLuongLoi - " + selectedSanPhamLoi.soluongloi + ", SLConLai = SLConLai + " + selectedSanPhamLoi.soluongloi + ", WHERE idCTSP = " + selectedSanPhamLoi.idCTSP;
                    try
                    {
                        sqlConnection.Open();
                        sqlCommand1.ExecuteNonQuery();
                        sqlCommand2.ExecuteNonQuery();
                    }
                    catch
                    {

                    }
                    finally { sqlConnection.Close(); }
                }
                LoadErrorProduct(errorProductPage);

            }
        }

        //Category tab


        int categoryPageNumber = 0;
        private void LoadCategory(int page)
        {
            var query =
                from danhmuc in qLNSEntities.DANHMUCs
                orderby danhmuc.MaDM
                //where hoadon.idHD == 0
                select new
                {
                    maDM = danhmuc.MaDM,
                    tenDM = danhmuc.TenDM,
                    mota = danhmuc.MoTa,
                };

            categoryDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPreCategory.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNextCategory.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblCategoryPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnPreCategory_Click(object sender, RoutedEventArgs e)
        {
            categoryPageNumber++;
            LoadCategory(categoryPageNumber);
        }

        private void btnNextCategory_Click(object sender, RoutedEventArgs e)
        {
            categoryPageNumber--;
            LoadCategory(categoryPageNumber);
        }
        

        private void btnDeleteCategory_Click(object sender, RoutedEventArgs e)
        {

        }

        private void categoryTabItem_Loaded(object sender, RoutedEventArgs e)
        {
            LoadCategory(0);
        }

        private void btnAddErrorProduct_Click(object sender, RoutedEventArgs e)
        {
            AddErrorProduct addErrorProduct = new AddErrorProduct();
            addErrorProduct.ShowDialog();
        }

        private void btnAddCategory_Click(object sender, RoutedEventArgs e)
        {
            AddCategory addCategory = new AddCategory(); 
            addCategory.ShowDialog();
        }

        private void productTabItem_Selected(object sender, RoutedEventArgs e)
        {
            LoadData(0);
            pageNumber = 0;
            btnAddErrorProduct.Visibility = Visibility.Collapsed;
            btnAddCategory.Visibility = Visibility.Collapsed;
            btnAddProduct.Visibility = Visibility.Visible;

        }

        private void errorProductTabItem_Selected(object sender, RoutedEventArgs e)
        {
            LoadErrorProduct(0);
            errorProductPage = 0;
            btnAddProduct.Visibility = Visibility.Collapsed;
            btnAddCategory.Visibility = Visibility.Collapsed;
            btnAddErrorProduct.Visibility = Visibility.Visible;

        }

        private void categoryTabItem_Selected(object sender, RoutedEventArgs e)
        {
            LoadCategory(0);
            categoryPageNumber = 0;
            btnAddCategory.Visibility = Visibility.Visible;
            btnAddProduct.Visibility = Visibility.Collapsed;
            btnAddErrorProduct.Visibility = Visibility.Collapsed;
        }

        
    }
}
