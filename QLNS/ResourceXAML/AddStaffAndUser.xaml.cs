using QLNS.Model;
using QLNS.Pages;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
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
using System.Windows.Shapes;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for AddStaffAndUser.xaml
    /// </summary>

    public partial class AddStaffAndUser : Window
    {
        public StaffManage staffManage { get; set; }
        public int idNV { get; set; }
        public AddStaffAndUser()
        {
            InitializeComponent();
        }
        static bool CheckPass(string input)
        {
            if (input.Length <= 8)
            {
                return false;
            }

            if (input.Any(c => !char.IsLetterOrDigit(c)))
            {
                return false;
            }

            return true;
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
        public bool IsValidDateFormat(string dateString)
        {
            bool isValid = false;
            DateTime temp;
            isValid = DateTime.TryParseExact(dateString, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out temp);
            return isValid;
        }
        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            NHANVIEN nhanvien = new NHANVIEN();
            NGUOIDUNG nguoidung = new NGUOIDUNG();
            if (nhanvien != null)
            {
                try
                {
                    //Xử lý để trống thông tin
                    if (TenNV.Text == "")
                    {
                        throw new Exception("Tên nhân viên không được để trống");
                    }
                    if (NgaySinh.Text == "")
                    {
                        throw new Exception("Ngày sinh không được để trống");
                    }
                    if (GioiTinh.Text == "")
                    {
                        throw new Exception("Giới tính không được để trống");
                    }
                    if (NgayVL.Text == "")
                    {
                        throw new Exception("Ngày vào làm không được để trống");
                    }
                    if (ChucVu.Text == "")
                    {
                        throw new Exception("Chức vụ không được để trống");
                    }

                    nhanvien.TenNV = TenNV.Text.ToString();
                    nhanvien.NgaySinh = NgaySinh.SelectedDate.Value;
                    nhanvien.GioiTinh = GioiTinh.Text.ToString();
                    nhanvien.DiaChi = DiaChi.Text.ToString();
                    nhanvien.SDT = SDT.Text.ToString();
                    nhanvien.NgayVL = NgayVL.SelectedDate.Value;
                    nhanvien.ChucVu = ChucVu.Text.ToString();
                    nhanvien.TinhTrang = 1;
                    nhanvien.GhiChu = GhiChu.Text.ToString();

                    if(IsAddUser.IsChecked == true) 
                    {
                        //Rang buoc
                        if (TenDN.Text == string.Empty)
                        {
                            throw new Exception("Tên đăng nhập không được để trống");
                        }
                        if (MatKhau.Password == string.Empty)
                        {
                            throw new Exception("Mật khẩu không được để trống");
                        }
                        if (MatKhauNhapLai.Password == string.Empty)
                        {
                            throw new Exception("Vui lòng nhập lại mật khẩu");
                        }
                        if(MatKhau.Password != MatKhauNhapLai.Password)
                        {
                            throw new Exception("Mật khẩu xác thực không đúng");
                        }

                        nguoidung.TenDN = TenDN.Text.ToString();
                        nguoidung.MatKhau = MatKhauNhapLai.Password;
                        if (LoaiND.Text == "Quản lý")
                            nguoidung.idLND = 1;
                        else if (LoaiND.Text == "Thu Ngân")
                            nguoidung.idLND = 2;
                        else if (LoaiND.Text == "Nhân viên kho")
                            nguoidung.idLND = 3;
                        else
                            throw new Exception("Vui lòng chọn 1 loại người dùng");
                        nguoidung.NgayTao = DateTime.Now;
                        nguoidung.TinhTrang = 1;
                    }
                    

                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn thêm thông tin này?";
                    messageOption.ShowDialog();
                    bool isAdd = MessageOption.isAgree;
                    if (IsAddUser.IsChecked == true)
                    {
                        if (DataProvider.Ins.DB.NGUOIDUNGs.Any(x => x.TenDN == TenDN.Text))
                        {
                            throw new Exception("Tài khoản người dùng đã tồn tại!");
                        }
                    }
                    // Kiểm tra Mật Khẩu
                    if (MatKhau.Password.Length < 8)
                    {
                        throw new Exception("Mật khẩu chứa ít nhất 8 ký tự!");
                    }
                    if (MatKhau.Password.Any(c => !char.IsLetterOrDigit(c)))
                    {
                        throw new Exception("Mật khẩu không chứa các ký tự đặc biệt, chỉ chứa số hoặc chữ");
                    }

                    if (isAdd)
                    {
                        DataProvider.Ins.DB.NHANVIENs.Add(nhanvien);
                        DataProvider.Ins.DB.SaveChanges();
                        if (IsAddUser.IsChecked == true)
                        {
                            nguoidung.idNV = DataProvider.Ins.DB.NHANVIENs.Max(n => n.idNV);
                            DataProvider.Ins.DB.NGUOIDUNGs.Add(nguoidung);
                            DataProvider.Ins.DB.SaveChanges();
                        }
                        staffManage.LoadDataCurrent();
                        Message message = new Message();
                        message.message.Text = "Thêm thông tin thành công!";
                        message.ShowDialog();
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
}
