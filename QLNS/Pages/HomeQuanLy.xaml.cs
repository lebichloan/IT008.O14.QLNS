using LiveCharts;
using MaterialDesignThemes.Wpf;
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

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for HomeQuanLy.xaml
    /// </summary>
    public partial class HomeQuanLy : Page, INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public HomeQuanLy()
        {
            InitializeComponent();
            DataContext = this;
            SetValue();
            Load();
        }

        private int idND = 0;
        public HomeQuanLy(int idND)
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
                //MessageBox.Show("Bạn chưa đăng nhập!");
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

        private DateTime startDate;
        private DateTime endDate;
        private float TotalRevenue;
        private int TotalOrders;
        private float Profit;
        private ChartValues<float> RevenueValues;

        public void Load()
        {
            List<string> dateLabels = new List<string>();
            RevenueValues = new ChartValues<float>();
            TotalRevenue = 0;
            TotalOrders = 0;
            Profit = 0;
            endDate = DateTime.Now;
            startDate = new DateTime(endDate.Year,endDate.Month,1);
            float maxRevenueValue = 0;
            for (DateTime date = endDate.AddDays(-30); date <= endDate; date = date.AddDays(1))
            {
                dateLabels.Add(date.ToString("dd/MM/yyyy"));

                float revenue = GetRevenue(date);
                if(date.Month == endDate.Month)
                {
                    TotalRevenue += revenue;
                }
                if(revenue > maxRevenueValue)
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
            //int temp = (int)maxRevenueValue / 50000;
            //RevenueChart_AxisY.MaxValue = (temp + 1) * 50000;
            Profit = TotalRevenue - GetImport();
            txtProfit.Text = Profit.ToString("N0") + " VND";
            txtTotalValues.Text = TotalRevenue.ToString("N0") + " VND";
            LoadProduct();

            //Text hien thi
            txtToTalOrders.Text = GetSLOrders().ToString();
            txtPercentRevenue.Text = Percent(GetTotalRevenuePre(), TotalRevenue) + " so với cùng kì tháng trước";
            txtPercentProfit.Text = Percent(GetTotalRevenuePre() - GetImportPre(),Profit) + " so với cùng kì tháng trước";
            txtPercentOrders.Text = Percent(GetSLOrdersPre(), GetSLOrders()) + " so với cùng kì tháng trước";
        }

        public float GetRevenue(DateTime date)
        {
            var query = DataProvider.Ins.DB.HOADONs.Where(hd => hd.NgayHD.Year == date.Year && hd.NgayHD.Month == date.Month && hd.NgayHD.Day == date.Day);
            float totalValues = 0;
            if (query.Count() > 0)
            {
                foreach (var hoadon in query)
                {
                    HOADON hOADON = (HOADON)hoadon;
                    totalValues += (float)hOADON.ThanhToan;
                }
                return totalValues;
            }
            return 0;
        }
        public float GetImport()
        {
            float totalImport = 0;
            var query = from hd in DataProvider.Ins.DB.HOADONs
                        join cthd in DataProvider.Ins.DB.CTHDs on hd.idHD equals cthd.idHD
                        join ctsp in DataProvider.Ins.DB.CTSPs on cthd.idCTSP equals ctsp.idCTSP
                        where hd.NgayHD >= startDate && hd.NgayHD <= endDate
                        group new { ctsp, cthd } by 1 into grouped
                        select new
                        {
                            totalImport = (float)grouped.Sum(x => x.cthd.SoLuong * x.ctsp.DonGiaNhap),
                        };
            if (query !=null) {
                foreach(var hd in query)
                {
                    totalImport = hd.totalImport;
                }
            }
            return totalImport;
        }
        public void LoadProduct()
        {
            DateTime date30Pre = endDate.AddDays(-30);
            var query = from hd in DataProvider.Ins.DB.HOADONs
                        join cthd in DataProvider.Ins.DB.CTHDs on hd.idHD equals cthd.idHD
                        join ctsp in DataProvider.Ins.DB.CTSPs on cthd.idCTSP equals ctsp.idCTSP
                        join sp in DataProvider.Ins.DB.SANPHAMs on ctsp.idSP equals sp.idSP
                        where hd.NgayHD >= date30Pre && hd.NgayHD <= endDate
                        group new { sp, cthd } by new { sp.TenSP, sp.idSP } into grouped
                        orderby grouped.Sum(x => x.cthd.SoLuong) descending
                        select new
                        {
                            TenSP = grouped.Key.TenSP,
                            SoLuong = grouped.Sum(x => x.cthd.SoLuong),
                            TongDoanhThu = (float)grouped.Sum(x => x.cthd.ThanhTien)
                        };
            if(query!= null)
            {
                var limitedQuery = query.Take(12);

                if (limitedQuery != null)
                {
                    DataGrid_Product.ItemsSource = limitedQuery.ToList();
                }
            }
        }

        public float GetTotalRevenuePre()
        {
            float totalRevenue = 0;
            DateTime startDatePre = startDate.AddDays(-5);
            startDatePre = new DateTime(startDatePre.Year, startDatePre.Month,1);
            DateTime endDatePre = startDate.AddDays(30);
            var temp = DataProvider.Ins.DB.HOADONs.Where(x => x.NgayHD >= startDatePre && x.NgayHD <= endDatePre && x.NgayHD.Month == startDatePre.Month);
            if(temp != null && temp.Count() != 0)
            {
                totalRevenue = float.Parse(temp.Sum(x => x.ThanhToan).ToString());
            }
            return totalRevenue;
        }
        public float GetImportPre()
        {
            DateTime startDatePre = startDate.AddDays(-5);
            startDatePre = new DateTime(startDatePre.Year, startDatePre.Month, 1);
            DateTime endDatePre = startDate.AddDays(30);
            float totalImport = 0;
            var query = from hd in DataProvider.Ins.DB.HOADONs
                        join cthd in DataProvider.Ins.DB.CTHDs on hd.idHD equals cthd.idHD
                        join ctsp in DataProvider.Ins.DB.CTSPs on cthd.idCTSP equals ctsp.idCTSP
                        where hd.NgayHD >= startDatePre && hd.NgayHD <= endDatePre && hd.NgayHD.Month==startDatePre.Month
                        group new { ctsp, cthd } by 1 into grouped
                        select new
                        {
                            totalImport = (float)grouped.Sum(x => x.cthd.SoLuong * x.ctsp.DonGiaNhap),
                        };
            if (query != null)
            {
                foreach (var hd in query)
                {
                    totalImport = hd.totalImport;
                }
            }
            return totalImport;
        }
        public int GetSLOrdersPre()
        {
            DateTime startDatePre = startDate.AddDays(-5);
            startDatePre = new DateTime(startDatePre.Year, startDatePre.Month, 1);
            DateTime endDatePre = startDate.AddDays(30);
            int sl = DataProvider.Ins.DB.HOADONs.Where(x => x.NgayHD >= startDatePre && x.NgayHD <= endDatePre && x.NgayHD.Month == startDatePre.Month).Count();
            return sl;
        }
        public int GetSLOrders()
        {
            int sl = DataProvider.Ins.DB.HOADONs.Where(x => x.NgayHD >= startDate && x.NgayHD <= endDate && x.NgayHD.Month == startDate.Month).Count();
            return sl;
        }
        public string Percent(float a, float b)
        {
            a=Math.Abs(a);
            b=Math.Abs(b);
            float percent = 0;
            string kq;
            if(a > b)
            {
                percent = (float)(a - b) / (float)a;
                kq = "Giảm " + percent.ToString("P2");
            }
            else
            {
                percent = (float)(b - a) / (float)a;
                kq = "Tăng " + percent.ToString("P2");
            }
            return kq;
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
    }
}
