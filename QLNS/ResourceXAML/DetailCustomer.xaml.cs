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
    /// Interaction logic for DetailCustomer.xaml
    /// </summary>
    public partial class DetailCustomer : Window
    {
        public CustomerManage customerManage { get; set; }
        public int idKH { get; set; }
        public DetailCustomer()
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

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            KHACHHANG khachhang = DataProvider.Ins.DB.KHACHHANGs.Find(idKH);
            if (khachhang != null)
            {
                try
                {
                    //Xử lý để trống thông tin
                    if (TenKH.Text == "")//tên khách hàng 
                    {
                        throw new Exception("Tên khách hàng không được để trống");
                    }
                    if (GioiTinh.Text == "")//Giới tính
                    {
                        throw new Exception("Giới tính không được để trống");
                    }
                    if (SDT.Text == "")//SDT
                    {
                        throw new Exception("Số điện thoại không được để trống");
                    }
                    if (NgayTG.Text == "")//Ngày tham gia
                    {
                        throw new Exception("Ngày tham gia không được để trống");
                    }
                    if (DTL.Text == "")//Điểm tích lũy
                    {
                        throw new Exception("Điểm tích lũy không được để trống không được để trống");
                    }
                    if(LoaiKH.Text == "")// Loại khách hàng
                    {
                        throw new Exception("Loại khách hàng không được để trống không được để trống");
                    }

                    // Xử lý sai định dạng
                    // ràng buộc các dữ liệu datetime
                    if(NgaySinh.Text != "")
                    {
                        if (!IsValidDateFormat(NgaySinh.Text))
                        {
                            throw new Exception("Ngày sinh không hợp lệ, vui lòng nhập theo định dạng (ngày/tháng/năm)");
                        }
                    }
                    if (!IsValidDateFormat(NgayTG.Text))
                    {
                        throw new Exception("Ngày tham gia không hợp lệ, vui lòng nhập theo định dạng (ngày/tháng/năm)");
                    }

                    // ràng buộc điểm tích lũy
                    if (!int.TryParse(DTL.Text, out int temp))
                    {
                        throw new Exception("Điểm tích lũy không hợp lệ, vui lòng nhập số");
                    }

                    // ràng buộc idLKH
                    if (!int.TryParse(LoaiKH.Text, out int temp1))
                    {
                        throw new Exception("Loại khách hàng không hợp lệ, vui lòng nhập( 1: Khách lẻ, 2: Hội viên, 3: Hội viên VIP)");
                    }
                    else
                    {
                        if (temp1 != 1 && temp1 != 2 && temp1 != 3)
                            throw new Exception("Loại khách hàng không hợp lệ, vui lòng nhập( 1: Khách lẻ, 2: Hội viên, 3: Hội viên VIP)");
                    }


                    khachhang.TenKH = TenKH.Text.ToString();
                    khachhang.GioiTinh = GioiTinh.Text.ToString();
                    if(NgaySinh.Text == "")
                    {
                        khachhang.NgaySinh = null;
                    }
                    else
                    {
                        khachhang.NgaySinh = DateTime.ParseExact(NgaySinh.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    }
                    khachhang.DiaChi = DiaChi.Text.ToString();
                    khachhang.SDT = SDT.Text.ToString();
                    khachhang.NgayTG = DateTime.ParseExact(NgayTG.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    khachhang.DiemTichLuy = int.Parse(DTL.Text);
                    khachhang.idLKH = int.Parse(LoaiKH.Text);

                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn sửa đổi thông tin này?";
                    messageOption.ShowDialog();
                    bool isUpdate = MessageOption.isAgree;
                    messageOption.Close();
                    if (isUpdate)
                    {
                        DataProvider.Ins.DB.SaveChanges();
                        customerManage.LoadDataCustomerCurrent();
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
