using LiveCharts;
using QLNS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
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
    /// Interaction logic for ReportStorage.xaml
    /// </summary>
    public partial class ReportStorage : Page
    {
        private DateTime startDate { get; set; }
        private DateTime endDate { get; set; }
        public ReportStorage()
        {
            InitializeComponent();
            endDate = DateTime.Now;
            startDate = endDate.AddDays(-30);
            ComboBox_Date.SelectedIndex = 1;
            LoadProductStorage();
            LoadImport();
            //LoadProduct();
        }
        public void LoadProduct()
        {
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
            foreach (var product in query)
            {
                Totalproduct += product.SoLuong;
            }
            Text_ToTalProduct.Text = Totalproduct.ToString("N0").Replace(",", " ") + " Sản phẩm";
        }

        private void ComboBox_Date_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(ComboBox_Date.SelectedIndex == 0)
            {
                startDate = endDate.AddDays(-7);
            }
            else if(ComboBox_Date.SelectedIndex == 1)
            {
                startDate = endDate.AddDays(-30);
            }
            else if(ComboBox_Date.SelectedIndex == 2)
            {
                startDate = endDate.AddDays(-60);
            }
            else if(ComboBox_Date.SelectedIndex == 3)
            {
                startDate = endDate.AddDays(-180);
            }

            LoadProduct();
        }

        public void LoadProductStorage()
        {
            var query = from sp in DataProvider.Ins.DB.SANPHAMs
                        join ctsp in DataProvider.Ins.DB.CTSPs on sp.idSP equals ctsp.idSP
                        group new { sp, ctsp } by new { sp.idSP, sp.TenSP } into grouped
                        orderby grouped.Key.idSP
                        select new
                        {
                            TenSP = grouped.Key.TenSP,
                            SLConLai = grouped.Sum(x => x.ctsp.SLConLai),
                            SLLoi = grouped.Sum(x => x.ctsp.SoLuongLoi),
                        };

            var data = query.ToList().Select(item => new
            {
                item.TenSP,
                item.SLConLai,
                item.SLLoi,
                TinhTrang = ConvertStatus(item.SLConLai)
            });
            DataGrid_ProductStorage.ItemsSource = data.ToList();
            Text_TotalProductStorage.Text = data.Count().ToString("N0").Replace(",", " ") + " Mặt hàng";

        }
        private string ConvertStatus(int sl)
        {
            if (sl <= 0)
                return "Hết hàng";
            else if (sl < 10)
                return "Sắp hết";
            else
                return "Còn hàng";
        }

        public void LoadImport()
        {
            float totalcost = 0f;
            int maxQuantityValues = 0;
            float maxTotalCostValues = 0;
            int count = 0;
            List<string> nameLablesAxisX = new List<string>();
            List<float> ValuesAxisY_Left = new List<float>();
            List<int> ValuesAxisY_Right = new List<int>();

            int idNH = DataProvider.Ins.DB.NHAPHANGs.Max(x => x.idNH);
            var query = from sp in DataProvider.Ins.DB.SANPHAMs
                        join ctsp in DataProvider.Ins.DB.CTSPs on sp.idSP equals ctsp.idSP
                        where ctsp.idNH == idNH
                        orderby ctsp.DonGiaNhap * ctsp.SoLuongNhap descending
                        select new
                        {
                            TenSP = sp.TenSP,
                            SLNhap = ctsp.SoLuongNhap,
                            DonGiaNhap = ctsp.DonGiaNhap,
                            TongNhap = ctsp.DonGiaNhap * ctsp.SoLuongNhap
                        };
            DataGrid_CTSP.ItemsSource = query.ToList();
            Text_TotalProductImport.Text = query.Count().ToString("N0").Replace(",", " ") + " Mặt hàng";

            foreach(var item in query)
            {
                if (count == 0)
                {
                    maxQuantityValues = item.SLNhap;
                    maxTotalCostValues = (float)item.TongNhap;
                }
                count++;
                
                if(count <= 7)
                {
                    nameLablesAxisX.Add(item.TenSP.ToString());

                    ValuesAxisY_Left.Add((float)item.TongNhap);

                    ValuesAxisY_Right.Add(item.SLNhap);

                    if (item.SLNhap > maxQuantityValues)
                    {
                        maxQuantityValues = item.SLNhap;
                    }
                }
                //Tong chi phi
                totalcost += (float)item.TongNhap;
            }

            //Ui binding
            TotalCost_Text.Text = totalcost.ToString("N0").Replace(",", " ") + " VND";

            //Chart visibilitty
            ChartValues<float> ChartAxisY_Left_Values = new ChartValues<float>(ValuesAxisY_Left);
            ChartValues<int> ChartAxisY_Right_Values = new ChartValues<int>(ValuesAxisY_Right);
            TotalCostValues_ColumnSeries.Values = ChartAxisY_Left_Values;
            QuantityValues_ColumnSeries.Values = ChartAxisY_Right_Values;

            //Truc X, Y
            AxisX_Bottom.Labels = nameLablesAxisX;
            AxisY_Left.MaxValue = (int)maxTotalCostValues;
            AxisY_Right.MaxValue = (int)maxQuantityValues;
            
        }
    }
}
