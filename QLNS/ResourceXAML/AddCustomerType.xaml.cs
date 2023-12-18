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
    /// Interaction logic for AddCustomerType.xaml
    /// </summary>
    public partial class AddCustomerType : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private string _MaLKH;
        public string malkh { get => _MaLKH; set { _MaLKH = value; } }

        private string _TenLKH;
        public string tenlkh { get => _TenLKH; set { _TenLKH = value; OnPropertyChanged(); } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; OnPropertyChanged(); } }

        private string _DiemTLTT;
        public string diemtltt { get => _DiemTLTT; set { _DiemTLTT = value; OnPropertyChanged(); } }

        public AddCustomerType()
        {
            InitializeComponent();
            DataContext = this;
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

        private void ForceValidation()
        {
            tenLKH.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            moTa.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            diemTLTT.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            ForceValidation();
            if ((Validation.GetHasError(tenLKH)) || (Validation.GetHasError(moTa)) || (Validation.GetHasError(diemTLTT)))
            {
                MessageBox.Show("Đã có lỗi xảy ra!");
            }
            else
            {
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn thêm loại khách hàng này?";
                messageOption.ShowDialog();
                bool isAdd = MessageOption.isAgree;
                messageOption.Close();
                if (isAdd)
                {
                    tenlkh = tenLKH.Text;
                    mota = moTa.Text;
                    diemtltt = diemTLTT.Text;

                    var LOAIKHACHHANG = new LOAIKHACHHANG()
                    {
                        TenLKH = tenlkh,
                        MoTa = mota,
                        DiemTichLuyToiThieu = int.Parse(diemtltt),
                    };

                    DataProvider.Ins.DB.LOAIKHACHHANGs.Add(LOAIKHACHHANG);
                    DataProvider.Ins.DB.SaveChanges();

                    this.Close();
                }
            }
            //if (!(tenLKH.Text == string.Empty && moTa.Text == string.Empty && diemTLTT.Text == string.Empty))
            //{

            //}
            //else
            //{
            //    MessageBox.Show("Error!");
            //}
        }

    }
}
