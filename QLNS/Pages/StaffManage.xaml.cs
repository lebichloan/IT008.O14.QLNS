using QLNS.Controls;
using QLNS.Model;
using QLNS.ResourceXAML;
using QLNS.ViewModel;
using System;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Xml;

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
        int pageSize = 10;
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
            var query = DataProvider.Ins.DB.NHANVIENs.Where(nhanvien => nhanvien.idNV != 0).OrderBy(nhanvien => nhanvien.idNV);
            staffDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnAddStaff_Click(object sender, RoutedEventArgs e)
        {
            AddStaffAndUser addStaffAndUser = new AddStaffAndUser();
            addStaffAndUser.ShowDialog();
        }

        private void btnShowDetail_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                NHANVIEN nhanvien = (NHANVIEN)staffDataGrid.SelectedItem;

                DetailStaff detail = new DetailStaff();
                detail.staffManage = this;
                detail.idNV = nhanvien.idNV;
                detail.TenNV.Text = nhanvien.TenNV;
                detail.NgaySinh.Text = nhanvien.NgaySinh.ToString("dd/MM/yyyy");
                detail.GioiTinh.Text = nhanvien.GioiTinh.ToString();

                if (nhanvien.DiaChi == null)
                    detail.DiaChi.Text = "";
                else
                    detail.DiaChi.Text = nhanvien.DiaChi.ToString();

                if (nhanvien.SDT == null)
                    detail.SDT.Text = "";
                else
                    detail.SDT.Text = nhanvien.SDT.ToString();

                detail.NgayVL.Text = nhanvien.NgayVL.Date.ToString("dd/MM/yyyy");
                detail.ChucVu.Text = nhanvien.ChucVu.ToString();
                detail.TinhTrang.Text = nhanvien.TinhTrang.ToString();

                if (nhanvien.GhiChu == null)
                    detail.GhiChu.Text = "";
                else
                    detail.GhiChu.Text = nhanvien.GhiChu.ToString();
                detail.Show();
            }
            catch
            {
            }
        }
    }
}
