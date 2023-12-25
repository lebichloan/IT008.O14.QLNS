using QLNS.Model;
using QLNS.ResourceXAML;
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
    /// Interaction logic for ImportProductManage.xaml
    /// </summary>
    public partial class ImportProductManage : Page
    {
        QLNSEntities qLNSEntities = new QLNSEntities();
        int pageNumber = 0;
        int pageSize = 15;

        public int idND {  get; set; }
        public ImportProductManage()
        {
            InitializeComponent();
        }
        public ImportProductManage(int userID)
        {
            InitializeComponent();
            idND = userID;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            LoadData(0);
        }

        private void btnAddImportDetail_Click(object sender, RoutedEventArgs e)
        {
            AddImportDetail addImportDetail = new AddImportDetail();
            addImportDetail.ShowDialog();
        }

        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber--;
            LoadData(pageNumber);
        }
        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            pageNumber++;
            LoadData(pageNumber);
        }
        private void LoadData(int page)
        {
            var query =
                from nhaphang in qLNSEntities.NHAPHANGs
                orderby nhaphang.idNH
                //where hoadon.idHD == 0
                select new
                {
                    idNH = nhaphang.idNH,
                    MaNH = nhaphang.MaNH,
                    NgayNhap = nhaphang.NgayNhap,
                    ThanhTien = nhaphang.ThanhTien,
                    GhiChu = nhaphang.GhiChu,
                };

            importDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnDeleteImport_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDetailImport_Click(object sender, RoutedEventArgs e)
        {
            var selectedImport = (dynamic)importDataGrid.SelectedItem;
            DetailImport detailImport = new DetailImport(selectedImport.idNH);
            detailImport.ShowDialog();
        }
    }
}
