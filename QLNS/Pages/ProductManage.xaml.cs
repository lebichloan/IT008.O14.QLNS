using QLNS.Model;
using QLNS.ResourceXAML;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for ProductManage.xaml
    /// </summary>
    public partial class ProductManage : Page
    {
        public class Product
        {
            public int idSP {  get; set; }
            public string MaSP { get; set; }
            public string TenSP { get; set; }
            public string MoTa { get; set; }
            public int idDM { get; set; }
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
                from sanpham in qLNSEntities.SANPHAMs
                orderby sanpham.MaSP
                //where hoadon.idHD == 0
                select new Product
                {
                    idSP = sanpham.idSP,
                    MaSP = sanpham.MaSP,
                    TenSP = sanpham.TenSP,
                    MoTa = sanpham.MoTa,
                    idDM = sanpham.idDM,
                    TenDM = sanpham.DANHMUC.TenDM,
                };

            productDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }


        
        

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

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

                List<TextBlock> danhmucItems = new List<TextBlock>();
                foreach (var danhmuc in DataProvider.Ins.DB.DANHMUCs)
                {
                    TextBlock textBlock = new TextBlock();
                    textBlock.Text = danhmuc.TenDM;
                    danhmucItems.Add(textBlock);
                }
                detail.LoaiSP.ItemsSource = danhmucItems;

                detail.TenSP.Text = product.TenSP.ToString();
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

        

        private void btnDetailCategory_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDeleteCategory_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnPreErrorTab_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnNextErrorTab_Click(object sender, RoutedEventArgs e)
        {

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
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        

        private void categoryTabItem_Loaded(object sender, RoutedEventArgs e)
        {
            LoadCategory(0);
        }

        private void errorProductTabItem_Loaded(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
