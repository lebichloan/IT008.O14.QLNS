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
    /// Interaction logic for DetailProduct.xaml
    /// </summary>
    public partial class DetailProduct : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ProductManage productManage { get; set; }
        public int idCTSP { get; set; }

        public int idSP { get; set; }

        private string maSanPham;
        public string MaSanPham { get { return maSanPham; } set { maSanPham = value; OnPropertyChanged(); } }

        public DetailProduct()
        {
            InitializeComponent();
            ComboBoxItem newitem = new ComboBoxItem();
            newitem.Content = "Đã bán hết";
            TinhTrang.Items.Add(newitem);
            newitem = new ComboBoxItem();
            newitem.Content = "Còn hàng";
            TinhTrang.Items.Add(newitem);
            newitem = new ComboBoxItem();
            newitem.Content = "Đã ẩn";
            TinhTrang.Items.Add(newitem);
            newitem = new ComboBoxItem();
            newitem.Content = "Ngừng bán";
            TinhTrang.Items.Add(newitem);
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

        private void ForceValidation()
        {
            TenSP.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            SLCL.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            SLDB.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            GiaNhap.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            GiaBan.GetBindingExpression(TextBox.TextProperty).UpdateSource();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            SANPHAM sanpham = DataProvider.Ins.DB.SANPHAMs.Find(idSP);
            CTSP ctsp = DataProvider.Ins.DB.CTSPs.Find(idCTSP);
            if (sanpham != null)
            {
                ForceValidation();
                if (Validation.GetHasError(TenSP) || Validation.GetHasError(SLCL) || Validation.GetHasError(SLDB) || Validation.GetHasError(GiaNhap) || Validation.GetHasError(GiaBan))
                {
                    Message message = new Message();
                    message.message.Text = "Đã có lỗi xảy ra! Vui lòng kiểm tra lại thông tin!";
                    message.ShowDialog();
                }
                else
                {
                    try
                    {
                        //Xử lý để trống thông tin
                        if (TenSP.Text == "")
                        {
                            throw new Exception("Tên sản phẩm không được để trống");
                        }
                        if (LoaiSP.Text == "")
                        {
                            throw new Exception("Danh mục không được để trống");
                        }

                        // Xử lý sai định dạng


                        sanpham.TenSP = TenSP.Text.ToString();
                        var danhMuc = DataProvider.Ins.DB.DANHMUCs.FirstOrDefault(dm => dm.TenDM == LoaiSP.Text.ToString());
                        sanpham.idDM = danhMuc.idDM;
                        sanpham.MoTa = MoTa.Text.ToString();

                        ctsp.DonGiaNhap = Convert.ToDecimal(GiaNhap.Text.ToString());
                        ctsp.DonGiaXuat = Convert.ToDecimal(GiaBan.Text.ToString());
                        ctsp.TinhTrang = TinhTrang.SelectedIndex;


                        MessageOption messageOption = new MessageOption();
                        messageOption.message.Text = "Bạn có chắc chắn muốn sửa đổi thông tin này?";
                        messageOption.ShowDialog();
                        bool isUpdate = MessageOption.isAgree;
                        messageOption.Close();
                        if (isUpdate)
                        {
                            DataProvider.Ins.DB.SaveChanges();
                            productManage.LoadDataCurrent();
                            Message message = new Message();
                            message.message.Text = "Sửa thông tin thành công!";
                            message.ShowDialog();
                            productManage.LoadDataCurrent();
                            this.Close();

                        }
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

        private void detailProduct_Loaded(object sender, RoutedEventArgs e)
        {
            DataContext = this;
            SANPHAM sanpham = DataProvider.Ins.DB.SANPHAMs.Find(idSP);
            if (sanpham != null)
            {
                MaSanPham = sanpham.MaSP;
            }
        }
    }
}
