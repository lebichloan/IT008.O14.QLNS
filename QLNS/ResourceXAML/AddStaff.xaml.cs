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
    /// Interaction logic for AddStaff.xaml
    /// </summary>

    public partial class AddStaff : Window
    {
        public StaffManage staffManage { get; set; }
        public int idNV { get; set; }
        public AddStaff()
        {
            InitializeComponent();
            Binding_ComboBox();
        }

        private void Binding_ComboBox()
        {
            List<String> gender = new List<String>();
            gender.Add("Nam");
            gender.Add("Nữ");
            GioiTinh.ItemsSource = gender;

            List<String> status = new List<String>();
            status.Add("Nghỉ việc");
            status.Add("Đang làm việc");
            TinhTrang.ItemsSource = status;
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
        private void ForceValidation() //Ham kiem tra rang buoc
        {
            TenNV.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            SDT.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            NgaySinh.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            NgayVL.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            ChucVu.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            GioiTinh.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            TinhTrang.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            ForceValidation();
            if (Validation.GetHasError(TenNV) || Validation.GetHasError(SDT) || Validation.GetHasError(NgaySinh) || Validation.GetHasError(NgayVL) || Validation.GetHasError(ChucVu) || Validation.GetHasError(GioiTinh) || Validation.GetHasError(TinhTrang))
            {
                Message message = new Message();
                message.message.Text = "Đã có lỗi xảy ra! Vui lòng kiểm tra lại thông tin!";
                message.ShowDialog();
            }
            else
            {
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn thêm khách hàng này?";
                messageOption.ShowDialog();
                bool isAdd = MessageOption.isAgree;
                messageOption.Close();
                if (isAdd)
                {
                    NHANVIEN nhanvien = new NHANVIEN();
                    if (nhanvien != null)
                    {
                        try
                        {
                            nhanvien.TenNV = TenNV.Text.ToString();
                            nhanvien.NgaySinh = NgaySinh.SelectedDate.Value;
                            nhanvien.GioiTinh = GioiTinh.Text.ToString();
                            nhanvien.DiaChi = DiaChi.Text.ToString();
                            nhanvien.SDT = SDT.Text.ToString();
                            nhanvien.NgayVL = NgayVL.SelectedDate.Value;
                            nhanvien.ChucVu = ChucVu.Text.ToString();
                            nhanvien.TinhTrang = TinhTrang.SelectedIndex;
                            nhanvien.GhiChu = GhiChu.Text.ToString();

                            DataProvider.Ins.DB.NHANVIENs.Add(nhanvien);
                            DataProvider.Ins.DB.SaveChanges();

                            Message message = new Message();
                            message.message.Text = "Thêm nhân viên thành công!";
                            message.ShowDialog();
                            this.Close();
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
    }
}
