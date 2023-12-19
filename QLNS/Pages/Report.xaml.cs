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

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for Report.xaml
    /// </summary>
    public partial class Report : Page
    {
        private DateTime startDate { get; set; }
        private DateTime endDate { get; set; }
        private List<string> dateLabels = new List<string>();
        private List<int> dateValues = new List<int>();
        private List<int> dateValuesPre = new List<int>();
        private int maxValues;
        private int totalRevenue;
        private int totalRevenuePre;
        public Report()
        {
            InitializeComponent();
            totalRevenue = 0;
            totalRevenuePre = 0;
            Load();
        }
        public void Load()
        {
            endDate = new DateTime(2023, 11, 30);
            startDate = endDate.AddDays(-30);
            DateTime datePre = startDate.AddYears(-1);
            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                dateLabels.Add(date.ToString("dd/MM/yyyy"));

                int revenue = GetRevenue(date);
                totalRevenue += revenue;
                if(revenue > maxValues)
                {
                    maxValues = revenue;
                }
                dateValues.Add(revenue);

                int revenuePre = GetRevenue(datePre);
                totalRevenuePre += revenuePre;
                if(revenuePre > maxValues)
                {
                    maxValues = revenuePre;
                }
                dateValuesPre.Add(revenuePre);

                //Dk lap
                datePre = datePre.AddDays(1);
            }
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

            ChartValues<int> chartValues = new ChartValues<int>(dateValues);
            ChartValues<int> chartValuesPre = new ChartValues<int>(dateValuesPre);
            RevenueChart_Values.Values = chartValues;
            RevenueChart_ValuesPre.Values = chartValuesPre;

            RevenueChart_AxisX.Labels = dateLabels;
            int temp = maxValues / 50000;
            RevenueChart_AxisY.MaxValue = (temp+1) * 50000;
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
    }
}
