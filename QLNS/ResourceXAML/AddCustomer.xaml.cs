using QLNS.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    /// Interaction logic for AddCustomer.xaml
    /// </summary>
    public partial class AddCustomer : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private string _MaKH;
        public string makh { get => _MaKH; set { _MaKH = value; OnPropertyChanged(); } }

        private string _TenKH;
        public string tenkh { get => _TenKH; set { _TenKH = value; OnPropertyChanged(); } }

        private DateTime? _NgaySinh;
        public DateTime? ngaysinh { get => _NgaySinh; set => _NgaySinh = value; }

        private string _DiaChi;
        public string diachi { get => _DiaChi; set { _DiaChi = value; OnPropertyChanged(); } }

        private string _SDT;
        public string sdt { get => _SDT; set { _SDT = value; OnPropertyChanged(); } }

        private string _GioiTinh;
        public string gioitinh { get => _GioiTinh; set { _GioiTinh = value; OnPropertyChanged(); } }

        private DateTime _NgayTG;
        public DateTime ngaytg { get => _NgayTG; set { _NgayTG = value; OnPropertyChanged(); } }

        private string _DiemTichLuy;
        public string diemtl { get => _DiemTichLuy; set { _DiemTichLuy = value; OnPropertyChanged(); } }

        private int _LoaiKH;


        public int loaikh { get => _LoaiKH; set { _LoaiKH = value; } }

        public AddCustomer()
        {
            InitializeComponent();
            DataContext = this;
            Binding_ComboBox();
        }

        private void Binding_ComboBox()
        {
            QLNSEntities qlns = new QLNSEntities();
            var query = from lkh in qlns.LOAIKHACHHANGs
                        orderby lkh.idLKH
                        where lkh.idLKH != 0
                        select lkh;

            var loaikh = query.ToList();

            loaiKH.ItemsSource = loaikh;
            loaiKH.DisplayMemberPath = "TenLKH";
            loaiKH.SelectedValuePath = "idLKH";
            List<String> gender = new List<String>();
            gender.Add("Nam");
            gender.Add("Nữ");
            gioiTinh.ItemsSource = gender;
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

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void ForceValidation()
        {
            tenKH.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            gioiTinh.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            sDT.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            loaiKH.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            ngayTG.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            diemTL.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }
        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            ForceValidation();
            if (Validation.GetHasError(tenKH) || Validation.GetHasError(gioiTinh) || Validation.GetHasError(sDT) || Validation.GetHasError(loaiKH) || Validation.GetHasError(ngayTG) || Validation.GetHasError(diemTL))
            {
                Message message = new Message();
                message.message.Text = "Đã có lỗi xảy ra";
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
                    QLNSEntities qlns = new QLNSEntities();
                    var id = qlns.LOAIKHACHHANGs.SqlQuery($"SELECT * FROM LOAIKHACHHANG WHERE TenLKH = N'{loaiKH.Text}'").ToList();

                    tenkh = tenKH.Text;
                    gioitinh = gioiTinh.Text;
                    diachi = diaChi.Text;
                    sdt = sDT.Text;
                    loaikh = int.Parse(id[0].idLKH.ToString());
                    diemtl = diemTL.Text;
                    ngaysinh = ngaySinh.SelectedDate;
                    ngaytg = (DateTime)ngayTG.SelectedDate;

                    var KHACHHANG = new KHACHHANG()
                    {
                        TenKH = tenkh,
                        GioiTinh = gioitinh,
                        DiaChi = diachi,
                        SDT = sdt,
                        DiemTichLuy = int.Parse(diemtl),
                        idLKH = loaikh,
                        NgayTG = ngaytg
                    };

                    if (ngaysinh.HasValue)
                    {
                        KHACHHANG.NgaySinh = ngaysinh.Value;
                    }
                    else
                    {
                        KHACHHANG.NgaySinh = null;
                    }

                    DataProvider.Ins.DB.KHACHHANGs.Add(KHACHHANG);
                    DataProvider.Ins.DB.SaveChanges();

                    Message message = new Message();
                    message.message.Text = "Thêm khách hàng thành công!";
                    message.ShowDialog();

                    this.Close();
                }
                else
                {
                    //Close window
                }
            }
        }
    }
}

