using QLNS.Model;
using QLNS.ResourceXAML;
using System.Data.Entity.Core.Objects;
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
    /// Interaction logic for CustomerManage.xaml
    /// </summary>
    public partial class CustomerManage : Page
    {
        QLNSEntities qlnsEntities = new QLNSEntities();
        public CustomerManage()
        {
            InitializeComponent();
        }

        //Tab item customer
        private void customer_Loaded(object sender, RoutedEventArgs e)
        {
            //Load dữ liệu ban đầu khi vừa vào
            LoadCustomerData(0);
        }

        int pageNumber = 0;
        int pageSize = 10;
        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber--;
            LoadCustomerData(pageNumber);
        }
        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            pageNumber++;
            LoadCustomerData(pageNumber);
        }

        private void LoadCustomerData(int page)
        {
            var query =
                from khachhang in qlnsEntities.KHACHHANGs
                orderby khachhang.idKH
                select new
                {
                    idKH = khachhang.idKH,
                    MaKH = khachhang.MaKH,
                    TenKH = khachhang.TenKH,
                    GioiTinh = khachhang.GioiTinh,
                    NgaySinh = khachhang.NgaySinh,
                    DiaChi = khachhang.DiaChi,
                    SDT = khachhang.SDT,
                    NgayTG = khachhang.NgayTG,
                    DiemTichLuy = khachhang.DiemTichLuy,
                    idLKH = khachhang.idLKH,
                };

            CustomerDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        //Tab item customer type
        private void customerTypes_Loaded(object sender, RoutedEventArgs e)
        {
            //Load dữ liệu ban đầu khi vừa vào
            LoadCustomerTypesData(0);
        }

        int pageNumber1 = 0;
        int pageSize1 = 10;

        private void btnCTPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber1--;
            LoadCustomerTypesData(pageNumber1);
        }
        private void btnCTNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            pageNumber1++;
            LoadCustomerTypesData(pageNumber1);
        }

        private void LoadCustomerTypesData(int page)
        {
            var query =
                from loaikhachhang in qlnsEntities.LOAIKHACHHANGs
                orderby loaikhachhang.idLKH
                select new
                {
                    idLKH = loaikhachhang.idLKH,
                    MaLKH = loaikhachhang.MaLKH,
                    TenLKH = loaikhachhang.TenLKH,
                    MoTa = loaikhachhang.MoTa,
                    DiemTichLuyToiThieu = loaikhachhang.DiemTichLuyToiThieu,
                };

            CustomerTypesDataGrid.ItemsSource = query.Skip(pageSize1 * page).Take(pageSize1).ToList();
            btnCTPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnCTNext.IsEnabled = query.Skip(pageSize1 * (page + 1)).Take(pageSize1).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblCTPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize1 - 1) / pageSize1);

        }

        private void btnAddCustomer_Click(object sender, RoutedEventArgs e)
        {
            AddCustomer addCustomer = new AddCustomer();
            addCustomer.ShowDialog();
        }
    }
}
