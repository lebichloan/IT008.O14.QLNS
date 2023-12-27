using MaterialDesignThemes.Wpf;
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
    /// Interaction logic for AddUser.xaml
    /// </summary>
    public partial class AddUser : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private string _MaND;
        public string mand { get => _MaND; set { _MaND = value; OnPropertyChanged(); } }

        private string _TenND;
        public string tennd { get => _TenND; set { _TenND = value; OnPropertyChanged(); } }

        private string _MatKhau;
        public string matkhau { get => _MatKhau; set { _MatKhau = value; OnPropertyChanged(); } }

        private DateTime _NgayTao;
        public DateTime ngaytao { get => _NgayTao; set => _NgayTao = value; }

        private int _TinhTrang;
        public int tinhtrang { get => _TinhTrang; set { _TinhTrang = value; OnPropertyChanged(); } }

        private int _idNV;
        public int idnv { get => _idNV; set { _idNV = value; OnPropertyChanged(); } }

        private int _LoaiND;
        public int loaind { get => _LoaiND; set { _LoaiND = value; } }

        public AddUser()
        {
            InitializeComponent();
            DataContext = this;
            Binding_Combobox();
        }

        private void Binding_Combobox()
        {
            QLNSEntities qlns = new QLNSEntities();
            var query = from lnd in qlns.LOAINGUOIDUNGs
                        orderby lnd.idLND
                        select lnd;

            var loaind = query.ToList();

            loaiND.ItemsSource = loaind;
            loaiND.DisplayMemberPath = "TenLND";
            loaiND.SelectedValuePath = "idLND";

            var query2 = from nv in qlns.NHANVIENs
                         orderby nv.idNV
                         select nv;

            var IDNV = query2.ToList();

            idNhanVien.ItemsSource = IDNV;
            idNhanVien.DisplayMemberPath = "idNV";
            idNhanVien.SelectedValuePath = "idNV";
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
            tenND.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            tinhTrang.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            matKhau.GetBindingExpression(PasswordBoxAssist.PasswordProperty).UpdateSource();
            nhapLaiMatKhau.GetBindingExpression(PasswordBoxAssist.PasswordProperty).UpdateSource();
            loaiND.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            idNhanVien.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
        }
        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            ForceValidation();
            if (Validation.GetHasError(tenND) || Validation.GetHasError(tinhTrang) || Validation.GetHasError(matKhau) || Validation.GetHasError(nhapLaiMatKhau) || Validation.GetHasError(loaiND) || Validation.GetHasError(idNhanVien))
            {
                Message message = new Message();
                message.message.Text = "Đã có lỗi xảy ra";
                message.ShowDialog();
            }
            else
            {
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn thêm người dùng này?";
                messageOption.ShowDialog();
                bool isAdd = MessageOption.isAgree;
                messageOption.Close();
                if (isAdd)
                {
                    QLNSEntities qlns = new QLNSEntities();
                    var id = qlns.LOAINGUOIDUNGs.SqlQuery($"SELECT * FROM LOAINGUOIDUNG WHERE TenLND = N'{loaiND.Text}'").ToList();

                    tennd = tenND.Text;
                    matkhau = matKhau.Password;
                    tinhtrang = tinhTrang.SelectedIndex;
                    loaind = int.Parse(id[0].idLND.ToString());
                    idnv = idNhanVien.SelectedIndex + 1;
                    ngaytao = DateTime.Today;

                    var NGUOIDUNG = new NGUOIDUNG()
                    {
                        TenDN = tennd,
                        MatKhau = matkhau,
                        TinhTrang = tinhtrang,
                        idNV = idnv,
                        idLND = loaind,
                        NgayTao = ngaytao
                    };

                    DataProvider.Ins.DB.NGUOIDUNGs.Add(NGUOIDUNG);
                    DataProvider.Ins.DB.SaveChanges();

                    Message message = new Message();
                    message.message.Text = "Thêm người dùng thành công!";
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

