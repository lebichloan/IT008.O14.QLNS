using QLNS.Model;
using QLNS.Pages;
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
    /// Interaction logic for DetailErrorProduct.xaml
    /// </summary>
    public partial class DetailErrorProduct : Window
    {
        public ProductManage productManage { get; set; }
        public int idSPL { get; set; }
        public int idCTSP { get; set; }
        public DetailErrorProduct()
        {
            InitializeComponent();
            
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            SANPHAMLOI sanphamloi = DataProvider.Ins.DB.SANPHAMLOIs.Find(idSPL);
            CTSP ctsp = DataProvider.Ins.DB.CTSPs.Find(idCTSP);
            if (sanphamloi != null)
            {
                try
                {
                    //Xử lý để trống thông tin
                    if (TenSP.Text == "")
                    {
                        throw new Exception("Tên sản phẩm không được để trống");
                    }
                    if(Convert.ToInt16(SL.Text) > (ctsp.SoLuongLoi + ctsp.SLConLai))
                    {
                        throw new Exception("Số lượng sản phẩm lỗi không thể lớn hơn " + (ctsp.SoLuongLoi + ctsp.SLConLai));
                    }


                    // Xử lý sai định dạng

                    short slldiff = (short)(sanphamloi.SoLuongLoi - Convert.ToInt16(SL.Text));
                    sanphamloi.ChiTietLoi = ChiTietLoi.Text.ToString();
                    sanphamloi.SoLuongLoi = Convert.ToInt16(SL.Text);


                    ctsp.SoLuongLoi = Convert.ToInt16(SL.Text);
                    ctsp.SLConLai = (short)(ctsp.SLConLai + slldiff);
                    



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
    

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
