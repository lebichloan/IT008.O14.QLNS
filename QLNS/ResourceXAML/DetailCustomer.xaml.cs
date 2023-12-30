using QLNS.Model;
using QLNS.Pages;
using System;
using System.Collections.Generic;
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
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for DetailCustomer.xaml
    /// </summary>
    public partial class DetailCustomer : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public CustomerManage customerManage { get; set; }
        public int idKH { get; set; }

        private string maKhachHang;
        public string MaKhachHang { get { return maKhachHang; } set { maKhachHang = value; OnPropertyChanged(); } }
        public DetailCustomer()
        {
            InitializeComponent();
            Binding_Combobox();
        }
        private void Binding_Combobox()
        {
            QLNSEntities qlns = new QLNSEntities();
            var query = from lkh in qlns.LOAIKHACHHANGs
                        orderby lkh.idLKH
                        where lkh.idLKH != 0
                        select lkh;

            var loaikh = query.ToList();

            LoaiKH.ItemsSource = loaikh;
            LoaiKH.DisplayMemberPath = "TenLKH";
            LoaiKH.SelectedValuePath = "idLKH";
            List<String> gender = new List<String>();
            gender.Add("Nam");
            gender.Add("Nữ");
            GioiTinh.ItemsSource = gender;
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
            TenKH.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            SDT.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            NgayTG.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            DTL.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void detailCustomer_Loaded(object sender, RoutedEventArgs e)
        {
            DataContext = this;
            KHACHHANG khachhang = DataProvider.Ins.DB.KHACHHANGs.Find(idKH);
            if (khachhang != null)
            {
                MaKhachHang = khachhang.MaKH;
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            QLNSEntities qlns = new QLNSEntities();
            KHACHHANG khachhang = qlns.KHACHHANGs.Find(idKH);
            if (khachhang != null)
            {
                ForceValidation(); //Kiem tra rang buoc khi click button
                if (Validation.GetHasError(TenKH) || Validation.GetHasError(SDT) || Validation.GetHasError(NgayTG) || Validation.GetHasError(DTL))
                {
                    Message message = new Message();
                    message.message.Text = "Đã có lỗi xảy ra! Vui lòng kiểm tra lại thông tin!";
                    message.ShowDialog();
                }
                else
                {
                    try
                    {
                        khachhang.TenKH = TenKH.Text.ToString();
                        khachhang.GioiTinh = GioiTinh.Text.ToString();
                        if (NgaySinh.Text == "")
                        {
                            khachhang.NgaySinh = null;
                        }
                        else
                        {
                            khachhang.NgaySinh = DateTime.Parse(NgaySinh.Text);
                        }

                        khachhang.DiaChi = DiaChi.Text.ToString();
                        khachhang.SDT = SDT.Text.ToString();
                        khachhang.NgayTG = DateTime.Parse(NgayTG.Text);
                        khachhang.DiemTichLuy = int.Parse(DTL.Text);

                        //Lay idLKH tu TenLKH
                        var id = qlns.LOAIKHACHHANGs.SqlQuery($"SELECT * FROM LOAIKHACHHANG WHERE TenLKH = N'{LoaiKH.Text}'").ToList();
                        khachhang.idLKH = int.Parse(id[0].idLKH.ToString());

                        MessageOption messageOption = new MessageOption();
                        messageOption.message.Text = "Bạn có chắc chắn muốn sửa đổi thông tin này?";
                        messageOption.ShowDialog();
                        bool isUpdate = MessageOption.isAgree;
                        messageOption.Close();
                        if (isUpdate)
                        {
                            qlns.SaveChanges();
                            customerManage.LoadDataCustomerCurrent();
                            Message message = new Message();
                            message.message.Text = "Sửa thông tin thành công!";
                            message.ShowDialog();
                        }
                        this.Close();
                    }
                    catch //(Exception ex)
                    {
                        //Message message = new Message();
                        //message.message.Text = ex.Message;
                        //message.ShowDialog();
                    }
                }
            }
        }
    }
}
