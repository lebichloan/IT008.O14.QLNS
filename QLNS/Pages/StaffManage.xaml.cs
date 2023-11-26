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
    /// Interaction logic for StaffManage.xaml
    /// </summary>
    public partial class StaffManage : Page
    {
        QLNSEntities qLNSEntities = new QLNSEntities();
        public StaffManage()
        {
            InitializeComponent();
        }
        int pageNumber = 0;
        int pageSize = 15;
        private void staffManage_Loaded(object sender, RoutedEventArgs e)
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
                from nhanvien in qLNSEntities.NHANVIENs
                orderby nhanvien.idNV
                //where hoadon.idHD == 0
                select new
                {
                    idNV = nhanvien.idNV,
                    TenNV = nhanvien.TenNV,
                    GioiTinh = nhanvien.GioiTinh,
                    SDT = nhanvien.SDT,
                    DiaChi = nhanvien.DiaChi,
                    NgayVL = nhanvien.NgayVL,
                    ChucVu = nhanvien.ChucVu,
                    TinhTrang = nhanvien.TinhTrang,
                    GhiChu = nhanvien.GhiChu,
                };

            staffDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnAddStaff_Click(object sender, RoutedEventArgs e)
        {
            AddStaffAndUser addStaffAndUser = new AddStaffAndUser();
            addStaffAndUser.ShowDialog();
        }
    }
}
