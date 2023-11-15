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
    /// Interaction logic for AddBill.xaml
    /// </summary>
    public partial class AddBill : Window
    {
        public AddBill()
        {
            InitializeComponent();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
            {
                this.WindowState = WindowState.Normal;
            }
        }

        // Start: Button Close | Restore | Minimize 
        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnRestore_Click(object sender, RoutedEventArgs e)
        {
            if (WindowState == WindowState.Normal)
                WindowState = WindowState.Maximized;
            else
                WindowState = WindowState.Normal;
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void addBill_Loaded(object sender, RoutedEventArgs e)
        {
            LoadAllProduct();
            LoadDataIntoTab();
        }

        // End: Button Close | Restore | Minimize

        QLNSEntities qLNSEntities = new QLNSEntities();

        private void LoadDataIntoTab()
        {
            var query = from danhmuc in qLNSEntities.DANHMUCs
                                orderby danhmuc.idDM
                                //where
                                select new
                                {
                                    idDM = danhmuc.idDM,
                                    TenDM = danhmuc.TenDM,
                                };

            var category = query.ToList();

            foreach (var item in category)
            {
                var tabItem = new TabItem();
                tabItem.Header = item.TenDM.ToString();

                //var product = qLNSEntities.SANPHAMs.Where(
                //    p=> p.idDM == item.idDM).ToList();

                var queryProduct = from sanpham in qLNSEntities.SANPHAMs
                                   join ctsp in qLNSEntities.CTSPs
                                   on sanpham.idSP equals ctsp.idSP
                                   join danhmuc in qLNSEntities.DANHMUCs
                                   on sanpham.idDM equals danhmuc.idDM
                            orderby ctsp.idCTSP
                            where sanpham.idDM == item.idDM
                            select new
                            {
                                MaSP = ctsp.MaCTSP,
                                TenSP = sanpham.TenSP,
                                SLCL = ctsp.SLConLai,
                                DonGia = ctsp.DonGiaXuat,
                                GhiChu = ctsp.GhiChu,
                            };

                tabItem.Content = new { listProducts = queryProduct.ToList() };
                categoryTabControl.Items.Add(tabItem);
            }
        }

        private void LoadAllProduct()
        {
            var queryAllProduct = from sanpham in qLNSEntities.SANPHAMs
                                  join ctsp in qLNSEntities.CTSPs
                                  on sanpham.idSP equals ctsp.idSP
                                  orderby ctsp.idCTSP
                                  select new
                                  {
                                      MaSP = ctsp.MaCTSP,
                                      TenSP = sanpham.TenSP,
                                      SLCL = ctsp.SLConLai,
                                      DonGia = ctsp.DonGiaXuat,
                                      GhiChu = ctsp.GhiChu,
                                  };

            var tabItem = new TabItem();
            tabItem.Header = "Tất cả sản phẩm";
            tabItem.Content = new {listProducts = queryAllProduct.ToList() };
            categoryTabControl.Items.Add(tabItem);
        }

        private string searchterm = null;
        private int isSearch = 0;
        private void txtSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                searchterm = txtSearch.Text.ToLower();
                if (searchterm == null)
                {
                    //Khong tim kiem
                    isSearch = 0;
                }
                else
                {
                    FilterData(searchterm);
                    isSearch = 1;
                }
            }
        }

        private void FilterData(string searchTerm)
        {
            var queryFilterProduct = from sanpham in qLNSEntities.SANPHAMs
                                     join ctsp in qLNSEntities.CTSPs
                                     on sanpham.idSP equals ctsp.idSP                                    
                                     orderby ctsp.idCTSP
                                     where 
                                     ctsp.MaCTSP.ToLower().Contains(searchTerm)
                                     || sanpham.TenSP.ToLower().Contains(searchTerm)
                                     || ctsp.GhiChu.ToLower().Contains(searchTerm)
                                     select new
                                     {
                                         MaSP = ctsp.MaCTSP,
                                         TenSP = sanpham.TenSP,
                                         SLCL = ctsp.SLConLai,
                                         DonGia = ctsp.DonGiaXuat,
                                         GhiChu = ctsp.GhiChu,
                                     };

            var filterProduct = queryFilterProduct.ToList();
            if (filterProduct.Count > 0 )
            {
                var firstTab = categoryTabControl.Items[0] as TabItem;
                if (searchTerm == "")
                {
                    firstTab.Header = "Tất cả sản phẩm";
                }
                else
                {
                    firstTab.Header = "Kết quả tìm kiếm";
                }
                firstTab.Content = new { listProducts = queryFilterProduct.ToList() };
            }

            if (categoryTabControl.Items.Count > 0 )
            {
                categoryTabControl.SelectedIndex = 0;
            }
        }

    }
}
