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
    /// Interaction logic for SaleManage.xaml
    /// </summary>
    public partial class SaleManage : Page
    {
        QLNSEntities qlnsEntities = new QLNSEntities();

        public SaleManage()
        {
            InitializeComponent();
        }

        private void sale_Loaded(object sender, RoutedEventArgs e)
        {
            //Load dữ liệu ban đầu khi vừa vào
            LoadData(0);
        }

        int pageNumber = 0;
        int pageSize = 10;
        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber--;
            LoadData(pageNumber);
        }
        public void LoadDataCurrent()
        {
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

            //var query = DataProvider.Ins.DB.KHUYENMAIs.OrderBy(khuyenmai => khuyenmai.idKM);
            var query =
                from khuyenmai in qlnsEntities.KHUYENMAIs
                join loaikhachhang in qlnsEntities.LOAIKHACHHANGs on khuyenmai.idLKH equals loaikhachhang.idLKH
                orderby khuyenmai.idKM
                //where hoadon.idHD == 0
                select new
                {
                    idKM = khuyenmai.idKM,
                    MaKM = khuyenmai.MaKM,
                    TenKM = khuyenmai.TenKM,
                    MoTa = khuyenmai.MoTa,
                    idLKH = loaikhachhang.TenLKH,
                    NgayBD = khuyenmai.NgayBD.Month + "/" + khuyenmai.NgayBD.Day + "/" + khuyenmai.NgayBD.Year,
                    NgayKT = khuyenmai.NgayKT.Month + "/" + khuyenmai.NgayKT.Day + "/" + khuyenmai.NgayKT.Year,
                    GiamGia = khuyenmai.GiamGia,
                    idND = khuyenmai.idND,
                };

            saleDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnAddSale_Click(object sender, RoutedEventArgs e)
        {
            AddSale addSale = new AddSale();
            addSale.ShowDialog();
            LoadDataCurrent();
        }

        private void btnDetail_Click(object sender, RoutedEventArgs e)
        {
            try 
            {
                //KHUYENMAI khuyenmai = (KHUYENMAI)saleDataGrid.SelectedItem;
                //DetailSale detailSale = new DetailSale();
                //detailSale.saleManage = this;
                //detailSale.idKM = khuyenmai.idKM;

                //detailSale.TenKM.Text = khuyenmai.TenKM.ToString();
                //detailSale.NgayBD.Text = khuyenmai.NgayBD.ToString("dd/MM/yyyy");
                //detailSale.NgayKT.Text = khuyenmai.NgayKT.ToString("dd/MM/yyyy");
                //detailSale.GiamGia.Text = khuyenmai.GiamGia.ToString();

                //if (khuyenmai.idLKH == null)
                //{
                //    detailSale.idLKH.Text = "";
                //}
                //else
                //{
                //    detailSale.idLKH.Text = khuyenmai.idLKH.ToString();
                //}

                //if (khuyenmai.MoTa == null)
                //{
                //    detailSale.MoTa.Text = "";
                //}
                //else
                //{
                //    detailSale.MoTa.Text = khuyenmai.MoTa.ToString();
                //}

                //detailSale.ShowDialog();

            }
            catch { }
        }

        private void btnDeleteSale_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                string MaKM = ((TextBlock)saleDataGrid.SelectedCells[1].Column.GetCellContent(saleDataGrid.SelectedCells[1].Item)).Text;

                KHUYENMAI khuyenmai = DataProvider.Ins.DB.KHUYENMAIs.FirstOrDefault(k => k.MaKM == MaKM);
                HOADON hoadon = DataProvider.Ins.DB.HOADONs.FirstOrDefault(h => h.idKM == khuyenmai.idKM);

                if (hoadon != null)
                {
                    Message message = new Message();
                    message.message.Text = "Không thể xóa khuyến mãi này, vì tồn tại nhiều dữ liệu liên quan!";
                    message.ShowDialog();
                }
                else
                {
                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn xóa khuyến mãi này?";
                    messageOption.ShowDialog();
                    bool isDelete = MessageOption.isAgree;
                    messageOption.Close();
                    if (isDelete)
                    {
                        KHUYENMAI km = DataProvider.Ins.DB.KHUYENMAIs.Find(khuyenmai.idKM);
                        DataProvider.Ins.DB.KHUYENMAIs.Remove(km);
                        DataProvider.Ins.DB.SaveChanges();
                        LoadDataCurrent();
                        Message message = new Message();
                        message.message.Text = "Xóa khuyến mãi thành công!";
                        message.ShowDialog();
                    }
                }
            }
            catch (Exception ex)
            {
                Message message = new Message();
                message.message.Text = ex.Message;
                message.ShowDialog();
            }
        }
    }
}
