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
    /// Interaction logic for DetailAccount.xaml
    /// </summary>
    public partial class DetailAccount : Window
    {
        QLNSEntities qLNSEntities = new QLNSEntities();
        private int idAccount = -1;
        private int idLoaiND = -1;
        private int idTinhTrang = -1;
        public DetailAccount()
        {
            InitializeComponent();
        }

        public DetailAccount(int idAccount)
        {
            InitializeComponent();
            this.idAccount = idAccount;
            LoadData(idAccount);
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnResetPass_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDeleteAccount_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.Find(idAccount);
            if (nguoidung != null)
            {
                try
                {
                    nguoidung.TinhTrang = idTinhTrang;
                    nguoidung.idLND = idLoaiND;

                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn sửa đổi thông tin này?";
                    messageOption.ShowDialog();
                    bool isUpdate = MessageOption.isAgree;
                    messageOption.Close();
                    if (isUpdate)
                    {
                        DataProvider.Ins.DB.SaveChanges();

                        Message message = new Message();
                        message.message.Text = "Sửa thông tin thành công!";
                        message.ShowDialog();
                        Close();
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

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void LoadData(int idND)
        {
            var query = from nguoidung in qLNSEntities.NGUOIDUNGs
                        where nguoidung.idND == idND
                        select new
                        {
                            maND = nguoidung.MaND,
                            tenDN = nguoidung.TenDN,
                            matKhau = nguoidung.MatKhau,
                            ngayTao = nguoidung.NgayTao,
                            tinhTrang = nguoidung.TinhTrang,
                            loaiND = nguoidung.idLND,
                        };

            var user = query.ToList().FirstOrDefault();

            if (user != null)
            {
                lblMaND.Text = user.maND;
                txtTenDN.Text = user.tenDN;
                txtMatKhau.Text = "********";
                txtNgayTao.Text = user.ngayTao.ToString();

                idTinhTrang = user.tinhTrang;
                if (user.tinhTrang == 0)
                {
                    cmbTinhTrang.SelectedIndex = 0;
                }
                else
                {
                    cmbTinhTrang.SelectedIndex = 1;
                }

                idLoaiND = user.loaiND;
                if (user.loaiND == 1)
                {
                    cmbLoaiND.SelectedIndex = 0;
                }
                else if (user.loaiND == 2)
                {
                    cmbLoaiND.SelectedIndex = 1;
                }
                else
                {
                    cmbLoaiND.SelectedIndex = 2;
                }
            }
        }

        private void cmbTinhTrang_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbTinhTrang.SelectedItem != null)
            {
                if (cmbTinhTrang.SelectedIndex == 0)
                {
                    idTinhTrang = 0;
                }
                else if (cmbTinhTrang.SelectedIndex == 1)
                {
                    idTinhTrang = 1;
                }
            }
        }

        private void cmbLoaiND_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbLoaiND.SelectedItem != null)
            {
                if (cmbLoaiND.SelectedIndex == 0)
                {
                    idLoaiND = 1;
                }
                else if ( cmbLoaiND.SelectedIndex == 1)
                {
                    idLoaiND = 2;
                }
                else if (cmbLoaiND.SelectedIndex == 2)
                {
                    idLoaiND = 3;
                }
            }
        }
    }
}
