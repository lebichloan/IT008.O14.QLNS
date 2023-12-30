using MaterialDesignThemes.Wpf;
using QLNS.Model;
using QLNS.Pages;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity.Migrations;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
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
    public partial class DetailStaff : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public StaffManage staffManage { get; set; }
        public int idNV { get; set; }

        private string maNhanVien;
        public string MaNhanVien { get { return maNhanVien; } set { maNhanVien = value; OnPropertyChanged(); } }

        public DetailStaff()
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

        private void ForceValidation() //Ham kiem tra rang buoc
        {
            TenNV.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            SDT.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            NgaySinh.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            NgayVL.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            ChucVu.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            NHANVIEN nhanvien = DataProvider.Ins.DB.NHANVIENs.Find(idNV);
            if (nhanvien != null)
            {
                ForceValidation(); //Kiem tra rang buoc khi click button
                try
                {
                    if (Validation.GetHasError(TenNV) || Validation.GetHasError(SDT) || Validation.GetHasError(NgaySinh) || Validation.GetHasError(NgayVL) || Validation.GetHasError(ChucVu))
                    {
                        Message message = new Message();
                        message.message.Text = "Đã có lỗi xảy ra! Vui lòng kiểm tra lại thông tin!";
                        message.ShowDialog();
                    }
                    else
                    {
                        nhanvien.TenNV = TenNV.Text.ToString();
                        nhanvien.NgaySinh = NgaySinh.SelectedDate.Value;
                        nhanvien.GioiTinh = GioiTinh.Text.ToString();
                        nhanvien.DiaChi = DiaChi.Text.ToString();
                        nhanvien.SDT = SDT.Text.ToString();
                        nhanvien.NgayVL = NgayVL.SelectedDate.Value;
                        nhanvien.ChucVu = ChucVu.Text.ToString();
                        if (TinhTrang.Text == "Nghỉ việc")
                        {
                            NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(x => x.idNV == nhanvien.idNV);
                            if (nguoidung != null)
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
                            if (staffManage.isSearch == 1)
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

                            this.Close();
                        }
                    }
                }
                catch { }
            }
        }

        private void detailStaff_Loaded(object sender, RoutedEventArgs e)
        {
            DataContext = this;
            NHANVIEN nhanvien = DataProvider.Ins.DB.NHANVIENs.Find(idNV);
            if (nhanvien != null)
            {
                MaNhanVien = nhanvien.MaNV;
            }
        }
    }
}
