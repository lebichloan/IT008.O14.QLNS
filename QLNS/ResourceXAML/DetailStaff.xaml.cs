using MaterialDesignThemes.Wpf;
using QLNS.Model;
using QLNS.Pages;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Migrations;
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
    /// Interaction logic for DetailStaff.xaml
    /// </summary>
    public partial class DetailStaff : Window
    {
        public StaffManage staffManage { get; set; }
        public int idNV {  get; set; }
        
        public DetailStaff()
        {
            InitializeComponent();
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
        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            NHANVIEN nhanvien = DataProvider.Ins.DB.NHANVIENs.Find(idNV);
            if (nhanvien != null)
            {
                try {
                    //Xử lý để trống thông tin
                    if(TenNV.Text == "")
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
                    if (TinhTrang.Text == "")
                    {
                        throw new Exception("Tình trạng không được để trống");
                    }
                    // Xử lý sai định dạng

                    nhanvien.TenNV = TenNV.Text.ToString();
                    nhanvien.NgaySinh = NgaySinh.SelectedDate.Value;
                    nhanvien.GioiTinh = GioiTinh.Text.ToString();
                    nhanvien.DiaChi = DiaChi.Text.ToString();
                    nhanvien.SDT = SDT.Text.ToString();
                    nhanvien.NgayVL = NgayVL.SelectedDate.Value;
                    nhanvien.ChucVu = ChucVu.Text.ToString();
                    if(TinhTrang.Text == "Nghỉ việc")
                    {
                        NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(x => x.idNV == nhanvien.idNV);
                        if(nguoidung != null)
                        {
                            nguoidung.TinhTrang = 0;
                        }
                        nhanvien.TinhTrang = 0;
                    }
                    else
                    {
                        NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(x => x.idNV == nhanvien.idNV);
                        if (nguoidung != null)
                        {
                            nguoidung.TinhTrang = 1;
                        }
                        nhanvien.TinhTrang = 1;
                    }
                    nhanvien.GhiChu = GhiChu.Text.ToString();

                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn sửa đổi thông tin này?";
                    messageOption.ShowDialog();
                    bool isUpdate = MessageOption.isAgree;
                    messageOption.Close();
                    if (isUpdate)
                    {
                        DataProvider.Ins.DB.SaveChanges();
                        if(staffManage.isSearch == 1)
                        {
                            staffManage.LoadDataCurrentFilter();
                        }
                        else
                        {
                            staffManage.LoadDataCurrent();
                        }
                        Message message = new Message();
                        message.message.Text = "Sửa thông tin thành công!";
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
