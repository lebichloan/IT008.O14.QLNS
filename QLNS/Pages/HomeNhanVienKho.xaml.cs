using LiveCharts;
using QLNS.Model;
using QLNS.ResourceXAML;
using QLNS.ViewModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
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
    /// Interaction logic for HomeQuanLy.xaml
    /// </summary>
    public partial class HomeNhanVienKho : Page, INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public HomeNhanVienKho()
        {
            InitializeComponent();
            DataContext = this;
            SetValue();
            //Load();
        }

        private int idND = 0;
        public HomeNhanVienKho(int idND)
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
        private int TotalTonKho;
        private int TotalHetHang;
        private double TotalGiaTriTonKho;
        public void Load()
        {
            List<string> dateLabels = new List<string>();
            ChartValues<float> ImportValues = new ChartValues<float>();
            endDate = DateTime.Now;
            startDate = endDate.AddDays(-30);
            TotalTonKho = 0;
            TotalGiaTriTonKho = 0;
            LoadProduct();
            LoadProductHetHang();
            LoadLanNhapGanDay();
            //Ui text hien thi
            txtTonKho.Text = TotalTonKho.ToString("N0") + " Sản phẩm";
            txtHetHang.Text = TotalHetHang.ToString("N0") + " Sản phẩm";
            txtTotalImport.Text = TotalGiaTriTonKho.ToString("N0") + " VND";
            //load chart
            var nhaphang = DataProvider.Ins.DB.NHAPHANGs.OrderBy(x => x.NgayNhap).Take(8);
            foreach(var nh in nhaphang)
            {
                dateLabels.Add(nh.NgayNhap.ToShortDateString());
                ImportValues.Add((float)nh.ThanhTien);
            }
            ImportChart_AxisX.Labels = dateLabels;
            ImportChart_Values.Values = ImportValues;
        }
        public void LoadProduct()
        {
            var query = from ctsp in DataProvider.Ins.DB.CTSPs
                        join sp in DataProvider.Ins.DB.SANPHAMs on ctsp.idSP equals sp.idSP
                        where ctsp.TinhTrang == 1 && ctsp.SLConLai > 0
                        group new { sp,ctsp} by new {sp.idSP,sp.TenSP} into grouped
                        orderby grouped.Sum(x => x.ctsp.SLConLai) descending
                        select new
                        {
                            TenSP = grouped.Key.TenSP,
                            SoLuong = grouped.Sum(x => x.ctsp.SLConLai)
                        };
            if (query != null)
            {
                int spsaphet = 0;

                TotalTonKho = query.Count();
                var limitedQuery = query.Take(12);
                if (limitedQuery != null)
                {
                    DataGrid_Product.ItemsSource = limitedQuery.ToList();
                }
                foreach (var q in query)
                {
                    if (q.SoLuong < 10)
                    {
                        spsaphet++;
                    }
                }
                if (spsaphet > 0)
                {
                    txtMoreHetHang.Text = spsaphet.ToString("N0") + " sản phẩm sắp hết";
                }
                else
                {
                    txtMoreHetHang.Text = "";
                }
            }
        }
        public void LoadProductHetHang()
        {
            var query = from ctsp in DataProvider.Ins.DB.CTSPs
                        join sp in DataProvider.Ins.DB.SANPHAMs on ctsp.idSP equals sp.idSP
                        where ctsp.TinhTrang == 0 && ctsp.SLConLai == 0
                        group new { sp, ctsp } by new { sp.idSP, sp.TenSP } into grouped
                        orderby grouped.Sum(x => x.ctsp.SLConLai) descending
                        select new
                        {
                            TenSP = grouped.Key.TenSP,
                            SoLuong = grouped.Sum(x => x.ctsp.SLConLai)
                        };
            if (query != null)
            {
                TotalHetHang = query.Count();
                
            }
        }
        public void LoadLanNhapGanDay()
        {
            // NgayNhapGanNhat = DataProvider.Ins.DB.NHAPHANGs.Max(x => x.NgayNhap);
            NHAPHANG nhaphang = DataProvider.Ins.DB.NHAPHANGs.FirstOrDefault(x => x.NgayNhap == DataProvider.Ins.DB.NHAPHANGs.Max(y => y.NgayNhap));
            TotalGiaTriTonKho = (double)DataProvider.Ins.DB.CTSPs.Sum(x => x.SLConLai * x.DonGiaNhap);
            int slspNhap = DataProvider.Ins.DB.CTSPs.Where(x => x.idNH == nhaphang.idNH).Count();
            ////text ui
            txtMoreImport.Text = "Giá trị nhập gần đây " + nhaphang.ThanhTien.ToString("N0") + " VND";
            txtMoreTonKho.Text = "Số sản phẩm nhập gần đây " + slspNhap.ToString("N0") + " sản phẩm";
        }
    }
}
