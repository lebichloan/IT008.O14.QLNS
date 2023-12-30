using QLNS.Controls;
using QLNS.Model;
using QLNS.ResourceXAML;
using QLNS.ViewModel;
using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Xml;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for StaffManage.xaml
    /// </summary>
    public class StatusConvert : IValueConverter
    {
        //Convert du lieu hien thi
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            int status = (int)value;
            if (status == 0)
            {
                return "Nghỉ việc";
            }
            else if (status == 1)
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

    public class UserStatusConvert : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            int status = (int)value;
            if (status == 0)
            {
                return "Đã bị khóa";
            }
            else if (status == 1)
            {
                return "Đang hoạt động";
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

    public partial class StaffManage : Page, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        QLNSEntities qLNSEntities = new QLNSEntities();
        public StaffManage()
        {
            InitializeComponent();
        }

        int pageNumber = 0;
        int pageSize = 10;
        int userPageNumber = 0;
        int userPageSize = 10;

        //Start: load staff data
        private void staffManage_Loaded(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu ban đầu khi vừa vào
            LoadData(0);
        }
        public void LoadDataCurrent()
        {
            LoadData(pageNumber);
            if(staffDataGrid.Items.Count == 0)
            {
                pageNumber--;
                LoadData(pageNumber);
            }
        }
        public void LoadDataCurrentFilter()
        {
            FilterData(searchTerm, pageNumberFilter);
        }
        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            if (isSearch == 1)
            {
                pageNumberFilter--;
                FilterData(searchTerm, pageNumberFilter);
            }
            else
            {
                pageNumber--;
                LoadData(pageNumber);
            }
        }

        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            if (isSearch == 1)
            {
                pageNumberFilter++;
                FilterData(searchTerm, pageNumberFilter);
            }
            else
            {
                pageNumber++;
                LoadData(pageNumber);
            }
        }
        private void LoadData(int page)
        {
            //var query = DataProvider.Ins.DB.NHANVIENs.Where(nhanvien => nhanvien.idNV != 0).OrderBy(nhanvien => nhanvien.idNV);
            var query = from nv in qLNSEntities.NHANVIENs
                        orderby nv.idNV
                        select new
                        {
                            idNV = nv.idNV,
                            MaNV = nv.MaNV,
                            TenNV = nv.TenNV,
                            GioiTinh = nv.GioiTinh,
                            SDT = nv.SDT,
                            NgaySinh = nv.NgaySinh,
                            NgayVL = nv.NgayVL,
                            ChucVu = nv.ChucVu,
                            TinhTrang = nv.TinhTrang,
                        };

            staffDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }
        //End: Load staff data

        //Start: FilterDataStaff
        public string searchTerm = null;
        public int pageNumberFilter = 0;
        public int isSearch = 0;
        private void FilterData(string searchTerm, int page)
        {
            var query = DataProvider.Ins.DB.NHANVIENs.Where(nv => nv.TenNV.ToLower().Contains(searchTerm) || nv.GioiTinh.ToLower().Contains(searchTerm) || nv.ChucVu.ToLower().Contains(searchTerm)).OrderBy(nv => nv.idNV);
            staffDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPre.IsEnabled = page > 0;
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any();
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }
        private void StaffSearch_txtbox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                searchTerm = StaffSearch_txtbox.Text.ToLower();
                if (searchTerm == "")
                {
                    LoadData(0);
                    isSearch = 0;
                    pageNumber = 0;
                }
                else
                {
                    FilterData(searchTerm, 0);
                    isSearch = 1;
                    pageNumberFilter = 0;
                }
            }
        }
        //End: FilterDataStaff

        //Start: Load user data
        private void userManage_Loaded(object sender, RoutedEventArgs e)
        {
            LoadUserData(0);
        }

        public void LoadUserDataCurrent()
        {
            LoadUserData(userPageNumber);
            if(userDataGrid.Items.Count == 0)
            {
                userPageNumber--;
                LoadUserData(userPageNumber);
            }
        }

        private void LoadUserData(int page)
        {
            //var query = DataProvider.Ins.DB.NHANVIENs.Where(nhanvien => nhanvien.idNV != 0).OrderBy(nhanvien => nhanvien.idNV);
            var query = from nd in qLNSEntities.NGUOIDUNGs
                        join lnd in qLNSEntities.LOAINGUOIDUNGs on nd.idLND equals lnd.idLND
                        orderby nd.idND
                        select new
                        {
                            idND = nd.idND,
                            MaND = nd.MaND,
                            TenND = nd.TenDN,
                            NgayTao = nd.NgayTao,
                            TinhTrang = nd.TinhTrang,
                            idNV = nd.idNV,
                            idLND = nd.LOAINGUOIDUNG.TenLND
                        };

            userDataGrid.ItemsSource = query.Skip(userPageSize * page).Take(userPageSize).ToArray();
            UserbtnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            UserbtnNext.IsEnabled = query.Skip(userPageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblUserPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + userPageSize - 1) / userPageSize);
        }

        private void UserbtnPre_Click(object sender, RoutedEventArgs e)
        {
            userPageNumber--;
            LoadUserData(userPageNumber);
        }

        private void UserbtnNext_Click(object sender, RoutedEventArgs e)
        {
            userPageNumber++;
            LoadUserData(userPageNumber);
        }
        //End: Load user data

        //Start: btnAdd
        private void btnAddStaff_Click(object sender, RoutedEventArgs e)
        {
            AddStaffAndUser addStaffAndUser = new AddStaffAndUser();
            addStaffAndUser.staffManage = this;
            addStaffAndUser.ShowDialog();
            LoadData(0);
        }
        private void btnAddUser_Click(object sender, RoutedEventArgs e)
        {
            AddUser adduser = new AddUser();
            adduser.ShowDialog();
            LoadUserDataCurrent();
        }
        //End: btnAdd

        //Start: btDelete
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string maNV = ((TextBlock)staffDataGrid.SelectedCells[0].Column.GetCellContent(staffDataGrid.SelectedCells[0].Item)).Text;
                NHANVIEN nhanvien = DataProvider.Ins.DB.NHANVIENs.FirstOrDefault(n => n.MaNV == maNV);

                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn xóa nhân viên này?";
                messageOption.ShowDialog();
                bool isDelete = MessageOption.isAgree;
                messageOption.Close();
                if (isDelete)
                {
                    NHANVIEN nv = DataProvider.Ins.DB.NHANVIENs.Find(nhanvien.idNV);
                    DataProvider.Ins.DB.NHANVIENs.Remove(nv);
                    DataProvider.Ins.DB.SaveChanges();
                    LoadDataCurrent();
                    Message message = new Message();
                    message.message.Text = "Xóa nhân viên thành công!";
                    message.ShowDialog();
                }
                //NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(n => n.idNV == nhanvien.idNV);

                //MessageOption messageOption = new MessageOption();
                //messageOption.message.Text = "Bạn có chắc chắn muốn thêm thông tin này?";
                //messageOption.ShowDialog();
                //bool isAdd = MessageOption.isAgree;
                //if (isAdd)
                //{
                //    if (nguoidung != null)
                //    {
                //        bool IsDelete = true;
                //        if (DataProvider.Ins.DB.HOADONs.Any(hd => hd.idND == nguoidung.idND))
                //            IsDelete = false;
                //        else if (DataProvider.Ins.DB.KHUYENMAIs.Any(km => km.idND == nguoidung.idND))
                //            IsDelete = false;
                //        else if (DataProvider.Ins.DB.NHAPHANGs.Any(nh => nh.idND == nguoidung.idND))
                //            IsDelete = false;
                //        else if (DataProvider.Ins.DB.SANPHAMLOIs.Any(spl => spl.idND == nguoidung.idND))
                //            IsDelete = false;
                //        if (IsDelete == false)
                //        {
                //            Message message = new Message();
                //            message.message.Text = "Không thể xóa nhân viên này, vì tồn tại nhiều dữ liệu liên quan!";
                //            message.ShowDialog();
                //        }
                //        else
                //        {

                //            NGUOIDUNG nd = DataProvider.Ins.DB.NGUOIDUNGs.Find(nguoidung.idND);
                //            DataProvider.Ins.DB.NGUOIDUNGs.Remove(nd);
                //            DataProvider.Ins.DB.SaveChanges();

                //            NHANVIEN nv = DataProvider.Ins.DB.NHANVIENs.Find(nhanvien.idNV);
                //            DataProvider.Ins.DB.NHANVIENs.Remove(nv);
                //            DataProvider.Ins.DB.SaveChanges();
                //            if (isSearch == 1)
                //            {
                //                LoadDataCurrentFilter();
                //            }
                //            else
                //            {
                //                LoadDataCurrent();
                //            }
                //            Message message = new Message();
                //            message.message.Text = "Xóa thành công nhân viên!";
                //            message.ShowDialog();

                //        }
                //    }
                //    else
                //    {
                //        NHANVIEN nv = DataProvider.Ins.DB.NHANVIENs.Find(nhanvien.idNV);
                //        DataProvider.Ins.DB.NHANVIENs.Remove(nv);
                //        DataProvider.Ins.DB.SaveChanges();
                //        if (isSearch == 1)
                //        {
                //            LoadDataCurrentFilter();
                //        }
                //        else
                //        {
                //            LoadDataCurrent();
                //        }
                //        Message message = new Message();
                //        message.message.Text = "Xóa thành công nhân viên!";
                //        message.ShowDialog();
                //    }
                //}
            }
            catch (Exception ex)
            {
                Message message = new Message();
                message.message.Text = ex.Message;
                message.ShowDialog();
            }
        }
        private void btnDeleteUser_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string MaND = ((TextBlock)userDataGrid.SelectedCells[0].Column.GetCellContent(userDataGrid.SelectedCells[0].Item)).Text;
                NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(n => n.MaND == MaND);

                HOADON hoadon = DataProvider.Ins.DB.HOADONs.FirstOrDefault(h => h.idND == nguoidung.idND);
                KHUYENMAI khuyenmai = DataProvider.Ins.DB.KHUYENMAIs.FirstOrDefault(k => k.idND == nguoidung.idND);
                NHAPHANG nhaphang = DataProvider.Ins.DB.NHAPHANGs.FirstOrDefault(n => n.idND == nguoidung.idND);
                SANPHAMLOI sanphamloi = DataProvider.Ins.DB.SANPHAMLOIs.FirstOrDefault(s => s.idND == nguoidung.idND);
                if (hoadon != null || khuyenmai != null || nhaphang != null || sanphamloi != null)
                {
                    Message message = new Message();
                    message.message.Text = "Không thể xóa người dùng này, vì tồn tại nhiều dữ liệu liên quan!";
                    message.ShowDialog();
                }
                else
                {
                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn xóa người dùng này?";
                    messageOption.ShowDialog();
                    bool isDelete = MessageOption.isAgree;
                    messageOption.Close();
                    if (isDelete)
                    {
                        NGUOIDUNG nd = DataProvider.Ins.DB.NGUOIDUNGs.Find(nguoidung.idND);
                        DataProvider.Ins.DB.NGUOIDUNGs.Remove(nd);
                        DataProvider.Ins.DB.SaveChanges();
                        LoadUserDataCurrent();
                        Message message = new Message();
                        message.message.Text = "Xóa người dùng thành công!";
                        message.ShowDialog();
                    }
                }
            }
            catch { }
        }
        //End: btnDelete
        private void btnShowDetail_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                string maNV = ((TextBlock)staffDataGrid.SelectedCells[0].Column.GetCellContent(staffDataGrid.SelectedCells[0].Item)).Text;
                var query = from nv in DataProvider.Ins.DB.NHANVIENs
                            orderby nv.idNV
                            where nv.MaNV == maNV
                            select nv;
                var lst = query.ToList();

                DetailStaff detail = new DetailStaff();
                detail.staffManage = this;
                detail.idNV = lst[0].idNV;
                detail.TenNV.Text = ((TextBlock)staffDataGrid.SelectedCells[1].Column.GetCellContent(staffDataGrid.SelectedCells[1].Item)).Text;
                detail.NgaySinh.SelectedDate = lst[0].NgaySinh;
                detail.GioiTinh.Text = ((TextBlock)staffDataGrid.SelectedCells[2].Column.GetCellContent(staffDataGrid.SelectedCells[2].Item)).Text;

                if (lst[0].DiaChi == "" || lst[0].DiaChi is null)
                {
                    detail.DiaChi.Text = "";
                }
                else
                {
                    detail.DiaChi.Text = lst[0].DiaChi.ToString();
                }

                detail.SDT.Text = ((TextBlock)staffDataGrid.SelectedCells[3].Column.GetCellContent(staffDataGrid.SelectedCells[3].Item)).Text;

                detail.NgayVL.SelectedDate = DateTime.Parse(((TextBlock)staffDataGrid.SelectedCells[4].Column.GetCellContent(staffDataGrid.SelectedCells[4].Item)).Text);
                detail.ChucVu.Text = ((TextBlock)staffDataGrid.SelectedCells[5].Column.GetCellContent(staffDataGrid.SelectedCells[5].Item)).Text;
                //if (nhanvien.TinhTrang == 0)
                //{
                //    detail.TinhTrang.SelectedIndex = 0;
                //}
                //else
                //{
                //    detail.TinhTrang.SelectedIndex = 1;
                //}
                detail.TinhTrang.Text = ((TextBlock)staffDataGrid.SelectedCells[6].Column.GetCellContent(staffDataGrid.SelectedCells[6].Item)).Text;
                if (lst[0].GhiChu == "")
                    detail.GhiChu.Text = "";
                else
                    detail.GhiChu.Text = lst[0].GhiChu;
                detail.ShowDialog();

                LoadDataCurrent();
            }
            catch
            {
            }
        }

        private void UserSearch_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
        private void btnShowUserDetail_Click(object sender, RoutedEventArgs e)
        {
            if (userDataGrid.SelectedItems.Count > 0)
            {
                var selectedItem = (dynamic)userDataGrid.SelectedItem;
                int selectedId = selectedItem.idND;

                DetailAccount detailAccount = new DetailAccount(selectedId);
                detailAccount.ShowDialog();
                LoadUserDataCurrent();
            }
        }
        private string pagetitle;
        public string PageTitle { get { return pagetitle; } set { pagetitle = value; OnPropertyChanged(); } }
        private void StaffTab_Selected(object sender, RoutedEventArgs e)
        {
            btnAddBill.Visibility = Visibility.Visible;
            btnAddUser.Visibility = Visibility.Collapsed;
            pageTitle.Text = "Quản lý nhân viên";
            pageTitle.DataContext = this;
        }
        private void UserTab_Selected(object sender, RoutedEventArgs e)
        {
            btnAddBill.Visibility = Visibility.Collapsed;
            btnAddUser.Visibility = Visibility.Visible;
            pageTitle.Text = "Quản lý người dùng";
            pageTitle.DataContext = this;
        }


    }
}
