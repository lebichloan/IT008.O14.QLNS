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
using QLNS.ViewModel;

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
        public void LoadDataCustomerCurrent()
        {
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
            var query = DataProvider.Ins.DB.KHACHHANGs.OrderBy(khachhang => khachhang.idKH);
            CustomerDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
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

        private void btnAddCustomerTypes_Click(object sender, RoutedEventArgs e)
        {
            AddCustomerType addCustomerType = new AddCustomerType();
            addCustomerType.ShowDialog();
        }

        private void btnDetailCustommer_Click(object sender, RoutedEventArgs e)
        {
            try {
                KHACHHANG khachhang = (KHACHHANG)CustomerDataGrid.SelectedItem;
                DetailCustomer detail = new DetailCustomer();
                detail.customerManage = this;
                detail.idKH = khachhang.idKH;
                detail.TenKH.Text = khachhang.TenKH.ToString();
                detail.GioiTinh.Text = khachhang.GioiTinh.ToString();

                if (khachhang.NgaySinh.HasValue)// can null
                {
                    DateTime temp = khachhang.NgaySinh.Value;
                    detail.NgaySinh.Text = temp.ToString("dd/MM/yyyy");
                }
                else
                    detail.NgaySinh.Text = "";

                if(khachhang.DiaChi == null)// can null
                {
                    detail.DiaChi.Text = "";
                }
                else
                {
                    detail.SDT.Text = khachhang.SDT.ToString();
                }

                detail.NgayTG.Text = khachhang.NgayTG.ToString("dd/MM/yyyy");
                detail.DTL.Text = khachhang.DiemTichLuy.ToString();
                detail.LoaiKH.Text = khachhang.idLKH.ToString();
                detail.ShowDialog();
            } 
            catch { }
            
        }
    }
}
