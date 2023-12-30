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
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace QLNS.ResourceXAML
{
    /// <summary>
    /// Interaction logic for DetailAccount.xaml
    /// </summary>
    public partial class DetailAccount : Window , INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        QLNSEntities qLNSEntities = new QLNSEntities();
        private int idAccount = -1;
        private int idLoaiND = -1;
        private int idTinhTrang = -1;
        private string phoneNumber = null;
        private string maND;
        public string MaND { get { return maND; } set { maND = value; OnPropertyChanged(); } }

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
            string accountSid = "ACf95b337f4f1ffa4d2e28cdea1ee744f6";
            string authToken = "2b5ea766def589821d570e347210eb56";
            string twilioPhoneNumber = "+12054985938";

            string userPhoneNumber = "+84338439300";
            string newPassword = GenerateRandomPassword();

            SendResetSMS(accountSid, authToken, twilioPhoneNumber, userPhoneNumber, newPassword);
        }

        private void SendResetSMS(string accountSid, string authToken, string twilioPhoneNumber, string userPhoneNumber, string newPassword)
        {
            TwilioClient.Init(accountSid, authToken);
            
            try
            {
                var message = MessageResource.Create(
                    body: $"Your new password is: {newPassword}",
                    from: new PhoneNumber(twilioPhoneNumber),
                    to: new PhoneNumber(userPhoneNumber)
                    );
                MessageBox.Show($"SMS sent successfully to {userPhoneNumber}.");
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error sending reset SMS: {ex.Message}");
            }
        }

        private string GenerateRandomPassword()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, 8)
              .Select(s => s[random.Next(s.Length)]).ToArray());
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
                            sdt = nguoidung.NHANVIEN.SDT,
                        };

            var user = query.ToList().FirstOrDefault();

            if (user != null)
            {
                string mk = string.Empty;
                lblMaND.Text = user.maND;
                txtTenDN.Text = user.tenDN;
                for (int i = 0; i < user.matKhau.Length; i++)
                {
                    mk += "*";
                }
                txtMatKhau.Text = mk;
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

                phoneNumber = user.sdt;
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
        private void detailAccount_Loaded(object sender, RoutedEventArgs e)
        {
            NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.Find(idAccount);
            if (nguoidung != null)
            {
                MaND = nguoidung.MaND;
            }
        }

    }
}
