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
using QLNS.ViewModel;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for CustomerManage.xaml
    /// </summary>
    public partial class CustomerManage : Page
    {
        QLNSEntities qlnsEntities = new QLNSEntities();
        public CustomerManage()
        {
            InitializeComponent();
        }

        //Tab item customer
        private void customer_Loaded(object sender, RoutedEventArgs e)
        {
            //Load dữ liệu ban đầu khi vừa vào
            LoadCustomerData(0);
        }

        int pageNumber = 0;
        int pageSize = 10;
        private void btnPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber--;
            LoadCustomerData(pageNumber);
        }
        public void LoadDataCustomerCurrent()
        {
            LoadCustomerData(pageNumber);
        }
        private void btnNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            pageNumber++;
            LoadCustomerData(pageNumber);
        }

        private void LoadCustomerData(int page)
        {
            var query =
                from khachhang in qlnsEntities.KHACHHANGs
                join loaikhachhang in qlnsEntities.LOAIKHACHHANGs on khachhang.idLKH equals loaikhachhang.idLKH
                orderby khachhang.idKH
                select new
                {
                    idKH = khachhang.idKH,
                    MaKH = khachhang.MaKH,
                    TenKH = khachhang.TenKH,
                    GioiTinh = khachhang.GioiTinh,
                    NgaySinh = khachhang.NgaySinh,
                    DiaChi = khachhang.DiaChi,
                    SDT = khachhang.SDT,
                    NgayTG = khachhang.NgayTG.Month + "/" + khachhang.NgayTG.Day + "/" + khachhang.NgayTG.Year,
                    DiemTichLuy = khachhang.DiemTichLuy,
                    idLKH = loaikhachhang.TenLKH,
                };
            //var query = DataProvider.Ins.DB.KHACHHANGs.OrderBy(khachhang => khachhang.idKH);

            //var query1 = DataProvider.Ins.DB.KHACHHANGs;
            //var query2 = DataProvider.Ins.DB.LOAIKHACHHANGs;
            //var join = query1.Join(query2, x => x.idLKH, y => y.idLKH, (quer1, quer2) => new { query1, query2 });


            CustomerDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToArray();
            btnPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        //Tab item customer type
        private void customerTypes_Loaded(object sender, RoutedEventArgs e)
        {
            //Load dữ liệu ban đầu khi vừa vào
            LoadCustomerTypesData(0);
        }

        int pageNumber1 = 0;
        int pageSize1 = 10;

        public void LoadDataCustomerTypesCurrent()
        {
            LoadCustomerTypesData(pageNumber1);
        }
        private void btnCTPre_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page trước đó
            pageNumber1--;
            LoadCustomerTypesData(pageNumber1);
        }

        private void btnCTNext_Click(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu page kế tiếp
            pageNumber1++;
            LoadCustomerTypesData(pageNumber1);
        }

        private void LoadCustomerTypesData(int page)
        {
            var query =
                from loaikhachhang in qlnsEntities.LOAIKHACHHANGs
                orderby loaikhachhang.idLKH
                where loaikhachhang.idLKH != 0
                select new
                {
                    idLKH = loaikhachhang.idLKH,
                    MaLKH = loaikhachhang.MaLKH,
                    TenLKH = loaikhachhang.TenLKH,
                    MoTa = loaikhachhang.MoTa,
                    DiemTichLuyToiThieu = loaikhachhang.DiemTichLuyToiThieu,
                };
            CustomerTypesDataGrid.ItemsSource = query.Skip(pageSize1 * page).Take(pageSize1).ToList();
            btnCTPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnCTNext.IsEnabled = query.Skip(pageSize1 * (page + 1)).Take(pageSize1).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblCTPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize1 - 1) / pageSize1);

        }

        private void btnAddCustomer_Click(object sender, RoutedEventArgs e)
        {
            AddCustomer addCustomer = new AddCustomer();
            addCustomer.ShowDialog();
            LoadDataCustomerCurrent();
        }

        private void btnAddCustomerTypes_Click(object sender, RoutedEventArgs e)
        {
            AddCustomerType addCustomerType = new AddCustomerType();
            addCustomerType.ShowDialog();
            LoadDataCustomerTypesCurrent();
        }

        private void btnDetailCustommer_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var cellInfo = CustomerDataGrid.SelectedCells[1];
                var content = ((TextBlock)cellInfo.Column.GetCellContent(cellInfo.Item)).Text;
                var query = from kh in qlnsEntities.KHACHHANGs
                            join loaikhachhang in qlnsEntities.LOAIKHACHHANGs on kh.idLKH equals loaikhachhang.idLKH
                            where content == kh.MaKH
                            select kh;

                var lst = query.ToList();

                DetailCustomer detail = new DetailCustomer();
                detail.customerManage = this;
                detail.idKH = lst[0].idKH;
                detail.TenKH.Text = ((TextBlock)CustomerDataGrid.SelectedCells[2].Column.GetCellContent(CustomerDataGrid.SelectedCells[2].Item)).Text;
                detail.GioiTinh.Text = ((TextBlock)CustomerDataGrid.SelectedCells[3].Column.GetCellContent(CustomerDataGrid.SelectedCells[3].Item)).Text;

                if (((TextBlock)CustomerDataGrid.SelectedCells[4].Column.GetCellContent(CustomerDataGrid.SelectedCells[4].Item)).Text != "")// can null
                {
                    DateTime temp = DateTime.Parse(((TextBlock)CustomerDataGrid.SelectedCells[4].Column.GetCellContent(CustomerDataGrid.SelectedCells[4].Item)).Text);
                    detail.NgaySinh.SelectedDate = temp;
                }
                else
                    detail.NgaySinh.Text = "";

                if (((TextBlock)CustomerDataGrid.SelectedCells[5].Column.GetCellContent(CustomerDataGrid.SelectedCells[5].Item)).Text == "")// can null
                {
                    detail.DiaChi.Text = "";
                }
                else
                {
                    detail.DiaChi.Text = ((TextBlock)CustomerDataGrid.SelectedCells[5].Column.GetCellContent(CustomerDataGrid.SelectedCells[5].Item)).Text;
                }
                detail.SDT.Text = ((TextBlock)CustomerDataGrid.SelectedCells[6].Column.GetCellContent(CustomerDataGrid.SelectedCells[6].Item)).Text;
                detail.NgayTG.SelectedDate = DateTime.Parse(((TextBlock)CustomerDataGrid.SelectedCells[7].Column.GetCellContent(CustomerDataGrid.SelectedCells[7].Item)).Text);
                detail.DTL.Text = ((TextBlock)CustomerDataGrid.SelectedCells[8].Column.GetCellContent(CustomerDataGrid.SelectedCells[8].Item)).Text;
                detail.LoaiKH.Text = ((TextBlock)CustomerDataGrid.SelectedCells[9].Column.GetCellContent(CustomerDataGrid.SelectedCells[9].Item)).Text;
                detail.ShowDialog();

                LoadDataCustomerCurrent();
            }
            catch { }

        }

        private void btnDetail_Click(object sender, RoutedEventArgs e)
        {

        }


        private void buttonDeleteLKH_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                string idLKH = ((TextBlock)CustomerTypesDataGrid.SelectedCells[1].Column.GetCellContent(CustomerTypesDataGrid.SelectedCells[1].Item)).Text;

                KHACHHANG khachhang = DataProvider.Ins.DB.KHACHHANGs.FirstOrDefault(k => k.idLKH.ToString() == idLKH);
                KHUYENMAI khuyenmai = DataProvider.Ins.DB.KHUYENMAIs.FirstOrDefault(k => k.idLKH.ToString() == idLKH);
                HOADON hoadon = DataProvider.Ins.DB.HOADONs.FirstOrDefault(h => h.idLKH.ToString() == idLKH);
                //NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.FirstOrDefault(n => n.idNV == nhanvien.idNV);
                if (khachhang != null || khuyenmai != null || hoadon != null)
                {
                    Message message = new Message();
                    message.message.Text = "Không thể xóa loại khách hàng này, vì tồn tại nhiều dữ liệu liên quan!";
                    message.ShowDialog();
                }
                else
                {
                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn xóa loại khách hàng này?";
                    messageOption.ShowDialog();
                    bool isDelete = MessageOption.isAgree;
                    messageOption.Close();
                    if (isDelete)
                    {
                        LOAIKHACHHANG lkh = DataProvider.Ins.DB.LOAIKHACHHANGs.Find(int.Parse(idLKH));
                        DataProvider.Ins.DB.LOAIKHACHHANGs.Remove(lkh);
                        DataProvider.Ins.DB.SaveChanges();
                        LoadDataCustomerTypesCurrent();
                        Message message = new Message();
                        message.message.Text = "Xóa thành công loại khách hàng!";
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

        private void btnDeleteCustomer_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                string MaKH = ((TextBlock)CustomerDataGrid.SelectedCells[1].Column.GetCellContent(CustomerDataGrid.SelectedCells[1].Item)).Text;

                KHACHHANG khachhang = DataProvider.Ins.DB.KHACHHANGs.FirstOrDefault(k => k.MaKH == MaKH);
                HOADON hoadon = DataProvider.Ins.DB.HOADONs.FirstOrDefault(h => h.idKH == khachhang.idKH);

                if (hoadon != null)
                {
                    Message message = new Message();
                    message.message.Text = "Không thể xóa khách hàng này, vì tồn tại nhiều dữ liệu liên quan!";
                    message.ShowDialog();
                }
                else
                {
                    MessageOption messageOption = new MessageOption();
                    messageOption.message.Text = "Bạn có chắc chắn muốn xóa khách hàng này?";
                    messageOption.ShowDialog();
                    bool isDelete = MessageOption.isAgree;
                    messageOption.Close();
                    if (isDelete)
                    {
                        KHACHHANG kh = DataProvider.Ins.DB.KHACHHANGs.Find(khachhang.idKH);
                        DataProvider.Ins.DB.KHACHHANGs.Remove(kh);
                        DataProvider.Ins.DB.SaveChanges();
                        LoadDataCustomerCurrent();
                        Message message = new Message();
                        message.message.Text = "Xóa thành công khách hàng!";
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

        private void buttonDetailCustomerType_Clicked(object sender, RoutedEventArgs e)
        {
            try
            {
                var cellInfo = CustomerTypesDataGrid.SelectedCells[1];
                var content = ((TextBlock)cellInfo.Column.GetCellContent(cellInfo.Item)).Text;
                var query = from lkh in qlnsEntities.LOAIKHACHHANGs
                            where content == lkh.MaLKH
                            select lkh;

                var lst = query.ToList();

                DetailCustomerType detail = new DetailCustomerType();
                detail.customerManage = this;
                detail.idLKH = lst[0].idLKH;
                detail.TenLKH.Text = ((TextBlock)CustomerTypesDataGrid.SelectedCells[2].Column.GetCellContent(CustomerTypesDataGrid.SelectedCells[2].Item)).Text;

                if (((TextBlock)CustomerTypesDataGrid.SelectedCells[3].Column.GetCellContent(CustomerTypesDataGrid.SelectedCells[3].Item)).Text == "")// can null
                {
                    detail.MoTa.Text = "";
                }
                else
                {
                    detail.MoTa.Text = ((TextBlock)CustomerTypesDataGrid.SelectedCells[3].Column.GetCellContent(CustomerTypesDataGrid.SelectedCells[3].Item)).Text;
                }
                detail.DTLTT.Text = ((TextBlock)CustomerTypesDataGrid.SelectedCells[4].Column.GetCellContent(CustomerTypesDataGrid.SelectedCells[4].Item)).Text;
                detail.ShowDialog();

                LoadDataCustomerTypesCurrent();
            }
            catch { }

        }
    }
}
