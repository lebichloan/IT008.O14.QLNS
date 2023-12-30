using QLNS.Model;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for AddCategory.xaml
    /// </summary>
    public partial class AddCategory : Window
    {

        private string _DanhMuc;
        public string danhmuc { get => _DanhMuc; set { _DanhMuc = value; } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; } }
        public AddCategory()
        {
            InitializeComponent();
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
            tenDM.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }


        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            ForceValidation();
            if (Validation.GetHasError(tenDM))
            {
                Message message = new Message();
                message.message.Text = "Đã có lỗi xảy ra! Vui lòng kiểm tra lại thông tin!";
                message.ShowDialog();
            }
            else
            {
                MessageOption messageOption = new MessageOption();
                messageOption.message.Text = "Bạn có chắc chắn muốn thêm danh mục này?";
                messageOption.ShowDialog();
                bool isAdd = MessageOption.isAgree;
                messageOption.Close();
                if (isAdd)
                {
                    danhmuc = tenDM.Text;
                    mota = moTa.Text;

                    var DANHMUC = new DANHMUC()
                    {

                        MoTa = mota,
                        TenDM = danhmuc,

                    };
                    DataProvider.Ins.DB.DANHMUCs.Add(DANHMUC);
                    DataProvider.Ins.DB.SaveChanges();

                    Message message = new Message();
                    message.message.Text = "Thêm danh mục thành công!";
                    message.ShowDialog();

                    this.Close();
                }
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
