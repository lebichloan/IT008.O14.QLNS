﻿using QLNS.Model;
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
    /// Interaction logic for DetailProduct.xaml
    /// </summary>
    public partial class DetailProduct : Window
    {
        public ProductManage productManage { get; set; }
        public int idSP { get; set; }
        public DetailProduct()
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
            SANPHAM sanpham = DataProvider.Ins.DB.SANPHAMs.Find(idSP);
            if (sanpham != null)
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