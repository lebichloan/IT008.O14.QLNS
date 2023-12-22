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
using System.Windows.Navigation;
using System.Windows.Shapes;
using LiveCharts;
using QLNS.Model;
using QLNS.ResourceXAML;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for Report.xaml
    /// </summary>
    public partial class Report : Page
    {
        public class Product
        {
            
            public Product(string tenSP, int soLuong, float tongDoanhThu)
            {
                TenSP = tenSP;
                SoLuong = soLuong;
                TongDoanhThu = tongDoanhThu;
            }

            public string TenSP { get; set; }
            public int SoLuong { get; set; }
            public float TongDoanhThu { get; set; }
        }
        private DateTime startDate { get; set; }
        private DateTime endDate { get; set; }
        private int maxRevenueValues;
        private int maxCustomerValues;
        private float RevenueAVG { get; set; }
        public Report()
        {
            InitializeComponent();
            maxCustomerValues = maxRevenueValues = 0;
            //endDate = new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day);
            endDate = DateTime.Now;
            startDate = endDate.AddDays(-30);
            Load();
            LoadProduct();
        }

        public void Load()
        {
            List<string> dateLabels = new List<string>();
            List<int> RevenueValues = new List<int>();
            List<int> RevenueValuesPre = new List<int>();
            List<int> CustomerValues = new List<int>();
            List<int> CustomerValuesPre = new List<int>();
            int totalRevenue = 0;
            int totalRevenuePre = 0;
            int totalCustomer = 0;
            int totalCustomerPre = 0;
            DateTime datePre = startDate.AddYears(-1);
            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                dateLabels.Add(date.ToString("dd/MM/yyyy"));

                int revenue = GetRevenue(date);
                totalRevenue += revenue;
                if (revenue > maxRevenueValues)
                {
                    maxRevenueValues = revenue;
                }
                RevenueValues.Add(revenue);

                int revenuePre = GetRevenue(datePre);
                totalRevenuePre += revenuePre;
                if (revenuePre > maxRevenueValues)
                {
                    maxRevenueValues = revenuePre;
                }
                RevenueValuesPre.Add(revenuePre);

                int customer = GetCustomer(date);
                totalCustomer += customer;
                if (customer > maxCustomerValues)
                {
                    maxCustomerValues = customer;
                }
                CustomerValues.Add(customer);

                int customerPre = GetCustomer(datePre);
                totalCustomerPre += customerPre;
                if (customerPre > maxCustomerValues)
                {
                    maxCustomerValues = customerPre;
                }
                CustomerValuesPre.Add(customerPre);

                //Dk lap
                datePre = datePre.AddDays(1);
            }

            //Xet Title Chart doanh thu
            Text_TotalRevenue.Text = totalRevenue.ToString("N0").Replace(",", " ") + " VND";
            if (totalRevenue >= totalRevenuePre)
            {
                float percent = (float)(totalRevenue - totalRevenuePre) / (float)totalRevenuePre;
                Text_PercentRevenue.Text = percent.ToString("P2").Replace(".", ",");
                Color color = (Color)ColorConverter.ConvertFromString("#11D13B");
                SolidColorBrush brush = new SolidColorBrush(color);
                Text_PercentRevenue.Foreground = brush;
            }
            else
            {
                float percent = (float)(totalRevenuePre - totalRevenue) / (float)totalRevenuePre;
                Text_PercentRevenue.Text = percent.ToString("P2").Replace(".", ",");
                Color color = (Color)ColorConverter.ConvertFromString("Red");
                SolidColorBrush brush = new SolidColorBrush(color);
                Text_PercentRevenue.Foreground = brush;
            }

            //Xet Title Chart khach hang
            Text_TotalCustomer.Text = totalCustomer.ToString("N0").Replace(",", " ") + " Lượt";
            if (totalCustomer >= totalCustomerPre)
            {
                float percent = (float)(totalCustomer - totalCustomerPre) / (float)totalCustomerPre;
                Text_PercentCustomer.Text = percent.ToString("P2").Replace(".", ",");
                Color color = (Color)ColorConverter.ConvertFromString("#11D13B");
                SolidColorBrush brush = new SolidColorBrush(color);
                Text_PercentCustomer.Foreground = brush;
            }
            else
            {
                float percent = (float)(totalCustomerPre - totalCustomer) / (float)totalCustomerPre;
                Text_PercentCustomer.Text = percent.ToString("P2").Replace(".", ",");
                Color color = (Color)ColorConverter.ConvertFromString("Red");
                SolidColorBrush brush = new SolidColorBrush(color);
                Text_PercentCustomer.Foreground = brush;
            }

            // Chart Doanh thu dường biểu đồ
            ChartValues<int> chartRevenueValues = new ChartValues<int>(RevenueValues);
            ChartValues<int> chartRevenueValuesPre = new ChartValues<int>(RevenueValuesPre);
            RevenueChart_Values.Values = chartRevenueValues;
            RevenueChart_ValuesPre.Values = chartRevenueValuesPre;
            // Chart khách hàng dường biểu đồ
            ChartValues<int> chartCusTomerValues = new ChartValues<int>(CustomerValues);
            ChartValues<int> chartCusTomerValuesPre = new ChartValues<int>(CustomerValuesPre);
            CustomerChart_Values.Values = chartCusTomerValues;
            CustomerChart_ValuesPre.Values = chartCusTomerValuesPre;
            // Chart Doanh thu (trục X, Y)
            RevenueChart_AxisX.Labels = dateLabels;
            RevenueChart_AxisX_Separator.Step = chartRevenueValues.Count() / 5;
            int temp = maxRevenueValues / 50000;
            RevenueChart_AxisY.MaxValue = (temp + 1) * 50000;
            // Chart khách hàng (trục X, Y)
            CustomerChart_AxisX.Labels = dateLabels;
            CustomerChart_AxisX_Separator.Step = RevenueChart_AxisX_Separator.Step;
            int temp1 = maxCustomerValues / 10;
            CustomerChart_AxisY.MaxValue = (temp1 + 1) * 10;

            //Bình quân doanh thu
            TimeSpan khoangcach = endDate.Subtract(startDate);
            RevenueAVG = (float)totalRevenue / khoangcach.Days;
        }

        public int GetRevenue(DateTime date)
        {
            var query = DataProvider.Ins.DB.HOADONs.Where(hd => hd.NgayHD.Year == date.Year && hd.NgayHD.Month == date.Month && hd.NgayHD.Day == date.Day);
            int totalValues = 0;
            if (query.Count() > 0)
            {
                foreach (var hoadon in query)
                {
                    HOADON hOADON = (HOADON)hoadon;
                    totalValues += (int)hOADON.ThanhToan;
                }
                return totalValues;
            }
            return 0;
        }

        public int GetCustomer(DateTime date)
        {
            int slCustomer = DataProvider.Ins.DB.HOADONs.Where(hd => hd.NgayHD.Year == date.Year && hd.NgayHD.Month == date.Month && hd.NgayHD.Day == date.Day).Count();
            if (slCustomer > 0)
            {
                return slCustomer;
            }
            return 0;
        }

        private void CheckBox_VisibilityChart_Click(object sender, RoutedEventArgs e)
        {
            if (CheckBox_VisibilityChart.IsChecked == true)
            {
                CustomerChart_ValuesPre.Visibility = Visibility.Visible;
                RevenueChart_ValuesPre.Visibility = Visibility.Visible;
            }
            else
            {
                CustomerChart_ValuesPre.Visibility = Visibility.Collapsed;
                RevenueChart_ValuesPre.Visibility = Visibility.Collapsed;
            }
        }

        private void btnStatistical_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (DatePicker_StartDate.SelectedDate == null)
                {
                    throw new Exception("Vui lòng chọn ngày để thống kê phân tích");
                }
                if (DatePicker_EndDate.SelectedDate == null)
                {
                    throw new Exception("Vui lòng chọn ngày để thống kê phân tích");
                }
                if(DatePicker_StartDate.SelectedDate >= DatePicker_EndDate.SelectedDate)
                {
                    throw new Exception("Ngày bắt đầu thống kê phải nhỏ hơn ngày kết thúc thống kê!");
                }
                startDate = DatePicker_StartDate.SelectedDate.Value;
                endDate = DatePicker_EndDate.SelectedDate.Value;
                Load();
                LoadProduct();
            }
            catch (Exception ex)
            {
                Message message = new Message();
                message.message.Text = ex.Message;
                message.ShowDialog();
            }
        }

        public void LoadProduct()
        {
            int MaxSoLuong = 0;
            float MaxTongDoanhThu = 0;
            float MinTongDoanhThu = 0;
            Product SanPhamBanChayNhat = new Product("",0,0);
            Product SanPhamCoDoanhThuCaoNhat = new Product("", 0, 0);
            Product SanPhamCoDoanhThuThapNhat = new Product("", 0, 0);
            int Totalproduct = 0;
            var query = from sp in DataProvider.Ins.DB.SANPHAMs
                        join ctsp in DataProvider.Ins.DB.CTSPs on sp.idSP equals ctsp.idSP
                        join cthd in DataProvider.Ins.DB.CTHDs on ctsp.idCTSP equals cthd.idCTSP
                        join hd in DataProvider.Ins.DB.HOADONs on cthd.idHD equals hd.idHD
                        where hd.NgayHD > startDate && hd.NgayHD <= endDate
                        group new { sp, cthd } by new { sp.TenSP, sp.idSP } into grouped
                        orderby grouped.Key.TenSP
                        select new 
                        {
                            TenSP = grouped.Key.TenSP,
                            SoLuong = grouped.Sum(x => x.cthd.SoLuong),
                            TongDoanhThu = (float)grouped.Sum(x => x.cthd.ThanhTien)
                        };

            DataGrid_Product.ItemsSource = query.ToList();
            foreach(var product in query) 
            {
                if(MaxTongDoanhThu == 0)
                {
                    MaxTongDoanhThu = product.TongDoanhThu;
                    MinTongDoanhThu = product.TongDoanhThu;
                    MaxSoLuong = product.SoLuong;
                    SanPhamBanChayNhat = new Product(product.TenSP,product.SoLuong ,product.TongDoanhThu);
                    SanPhamCoDoanhThuCaoNhat = new Product(product.TenSP,product.SoLuong ,product.TongDoanhThu);
                    SanPhamCoDoanhThuThapNhat = new Product(product.TenSP,product.SoLuong ,product.TongDoanhThu);
                }

                Totalproduct += product.SoLuong;

                if(product.SoLuong >= MaxSoLuong)
                {
                    if(product.TongDoanhThu > SanPhamBanChayNhat.TongDoanhThu && product.SoLuong == MaxSoLuong) 
                    {
                        MaxSoLuong = product.SoLuong;
                        SanPhamBanChayNhat = new Product(product.TenSP, product.SoLuong, product.TongDoanhThu);
                    }
                    else if(product.SoLuong > MaxSoLuong)
                    {
                        MaxSoLuong = product.SoLuong;
                        SanPhamBanChayNhat = new Product(product.TenSP, product.SoLuong, product.TongDoanhThu);
                    }
                }
                if(product.TongDoanhThu > MaxTongDoanhThu)
                {
                    MaxTongDoanhThu = product.TongDoanhThu;
                    SanPhamCoDoanhThuCaoNhat = new Product(product.TenSP, product.SoLuong, product.TongDoanhThu);
                }
                if(product.TongDoanhThu < MinTongDoanhThu)
                {
                    MinTongDoanhThu = product.TongDoanhThu;
                    SanPhamCoDoanhThuThapNhat = new Product(product.TenSP, product.SoLuong, product.TongDoanhThu);
                }
            }
            Text_ToTalProduct.Text = Totalproduct.ToString("N0").Replace(",", " ") + " Sản phẩm";
            Text_Time.Text = startDate.Date.ToShortDateString() + " - " + endDate.Date.ToShortDateString();
            Text_AVG.Text = $"{RevenueAVG:F2}" + " VND";
            if(SanPhamBanChayNhat.TenSP != string.Empty)
                Text_SPBCN.Text = SanPhamBanChayNhat.TenSP.ToString() + " - " + SanPhamBanChayNhat.SoLuong.ToString() + " sản phẩm";
            if (SanPhamBanChayNhat.TenSP != string.Empty)
                Text_SPCDTCN.Text = SanPhamCoDoanhThuCaoNhat.TenSP.ToString() + " - " + SanPhamCoDoanhThuCaoNhat.TongDoanhThu.ToString() + " VND";
            if (SanPhamBanChayNhat.TenSP != string.Empty)
                Text_SPCDTTN.Text = SanPhamCoDoanhThuThapNhat.TenSP.ToString() + " - " + SanPhamCoDoanhThuThapNhat.TongDoanhThu.ToString() + " VND";
        }
    }
}