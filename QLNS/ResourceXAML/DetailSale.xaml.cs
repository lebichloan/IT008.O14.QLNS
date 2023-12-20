using QLNS.Model;
using QLNS.Pages;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    /// Interaction logic for DetailSale.xaml
    /// </summary>
    public partial class DetailSale : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public SaleManage saleManage { get; set; }
        public int idKM { get; set; }
        public DetailSale()
        {
            InitializeComponent();
            Binding_Combobox();
            saleManage = new SaleManage();
        }

        private void Binding_Combobox()
        {
            QLNSEntities qlns = new QLNSEntities();
            List<LOAIKHACHHANG> lkh = qlns.LOAIKHACHHANGs.ToList();
            idLKH.ItemsSource = lkh;
            idLKH.DisplayMemberPath = "TenLKH";
            idLKH.SelectedValuePath = "idLKH";
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
            TenKM.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            GiamGia.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            NgayBD.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            NgayKT.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            QLNSEntities qlns = new QLNSEntities();
            KHUYENMAI khuyenmai = DataProvider.Ins.DB.KHUYENMAIs.Find(idKM);
            if (khuyenmai != null)
            {
                ForceValidation(); //Kiem tra rang buoc khi click button
                if (Validation.GetHasError(TenKM) || Validation.GetHasError(GiamGia) || Validation.GetHasError(NgayBD) || Validation.GetHasError(NgayKT))
                {
                    MessageBox.Show("Đã có lỗi xảy ra!");
                }
                else
                {
                    try
                    {
                        khuyenmai.TenKM = TenKM.Text.ToString();
                        khuyenmai.NgayBD = DateTime.Parse(NgayBD.Text);
                        khuyenmai.NgayKT = DateTime.Parse(NgayKT.Text);

                        
                        var id = qlns.LOAIKHACHHANGs.SqlQuery($"SELECT * FROM LOAIKHACHHANG WHERE TenLKH = N'{idLKH.Text}'").ToList();
                        khuyenmai.idLKH = int.Parse(id[0].idLKH.ToString());
                        

                        khuyenmai.GiamGia = short.Parse(GiamGia.Text);
                        khuyenmai.MoTa = MoTa.Text.ToString();

                        MessageOption messageOption = new MessageOption();
                        messageOption.message.Text = "Bạn có chắc chắn muốn sửa đổi thông tin này?";
                        messageOption.ShowDialog();
                        bool isUpdate = MessageOption.isAgree;
                        messageOption.Close();
                        if (isUpdate)
                        {
                            DataProvider.Ins.DB.SaveChanges();
                            saleManage.LoadDataCurrent();
                            Message message = new Message();
                            message.message.Text = "Sửa thông tin thành công!";
                            message.ShowDialog();
                        }
                        this.Close();
                    }
                    catch (Exception ex)
                    {
                        Message message = new Message();
                        message.message.Text = ex.Message;
                        message.ShowDialog();
                    }
                }
            }
        }
    }
}
