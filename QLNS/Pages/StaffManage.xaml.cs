using QLNS.Controls;
using QLNS.Model;
using QLNS.ResourceXAML;
using QLNS.ViewModel;
using System;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Xml;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for StaffManage.xaml
    /// </summary>
    public class StatusConvert : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            int status = (int)value;
            if(status == 0)
            {
                return "Nghỉ việc";
            }
            else if(status == 1)
            {
                return "Đang làm việc";
            }
            else 
            { 
                return null; 
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string status = value.ToString();
            return value;
        }
    }

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
            addStaffAndUser.staffManage = this;
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
                detail.NgaySinh.Text = nhanvien.NgaySinh.ToString();
                detail.GioiTinh.Text = nhanvien.GioiTinh.ToString();

                if (nhanvien.DiaChi == null)
                    detail.DiaChi.Text = "";
                else
                    detail.DiaChi.Text = nhanvien.DiaChi.ToString();

                if (nhanvien.SDT == null)
                    detail.SDT.Text = "";
                else
                    detail.SDT.Text = nhanvien.SDT.ToString();

                detail.NgayVL.Text = nhanvien.NgayVL.Date.ToString();
                detail.ChucVu.Text = nhanvien.ChucVu.ToString();
                if(nhanvien.TinhTrang == 0)
                {
                    detail.TinhTrang.SelectedIndex = 0;
                }
                else
                {
                    detail.TinhTrang.SelectedIndex = 1;
                }

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
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                NHANVIEN nhanvien = (NHANVIEN)staffDataGrid.SelectedItem;
                NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(n => n.idNV == nhanvien.idNV);

                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn thêm thông tin này?";
                messageOption.ShowDialog();
                bool isAdd = MessageOption.isAgree;
                if (isAdd)
                {
                    if (nguoidung != null)
                    {
                        bool IsDelete = true;
                        if (DataProvider.Ins.DB.HOADONs.Any(hd => hd.idND == nguoidung.idND))
                            IsDelete = false;
                        else if(DataProvider.Ins.DB.KHUYENMAIs.Any(km => km.idND == nguoidung.idND))
                            IsDelete = false;
                        else if(DataProvider.Ins.DB.NHAPHANGs.Any(nh => nh.idND == nguoidung.idND))
                            IsDelete = false;
                        else if(DataProvider.Ins.DB.SANPHAMLOIs.Any(spl => spl.idND == nguoidung.idND))
                            IsDelete = false;
                        if(IsDelete == false)
                        {
                            Message message = new Message();
                            message.message.Text = "Không thể xóa nhân viên này, vì tồn tại nhiều dữ liệu liên quan!";
                            message.ShowDialog();
                        }
                        else
                        {
                        
                            NGUOIDUNG nd = DataProvider.Ins.DB.NGUOIDUNGs.Find(nguoidung.idND);
                            DataProvider.Ins.DB.NGUOIDUNGs.Remove(nd);
                            DataProvider.Ins.DB.SaveChanges();

                            NHANVIEN nv = DataProvider.Ins.DB.NHANVIENs.Find(nhanvien.idNV);
                            DataProvider.Ins.DB.NHANVIENs.Remove(nv);
                            DataProvider.Ins.DB.SaveChanges();
                            LoadDataCurrent();
                            Message message = new Message();
                            message.message.Text = "Xóa thành công nhân viên!";
                            message.ShowDialog();

                        }
                    }
                    else
                    {
                        NHANVIEN nv = DataProvider.Ins.DB.NHANVIENs.Find(nhanvien.idNV);
                        DataProvider.Ins.DB.NHANVIENs.Remove(nv);
                        DataProvider.Ins.DB.SaveChanges();
                        LoadDataCurrent();
                        Message message = new Message();
                        message.message.Text = "Xóa thành công nhân viên!";
                        message.ShowDialog();
                    }
                }
            }
            catch (Exception ex)
            {
                Message message = new Message();
                message.message.Text = ex.Message;
                message.ShowDialog();
            }
        }
    }
}
