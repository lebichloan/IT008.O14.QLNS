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
    /// Interaction logic for DetailCustomerType.xaml
    /// </summary>
    public partial class DetailCustomerType : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public CustomerManage customerManage { get; set; }
        public int idLKH { get; set; }

        public DetailCustomerType()
        {
            InitializeComponent();
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
            TenLKH.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            DTLTT.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            QLNSEntities qlns = new QLNSEntities();
            LOAIKHACHHANG loaikhachhang = qlns.LOAIKHACHHANGs.Find(idLKH);
            if (loaikhachhang != null)
            {
                ForceValidation(); //Kiem tra rang buoc khi click button
                if (Validation.GetHasError(TenLKH) || Validation.GetHasError(DTLTT))
                {
                    MessageBox.Show("Đã có lỗi xảy ra!");
                }
                else
                {
                    try
                    {
                        loaikhachhang.TenLKH = TenLKH.Text.ToString();

                        loaikhachhang.MoTa = MoTa.Text.ToString();
                        loaikhachhang.DiemTichLuyToiThieu = int.Parse(DTLTT.Text);

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
