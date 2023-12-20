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
    /// Interaction logic for AddSale.xaml
    /// </summary>
    public partial class AddSale : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private string _MaKM;
        public string makm { get => _MaKM; set { _MaKM = value; } }

        private string _TenKM;
        public string tenkm { get => _TenKM; set { _TenKM = value; OnPropertyChanged(); } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; OnPropertyChanged(); } }

        private int _LoaiKH;
        public int loaikh { get => _LoaiKH; set { _LoaiKH = value; OnPropertyChanged(); } }

        private DateTime _NgayBatDau;
        public DateTime ngaybd { get => _NgayBatDau; set { _NgayBatDau = value; OnPropertyChanged(); } }

        private DateTime _NgayKetThuc;
        public DateTime ngaykt { get => _NgayKetThuc; set { _NgayKetThuc = value; OnPropertyChanged(); } }

        private string _GiamGia;
        public string giamgia { get => _GiamGia; set { _GiamGia = value; OnPropertyChanged(); } }

        private int _LoaiND;
        public int loaind { get => _LoaiND; set { _LoaiND = value; } }

        public AddSale()
        {
            InitializeComponent();
            DataContext = this;
            Binding_LoaiKH();
        }

        private void Binding_LoaiKH()
        {
            QLNSEntities qlns = new QLNSEntities();
            List<LOAIKHACHHANG> lkh = qlns.LOAIKHACHHANGs.ToList();
            loaiKH.ItemsSource = lkh;
            loaiKH.DisplayMemberPath = "TenLKH";
            loaiKH.SelectedValuePath = "idLKH";
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
        // End: Button Close | Restore | Minimize

        private void ForceValidation()
        {
            tenKM.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            ngayBatDau.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            ngayKetThuc.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            giamGia.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            loaiKH.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {

            ForceValidation();
            if (Validation.GetHasError(tenKM) || Validation.GetHasError(loaiKH) ||Validation.GetHasError(ngayBatDau) || Validation.GetHasError(ngayKetThuc) || Validation.GetHasError(giamGia))
            {
                MessageBox.Show("Đã có lỗi xảy ra!");
            }
            else
            {
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn thêm khuyến mãi này?";
                messageOption.ShowDialog();
                bool isAdd = MessageOption.isAgree;
                messageOption.Close();
                if (isAdd)
                {
                    var qlns = new QLNSEntities();
                    var id = qlns.LOAIKHACHHANGs.SqlQuery($"SELECT * FROM LOAIKHACHHANG WHERE TenLKH = N'{loaiKH.Text}'").ToList();

                    tenkm = tenKM.Text;
                    mota = moTa.Text;
                    loaikh = id[0].idLKH;
                    ngaybd = (DateTime)ngayBatDau.SelectedDate;
                    ngaykt = (DateTime)ngayKetThuc.SelectedDate;
                    giamgia = giamGia.Text;
                    if (App.Current.Properties["idND_Sale"] != null)
                    {
                        loaind = int.Parse(App.Current.Properties["idND_Sale"].ToString());
                    }
                    else
                    {
                        loaind = 0;
                    }

                    var KHUYENMAI = new KHUYENMAI()
                    {
                        TenKM = tenkm,
                        MoTa = mota,
                        idLKH = loaikh,
                        NgayBD = ngaybd,
                        NgayKT = ngaykt,
                        GiamGia = short.Parse(giamgia),
                        idND = loaind,
                    };

                    DataProvider.Ins.DB.KHUYENMAIs.Add(KHUYENMAI);
                    DataProvider.Ins.DB.SaveChanges();

                    Message message = new Message();
                    message.message.Text = "Thêm khuyến mãi thành công!";
                    message.ShowDialog();

                    this.Close();
                }
                else
                {
                    // Do not close the window  
                }
            }
        }
    }
}
