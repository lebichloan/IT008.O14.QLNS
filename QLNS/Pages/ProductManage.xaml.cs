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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for ProductManage.xaml
    /// </summary>
    public partial class ProductManage : Page
    {
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
                select new
                {
                    MaSP = sanpham.MaSP,
                    TenSP = sanpham.TenSP,
                    MoTa = sanpham.MoTa,
                    GhiChu = sanpham.GhiChu,
                    idDM = sanpham.idDM,
                    
                };

            productDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void categoryComboBox_DataContextChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            LoadCategory(categoryComboBox.Text, 0);
        }
        private void LoadCategoryComboBox()
        {

            var query =
                from sanpham in qLNSEntities.SANPHAMs
                orderby sanpham.MaSP
                //where hoadon.idHD == 0
                select new 
                {
                    idDM = sanpham.idDM,
                    
                };
            categoryComboBox.ItemsSource = query.Distinct().ToList();
        }
        private void LoadCategory(string categoryName,int page)
        {
            var query =
                from sanpham in qLNSEntities.SANPHAMs
                orderby sanpham.MaSP
                //where hoadon.idHD == 0
                select new
                {
                    idDM = sanpham.idDM,
                };
            productDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }
        private void categoryTabItem_Loaded(object sender, RoutedEventArgs e)
        {
            LoadCategoryComboBox();
        }
    }
}
