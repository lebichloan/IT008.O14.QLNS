using QLNS.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
    /// Interaction logic for AddNewProductWhenImport.xaml
    /// </summary>
    public partial class AddNewProductWhenImport : Window
    {
        private string _MaSP;
        public string masp { get => _MaSP; set { _MaSP = value; } }

        private string _TenSP;
        public string tensp { get => _TenSP; set { _TenSP = value; } }

        private int _DanhMuc;
        public int danhmuc { get => _DanhMuc; set { _DanhMuc = value; } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; } }

        private string _GhiChu;
        public string ghichu { get => _GhiChu; set { _GhiChu = value; } }

        public AddNewProductWhenImport()
        {
            InitializeComponent();
            LoadComboBox();
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
            tenSP.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            loaiSP.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
        }


        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            ForceValidation();
            if (Validation.GetHasError(tenSP) || Validation.GetHasError(loaiSP))
            {
                Message message = new Message();
                message.message.Text = "Đã có lỗi xảy ra! Vui lòng kiểm tra lại thông tin!";
                message.ShowDialog();
            }
            else
            {
                tensp = tenSP.Text;
                mota = moTa.Text;
                danhmuc = loaiSP.SelectedIndex + 1;

                var SANPHAM = new SANPHAM()
                {
                    TenSP = tensp,
                    MoTa = mota,
                    idDM = danhmuc,
                };

                DataProvider.Ins.DB.SANPHAMs.Add(SANPHAM);
                DataProvider.Ins.DB.SaveChanges();
                this.Close();

            }
        }

        QLNSEntities qLNSEntities = new QLNSEntities();
        private void LoadComboBox()
        {
            List<DANHMUC> dm = qLNSEntities.DANHMUCs.ToList();
            loaiSP.ItemsSource = dm;
            loaiSP.DisplayMemberPath = "TenDM";
            loaiSP.SelectedValuePath = "idDM";
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
