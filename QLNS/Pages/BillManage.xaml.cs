using QLNS.Model;
using QLNS.ResourceXAML;
using System.Data.Entity.Core.Objects;
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
using System.Data;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for BillManage.xaml
    /// </summary>
    public partial class BillManage : Page
    {
        QLNSEntities qLNSEntities = new QLNSEntities();

        public BillManage()
        {
            InitializeComponent();
        }

        private void btnAddBill_Click(object sender, RoutedEventArgs e)
        {
            AddBill addBill = new AddBill();
            addBill.ShowDialog();
        }

        int pageNumber = 0;
        int pageSize = 10;
        private void billManage_Loaded(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu ban đầu khi vừa vào
            LoadData(0);
            btnPageNumber.IsEnabled = false;
        }
        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            if (isSearch == 1)
            {
                pageNumberFilter--;
                FilterData(searchTerm, pageNumberFilter);
            }
            else
            {
                pageNumber--;
                LoadData(pageNumber);
            }
        }
        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            if (isSearch == 1)
            {
                pageNumberFilter++;
                FilterData(searchTerm, pageNumberFilter);
            }
            else
            {
                pageNumber++;
                LoadData(pageNumber);
            }
        }
        private void LoadData(int page)
        {
            var query =
                from hoadon in qLNSEntities.HOADONs
                orderby hoadon.idHD
                //where hoadon.idHD == 0
                select new
                {
                    idHD = hoadon.idHD,
                    SoHD = hoadon.SoHD,
                    NgayHD = hoadon.NgayHD,
                    TenKH = hoadon.KHACHHANG.TenKH,
                    ThanhTien = hoadon.ThanhTien,
                    PTThanhToan = hoadon.PTTHANHTOAN.TenPT,
                    GhiChu = hoadon.GhiChu
                };

            memberDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
            lblTotal.Text = string.Format("{0} {1} {2}", "Danh sách bao gồm", query.Count(), "hóa đơn");
        }

        private void btnDetail_Click(object sender, RoutedEventArgs e)
        {
            DetailBill detailBill = new DetailBill();
            detailBill.ShowDialog();
        }

        private void memberDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (memberDataGrid.SelectedItems.Count > 0)
            {
                // get id hoa don duoc chon
                var selectedHoaDon = (dynamic)memberDataGrid.SelectedItem;
                int selectedId = selectedHoaDon.idHD;
            }
        }

        private string searchTerm = null;
        private int pageNumberFilter = 0;
        private int isSearch = 0;
        private void FilterData(string searchTerm, int page)
        {
            var query = from hoadon in qLNSEntities.HOADONs
                        orderby hoadon.idHD
                        where 
                        //hoadon.idHD == searchTerm
                        hoadon.SoHD.ToLower().Contains(searchTerm)
                        || hoadon.KHACHHANG.TenKH.ToLower().Contains(searchTerm)
                        || hoadon.PTTHANHTOAN.TenPT.ToLower().Contains(searchTerm)                          
                        select new
                        {
                            idHD = hoadon.idHD,
                            SoHD = hoadon.SoHD,
                            NgayHD = hoadon.NgayHD,
                            TenKH = hoadon.KHACHHANG.TenKH,
                            ThanhTien = hoadon.ThanhTien,
                            PTThanhToan = hoadon.PTTHANHTOAN.TenPT,
                            GhiChu = hoadon.GhiChu
                        };

            //memberDataGrid.ItemsSource = query.ToList();
            memberDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
            lblTotal.Text = string.Format("{0} {1} {2}", "Danh sách bao gồm", query.Count(), "hóa đơn");
        }

        private void txtSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                searchTerm = txtSearch.Text.ToLower();
                if (searchTerm == "")
                {
                    LoadData(0);
                    isSearch = 0;
                }
                else
                {
                    FilterData(searchTerm, 0);
                    isSearch = 1;
                }
            }
        }
    }
}
