using QLNS.Model;
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
    /// Interaction logic for UserDialog.xaml
    /// </summary>
    public partial class UserDialog : Window
    {
        public UserDialog()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void UserInfo_Clicked(object sender, RoutedEventArgs e)
        {
            DetailUser detailUser = new DetailUser();

            int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());

            QLNSEntities qlns = new QLNSEntities();
            var query = from nd in qlns.NGUOIDUNGs
                        join nv in qlns.NHANVIENs on nd.idNV equals nv.idNV
                        where nd.idND == id
                        select nd;
            var lst = query.ToList();

            detailUser.TenNV.Text = lst[0].NHANVIEN.TenNV;
            detailUser.GioiTinh.Text = lst[0].NHANVIEN.GioiTinh;
            detailUser.NgaySinh.Text = lst[0].NHANVIEN.NgaySinh.ToString("MM/dd/yyyy");
            if (lst[0].NHANVIEN.DiaChi is null)
            {
                detailUser.DiaChi.Text = "";
            }
            else
            {
                detailUser.DiaChi.Text = lst[0].NHANVIEN.DiaChi;
            }
            if (lst[0].NHANVIEN.SDT is null)
            {
                detailUser.SDT.Text = "";
            }
            else
            {
                detailUser.SDT.Text = lst[0].NHANVIEN.SDT;
            }
            detailUser.NgayVL.Text = lst[0].NHANVIEN.NgayVL.ToString("MM/dd/yyyy");
            detailUser.ChucVu.Text = lst[0].NHANVIEN.ChucVu;
            if (lst[0].NHANVIEN.TinhTrang == 0)
            {
                detailUser.TinhTrang.Text = "Đã nghỉ việc";
            }
            else
            {
                detailUser.TinhTrang.Text = "Đang làm việc";
            }
            if (lst[0].NHANVIEN.GhiChu is null)
            {
                detailUser.GhiChu.Text = "";
            }
            else
            {
                detailUser.GhiChu.Text = lst[0].NHANVIEN.GhiChu;
            }
            detailUser.ShowDialog();
        }

        private void AccountInfo_Clicked(object sender, RoutedEventArgs e)
        {
            DetailAccount detailAccount = new DetailAccount();
            QLNSEntities qlns = new QLNSEntities();
            int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());

            var query = from nd in qlns.NGUOIDUNGs
                        join lnd in qlns.LOAINGUOIDUNGs on nd.idLND equals lnd.idLND
                        where nd.idND == id
                        select nd;
            var lst = query.ToList();

            detailAccount.TenTK.Text = lst[0].TenDN;
            detailAccount.NgayTao.Text = lst[0].NgayTao.ToString("MM/dd/yyyy");
            if (lst[0].TinhTrang == 0)
            {
                detailAccount.TinhTrang.Text = "Đã bị khóa";
            }
            else
            {
                detailAccount.TinhTrang.Text = "Đang hoạt động";
            }
            detailAccount.LoaiND.Text = lst[0].LOAINGUOIDUNG.TenLND;
            if (lst[0].LOAINGUOIDUNG.MoTa is null)
            {
                detailAccount.MoTa.Text = "";
            }
            else
            {
                detailAccount.MoTa.Text = lst[0].LOAINGUOIDUNG.MoTa;
            }

            detailAccount.ShowDialog();
        }
    }
}
