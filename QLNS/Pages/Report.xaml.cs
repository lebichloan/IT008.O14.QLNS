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
        private DateTime startDate { get; set; }
        private DateTime endDate { get; set; }
        //private List<string> dateLabels = new List<string>();
        //private List<int> RevenueValues = new List<int>();
        //private List<int> RevenueValuesPre = new List<int>();
        //private List<int> CustomerValues = new List<int>();
        //private List<int> CustomerValuesPre = new List<int>();
        private int maxRevenueValues;
        private int maxCustomerValues;
        //private int totalRevenue;
        //private int totalRevenuePre;
        //private int totalCustomer;
        //private int totalCustomerPre;
        public Report()
        {
            InitializeComponent();
            maxCustomerValues = maxRevenueValues = 0;
            endDate = new DateTime(2023, 11, 30);
            startDate = endDate.AddDays(-30);
            Load();
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
                if(revenue > maxRevenueValues)
                {
                    maxRevenueValues = revenue;
                }
                RevenueValues.Add(revenue);

                int revenuePre = GetRevenue(datePre);
                totalRevenuePre += revenuePre;
                if(revenuePre > maxRevenueValues)
                {
                    maxRevenueValues = revenuePre;
                }
                RevenueValuesPre.Add(revenuePre);

                int customer = GetCustomer(date);
                totalCustomer += customer;
                if(customer > maxCustomerValues)
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
            if(totalRevenue >= totalRevenuePre)
            {
                float percent = (float)(totalRevenue - totalRevenuePre) / (float)totalRevenuePre;
                Text_PercentRevenue.Text = percent.ToString("P2").Replace(".",",");
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
            Text_TotalCustomer.Text = totalCustomer.ToString() + " Lượt";
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
            RevenueChart_AxisY.MaxValue = (temp+1) * 50000;
            // Chart khách hàng (trục X, Y)
            CustomerChart_AxisX.Labels = dateLabels;
            CustomerChart_AxisX_Separator.Step = RevenueChart_AxisX_Separator.Step;
            int temp1 = maxCustomerValues / 10;
            CustomerChart_AxisY.MaxValue = (temp1 + 1) * 10;
        }

        public int GetRevenue(DateTime date)
        {
            var query = DataProvider.Ins.DB.HOADONs.Where(hd => hd.NgayHD == date);
            int totalValues = 0;
            if(query.Count() > 0)
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
            int slCustomer = DataProvider.Ins.DB.HOADONs.Where(hd => hd.NgayHD == date).Count();
            if (slCustomer > 0)
            {
                return slCustomer;
            }
            return 0;
        }

        private void CheckBox_VisibilityChart_Click(object sender, RoutedEventArgs e)
        {
            if(CheckBox_VisibilityChart.IsChecked == true)
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
                    throw new Exception( "Vui lòng chọn ngày để thống kê phân tích");
                }
                if (DatePicker_EndDate.SelectedDate == null)
                {
                    throw new Exception( "Vui lòng chọn ngày để thống kê phân tích");
                }
                startDate = DatePicker_StartDate.SelectedDate.Value;
                endDate = DatePicker_EndDate.SelectedDate.Value;
                Load();
            } 
            catch(Exception ex)
            {
                Message message = new Message();
                message.message.Text = ex.Message;
                message.ShowDialog();
            }
           
        }
    }
}
