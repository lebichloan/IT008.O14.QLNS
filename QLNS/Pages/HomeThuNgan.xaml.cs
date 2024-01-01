using LiveCharts;
using QLNS.Model;
using QLNS.ResourceXAML;
using QLNS.ViewModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using Twilio.TwiML.Voice;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for HomeQuanLy.xaml
    /// </summary>
    public partial class HomeThuNgan : Page, INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public HomeThuNgan()
        {
            InitializeComponent();
            DataContext = this;
            SetValue();
        }

        private int idND = 0;
        public HomeThuNgan(int idND)
        {
            InitializeComponent();
            DataContext = this;
            SetValue();
            this.idND = idND;
            Load();
        }

        private string tenNV;
        public string tennv { get { return tenNV; } set { tenNV = value; OnPropertyChanged(); } }

        private void SetValue()
        {
            LoginViewModel loginViewModel = new LoginViewModel();
            if (App.Current.Properties["isLogin"] != null && int.Parse(App.Current.Properties["isLogin"].ToString()) == 1)
            {
                int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());
                QLNSEntities qlnsEntities = new QLNSEntities();
                var query = from nd in qlnsEntities.NGUOIDUNGs
                            join nv in qlnsEntities.NHANVIENs on nd.idNV equals nv.idNV
                            where nd.idND == id
                            select nd;
                var lst = query.ToList();
                tennv = lst[0].NHANVIEN.TenNV;
            }
            else
            {
                tennv = "< Chưa đăng nhập >";
            }
        }

        private void ViewProfile_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (App.Current.Properties["isLogin"] != null && int.Parse(App.Current.Properties["isLogin"].ToString()) == 1)
            {
                UserDialog detailUser = new UserDialog();
                detailUser.ShowDialog();
            }
            else
            {
                Message message = new Message();
                message.message.Text = "Vui lòng đăng nhập để xem thông tin!";
                message.ShowDialog();
            }
        }

        private void btnStaff_Click(object sender, RoutedEventArgs e)
        {
            DetailHomeUser detailUser = new DetailHomeUser();

            int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());

            QLNSEntities qlns = new QLNSEntities();
            var query = from nd in qlns.NGUOIDUNGs
                        join nv in qlns.NHANVIENs on nd.idNV equals nv.idNV
                        where nd.idND == id
                        select nd;
            var lst = query.ToList();

            detailUser.idNV = lst[0].idNV;
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

        private void btnAccount_Click(object sender, RoutedEventArgs e)
        {
            DetailHomeAccount detailHomeAccount = new DetailHomeAccount();
            QLNSEntities qlns = new QLNSEntities();
            int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());

            var query = from nd in qlns.NGUOIDUNGs
                        join lnd in qlns.LOAINGUOIDUNGs on nd.idLND equals lnd.idLND
                        where nd.idND == id
                        select nd;
            var lst = query.ToList();

            detailHomeAccount.idND = id;
            detailHomeAccount.TenTK.Text = lst[0].TenDN;
            detailHomeAccount.NgayTaoTaiKhoan.Text = lst[0].NgayTao.ToString("MM/dd/yyyy");
            if (lst[0].TinhTrang == 0)
            {
                detailHomeAccount.TinhTrang.Text = "Đã bị khóa";
            }
            else
            {
                detailHomeAccount.TinhTrang.Text = "Đang hoạt động";
            }
            detailHomeAccount.LoaiND.Text = lst[0].LOAINGUOIDUNG.TenLND;
            if (lst[0].LOAINGUOIDUNG.MoTa is null)
            {
                detailHomeAccount.MoTa.Text = "";
            }
            else
            {
                detailHomeAccount.MoTa.Text = lst[0].LOAINGUOIDUNG.MoTa;
            }

            detailHomeAccount.ShowDialog();
        }

        private void btnChangePass_Click(object sender, RoutedEventArgs e)
        {
            ChangePassword changePassword = new ChangePassword();
            changePassword.ShowDialog();
        }

        private void lblViewProfile_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            lblViewProfile.ContextMenu.IsOpen = true;
        }
        private DateTime startDate;
        private DateTime endDate;
        private float TotalRevenue;
        private int TotalOrders;
        private int TotalProduct;
        private ChartValues<float> RevenueValues;
        public void Load()
        {
            List<string> dateLabels = new List<string>();
            RevenueValues = new ChartValues<float>();
            TotalRevenue = 0;
            TotalOrders = 0;
            TotalProduct = 0;
            endDate = DateTime.Now;
            startDate = new DateTime(endDate.Year, endDate.Month, 1);
            float maxRevenueValue = 0;
            for (DateTime date = endDate.AddDays(-30); date <= endDate; date = date.AddDays(1))
            {
                dateLabels.Add(date.ToString("dd/MM/yyyy"));

                float revenue = GetRevenue(date);
                if (date.Month == endDate.Month)
                {
                    TotalRevenue += revenue;
                }
                if (revenue > maxRevenueValue)
                {
                    maxRevenueValue = revenue;
                }
                RevenueValues.Add(revenue);
            }
            // Chart Doanh thu 
            RevenueChart_Values.Values = RevenueValues;
            RevenueChart_AxisX.Labels = dateLabels;
            if (RevenueValues.Count() < 5)
            {
                RevenueChart_AxisX_Separator.Step = 1;
            }
            else
            {
                RevenueChart_AxisX_Separator.Step = RevenueValues.Count() / 5;
            }
            LoadProduct();
            //text ui
            txtTotalValues.Text = TotalRevenue.ToString("N0") + " VND";
            txtToTalOrders.Text = TotalOrders.ToString("N0") + " Hóa đơn";
            TotalProduct = GetTotalProduct();
            txtTotalProduct.Text = TotalProduct.ToString("N0") + " Sản phẩm";
        }

        public void LoadProduct()
        {
            DateTime date30Pre = endDate.AddDays(-30);
            var query = from hd in DataProvider.Ins.DB.HOADONs
                        join cthd in DataProvider.Ins.DB.CTHDs on hd.idHD equals cthd.idHD
                        join ctsp in DataProvider.Ins.DB.CTSPs on cthd.idCTSP equals ctsp.idCTSP
                        join sp in DataProvider.Ins.DB.SANPHAMs on ctsp.idSP equals sp.idSP
                        where hd.NgayHD >= date30Pre && hd.NgayHD <= endDate
                        group new { sp, cthd } by new { sp.idSP, sp.TenSP } into grouped
                        orderby grouped.Sum(x => x.cthd.SoLuong) descending
                        select new
                        {
                            TenSP = grouped.Key.TenSP,
                            SoLuong = grouped.Sum(x => x.cthd.SoLuong)
                        };
            if (query != null)
            {

                var limitedQuery = query.Take(12);
                if (limitedQuery != null)
                {
                    DataGrid_Product.ItemsSource = limitedQuery.ToList();
                }
            }
        }
        public float GetRevenue(DateTime date)
        {
            var query = DataProvider.Ins.DB.HOADONs.Where(hd => hd.NgayHD.Year == date.Year && hd.NgayHD.Month == date.Month && hd.NgayHD.Day == date.Day && hd.idND == idND);
            float totalValues = 0;
            if (query.Count() > 0)
            {
                foreach (var hoadon in query)
                {
                    if (hoadon.NgayHD.Month == startDate.Month)
                        TotalOrders++;
                    HOADON hOADON = (HOADON)hoadon;
                    totalValues += (float)hOADON.ThanhToan;
                }
                return totalValues;
            }
            return 0;
        }
        public int GetTotalProduct()
        {
            if(idND == 0)
               return 0;

            var query = from hd in DataProvider.Ins.DB.HOADONs
                        join cthd in DataProvider.Ins.DB.CTHDs on hd.idHD equals cthd.idHD
                        join ctsp in DataProvider.Ins.DB.CTSPs on cthd.idCTSP equals ctsp.idCTSP
                        join sp in DataProvider.Ins.DB.SANPHAMs on ctsp.idSP equals sp.idSP
                        where hd.NgayHD >= startDate && hd.NgayHD <= endDate && hd.idND == idND
                        group new { sp, ctsp } by new { sp.TenSP, sp.idSP } into grouped
                        select grouped;
            if (query != null)
            {
                if (query.Count() > 0)
                {
                    return query.Count();
                }
                else return 0;
            }
            else return 0;
        }
    }
}
