using MaterialDesignThemes.Wpf;
using QLNS.Model;
using QLNS.Pages;
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
using static System.Net.Mime.MediaTypeNames;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for ChangePassword.xaml
    /// </summary>
    public partial class ChangePassword : Window, INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ChangePassword()
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
        // End: Button Close | Restore | Minimize

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void ForceValidation()
        {
            MatKhauHT.GetBindingExpression(PasswordBoxAssist.PasswordProperty).UpdateSource();
            MatKhauMoi.GetBindingExpression(PasswordBoxAssist.PasswordProperty).UpdateSource();
            NhapLaiMK.GetBindingExpression(PasswordBoxAssist.PasswordProperty).UpdateSource();
        }

        private void AcceptButton_Click(object sender, RoutedEventArgs e)
        {
            QLNSEntities qlns = new QLNSEntities();
            int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());
            NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.Find(id);
            if (nguoidung != null)
            {
                ForceValidation();
                if (Validation.GetHasError(MatKhauHT) || Validation.GetHasError(MatKhauMoi) || Validation.GetHasError(NhapLaiMK))
                {
                    Message message = new Message();
                    message.message.Text = "Đã có lỗi xảy ra!";
                    message.ShowDialog();
                }
                else
                {
                    try
                    {
                        nguoidung.MatKhau = MatKhauMoi.Password;
                        MessageOption messageOption = new MessageOption();
                        messageOption.message.Text = "Bạn có chắc chắn muốn đổi mật khẩu?";
                        messageOption.ShowDialog();
                        bool isUpdate = MessageOption.isAgree;
                        messageOption.Close();
                        if (isUpdate)
                        {
                            DataProvider.Ins.DB.SaveChanges();
                            Message message = new Message();
                            message.message.Text = "Đổi mật khẩu thành công! Vui lòng đăng nhập lại!";
                            message.ShowDialog();
                        }

                        foreach (Window window in System.Windows.Application.Current.Windows)
                        {
                            if (window != this)
                            {
                                window.Close();
                            }
                        }
                        App.Current.Properties["isLogin"] = 0;
                        LoginWindow Login = new LoginWindow();
                        this.Close();
                        Login.Show();

                        //this.Close();
                    }
                    catch { }
                }
            }
        }

    }
}
