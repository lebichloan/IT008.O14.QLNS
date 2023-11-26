using QLNS.Model;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
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
    /// Interaction logic for AddStaffAndUser.xaml
    /// </summary>

    public partial class AddStaffAndUser : Window
    {
        private string password { get; set; }
        private string confirmPassword { get; set; }
        public AddStaffAndUser()
        {
            InitializeComponent();
            password = string.Empty;
            confirmPassword = string.Empty;
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

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //Exxeption
                if(tenNV.Text == string.Empty)
                {
                    throw new Exception("Vui lòng nhập tên nhân viên");
                }
                if (gioiTinh.Text == string.Empty)
                {
                    throw new Exception("Vui lòng nhập giới tính của nhân viên");
                }
                if (chucVu.Text == string.Empty)
                {
                    throw new Exception("Vui lòng chức vụ của nhân viên");
                }
                
                // Thêm thông tin nhân viên
                var NHANVIEN = new NHANVIEN()
                {
                    TenNV = tenNV.Text,
                    GioiTinh = gioiTinh.Text,
                    TinhTrang = 1,
                    ChucVu = chucVu.Text,
                };
                if(ghiChu.Text != string.Empty)
                {
                    NHANVIEN.GhiChu = ghiChu.Text;
                }
                if(diaChi.Text != string.Empty)
                {
                    NHANVIEN.DiaChi = diaChi.Text;
                }
                if (sDT.Text != string.Empty)
                {
                    if (sDT.Text.Length > 10)
                    {
                        throw new Exception("Số điện thoại tối đa 10 ký tự");
                    }
                    else
                    {
                        NHANVIEN.SDT = sDT.Text;
                    }
                }
                if (ngaySinh.SelectedDate.HasValue) // Not NULL
                {
                    NHANVIEN.NgaySinh = ngaySinh.SelectedDate.Value;
                }
                else
                {
                    NHANVIEN.NgaySinh = DateTime.Parse("01/01/2000");
                }
                if (ngayVL.SelectedDate.HasValue) // Not NULL
                {
                    NHANVIEN.NgayVL = ngayVL.SelectedDate.Value;
                }
                else
                {
                    NHANVIEN.NgayVL = DateTime.Now;
                }
                //Them tai khoản 
                if (addUser_CheckBox.IsChecked == true)
                {
                    // Xử lý ngoại lệ
                    if(taiKhoan.Text == string.Empty)
                    {
                        throw new Exception("Vui lòng nhập thông tin tên đăng nhập");
                    }
                    if(taiKhoan.Text.Length > 50)
                    {
                        throw new Exception("Tên đăng nhập tối đa 50 ký tự");
                    }
                    if (!IsAddUser(taiKhoan.Text))
                    {
                        throw new Exception("Tên đăng nhập đã được sử dụng");
                    }
                    if(password == string.Empty)
                    {
                        throw new Exception("Vui lòng nhập thông tin mật khẩu");
                    }
                    if (confirmPassword == string.Empty)
                    {
                        throw new Exception("Vui lòng nhập lại mật khẩu");
                    }
                    if (idLND.Text == string.Empty)
                    {
                        throw new Exception("Vui lòng chọn chức năng của tài khoản");
                    }
                    if(password != confirmPassword)
                    {
                        throw new Exception("Mật khẩu xác nhận không đúng");
                    }
                    if (!IsUserValid(taiKhoan.Text))
                    {
                        throw new Exception("Tên đăng nhập không được chứa khoảng trắng");
                    }
                    if(!IsPasswordValid(password))
                    {
                        throw new Exception("Mật khẩu phải chứa ít nhất 8 ký tự(chữ cái hoặc số), và không chứa khoảng trắng");
                    }
                    // không xảy ra ngoại lệ
                    DataProvider.Ins.DB.NHANVIENs.Add(NHANVIEN);
                    DataProvider.Ins.DB.SaveChanges();
                    int IDNV = DataProvider.Ins.DB.NHANVIENs.Max(nv => nv.idNV);
                    var NGUOIDUNG = new NGUOIDUNG()
                    {
                        TenDN = taiKhoan.Text,
                        MatKhau = password,
                        NgayTao = DateTime.Now,
                        TinhTrang = 1,
                        idNV = IDNV,
                    };
                    if(idLND.Text == "Quản lý")
                    {
                        NGUOIDUNG.idLND = 1;
                    }
                    else if(idLND.Text == "Thu ngân")
                    {
                        NGUOIDUNG.idLND = 2;
                    }
                    else if(idLND.Text == "Nhân viên kho")
                    {
                        NGUOIDUNG.idLND = 3;
                    }
                    DataProvider.Ins.DB.NGUOIDUNGs.Add(NGUOIDUNG);
                    DataProvider.Ins.DB.SaveChanges();
                }
                MessageBox.Show("Thêm nhân viên thành công");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Thông báo: " + ex.Message);
            }
        }

        private void addUser_CheckBox_Click(object sender, RoutedEventArgs e)
        {
            if(addUser_CheckBox.IsChecked == true) 
            {
                AddInfoUser.Visibility = Visibility.Visible;
            }
            else
            {
                AddInfoUser.Visibility = Visibility.Collapsed;
            }
        }

        private void xacNhanMatKhau_PasswordChanged(object sender, RoutedEventArgs e)
        {
            var cconfirmPassword = (PasswordBox)sender;
            confirmPassword = cconfirmPassword.Password;
        }

        private void matKhau_PasswordChanged(object sender, RoutedEventArgs e)
        {
            var ppassword = (PasswordBox)sender;
            password = ppassword.Password;
        }

        public bool IsPasswordValid(string ppassword)
        {
            // Ít nhất một chữ cái
            bool hasLetter = ppassword.Any(char.IsLetter);

            // Ít nhất một chữ số
            bool hasDigit = ppassword.Any(char.IsDigit);

            // Độ dài từ 8 ký tự trở lên
            bool isLengthValid = ppassword.Length >= 8;

            // Không chứa dấu cách
            bool hasNoSpace = !ppassword.Contains(" ");

            // Kiểm tra tất cả các điều kiện
            return hasLetter && hasDigit && isLengthValid && hasNoSpace;
        }
        public bool IsUserValid(string user)
        {
            // Không chứa dấu cách
            bool hasNoSpace = !user.Contains(" ");
            return hasNoSpace;
        }
        public bool IsAddUser(string user)
        {
            bool existsUser = !DataProvider.Ins.DB.NGUOIDUNGs.Any(nd => nd.TenDN == user);
            return existsUser;
        }
    }
}
