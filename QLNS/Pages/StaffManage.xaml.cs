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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for StaffManage.xaml
    /// </summary>
    public partial class StaffManage : Page
    {
        QLNSEntities qLNSEntities = new QLNSEntities();
        public StaffManage()
        {
            InitializeComponent();
        }
        int pageNumber = 1;
        int pageSize = 10;
        private void staffManage_Loaded(object sender, RoutedEventArgs e)
        {
            var query =
                from nhanvien in qLNSEntities.NHANVIENs
                orderby nhanvien.idNV
                //where hoadon.idHD == 0
                select new
                {
                    idNV = nhanvien.idNV,
                    TenNV = nhanvien.TenNV,
                    GioiTinh = nhanvien.GioiTinh,
                    SDT = nhanvien.SDT,
                    DiaChi = nhanvien.DiaChi,
                    NgayVL = nhanvien.NgayVL,
                    ChucVu = nhanvien.ChucVu,
                    TinhTrang = nhanvien.TinhTrang,
                    GhiChu = nhanvien.GhiChu,
                };

            //memberDataGrid.ItemsSource = query.ToList();
            staffDataGrid.ItemsSource = query.Skip(pageSize * (pageNumber)).Take(pageSize).ToList();
            btnPre.IsEnabled = false;
            lblPage.Text = string.Format("{0}/{1}", pageNumber, query.Count() / pageSize);
        }
    }
}
