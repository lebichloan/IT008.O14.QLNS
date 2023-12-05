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

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for DetailSale.xaml
    /// </summary>
    public partial class DetailSale : Window
    {
        public SaleManage saleManage { get; set; }
        public int idKM { get; set; }
        public DetailSale()
        {
            InitializeComponent();
            saleManage = new SaleManage();
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

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            KHUYENMAI khuyenmai = DataProvider.Ins.DB.KHUYENMAIs.Find(idKM);
            if (khuyenmai != null)
            {
                try
                {
                    //Xử lý để trống thông tin
                    if (TenKM.Text == "") // Tên khuyến mãi
                    {
                        throw new Exception("Tên khuyến mãi không được để trống");
                    }   
                    if (NgayBD.Text == "") // Ngày bắt đầu
                    {
                        throw new Exception("Ngày bắt đầu không được để trống");
                    }
                    if (NgayKT.Text == "") // ngày kết thúc
                    {
                        throw new Exception("Ngày kết thúc không được để trống");
                    }
                    if (GiamGia.Text == "") // giảm giá
                    {
                        throw new Exception("Giảm giá không được để trống");
                    }
                    
                    // Xử lý sai định dạng
                    if (!IsValidDateFormat(NgayBD.Text))
                    {
                        throw new Exception("Ngày bắt đầu không hợp lệ, vui lòng nhập theo định dạng (ngày/tháng/năm)");
                    }
                    if (!IsValidDateFormat(NgayKT.Text))
                    {
                        throw new Exception("Ngày kết thúc không hợp lệ, vui lòng nhập theo định dạng (ngày/tháng/năm)");
                    }

                    // ràng buộc giảm giá
                    if (!short.TryParse(GiamGia.Text, out short temp))
                    {
                        throw new Exception("Thông tin giảm giá không hợp lệ, vui lòng nhập số");
                    }

                    // ràng buộc loại khách hàng là int
                    if(idLKH.Text != "") // nếu có nhập thông tin thì kiểm tra
                    {
                        if (!int.TryParse(idLKH.Text, out int temp1))
                        {
                            throw new Exception("Loại khách hàng không hợp lệ, vui lòng nhập( 1: Khách lẻ, 2: Hội viên, 3: Hội viên VIP)");
                        }
                        else
                        {
                            if (temp1 != 1 && temp1 != 2 && temp1 != 3)
                                throw new Exception("Loại khách hàng không hợp lệ, vui lòng nhập( 1: Khách lẻ, 2: Hội viên, 3: Hội viên VIP)");
                        }
                    }
                    


                    khuyenmai.TenKM = TenKM.Text.ToString();
                    khuyenmai.NgayBD = DateTime.ParseExact(NgayBD.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    khuyenmai.NgayKT = DateTime.ParseExact(NgayKT.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                    if(idLKH.Text == "")
                    {
                        khuyenmai.idLKH = null;
                    }
                    else
                    {
                        khuyenmai.idLKH = int.Parse(idLKH.Text);
                    }

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
