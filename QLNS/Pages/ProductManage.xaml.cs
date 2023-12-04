using QLNS.Model;
using QLNS.ResourceXAML;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
    /// Interaction logic for ProductManage.xaml
    /// </summary>
    public partial class ProductManage : Page
    {
        QLNSEntities qLNSEntities = new QLNSEntities();
        public ProductManage()
        {
            InitializeComponent();
        }
        int pageNumber = 0;
        int pageSize = 15;

        private void productManage_Loaded(object sender, RoutedEventArgs e)
        {
            // Load dữ liệu ban đầu khi vừa vào
            LoadData(0);
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
                from sanpham in qLNSEntities.SANPHAMs
                join ctsp in qLNSEntities.CTSPs
                on sanpham.idSP equals ctsp.idSP
                orderby ctsp.idCTSP
                where ctsp.SLConLai > 0
                select new
                {
                    idSP = ctsp.idCTSP,
                    MaSP = ctsp.MaCTSP,
                    TenSP = sanpham.TenSP,
                    MoTa = sanpham.MoTa,
                    SLDB = ctsp.DaBan,
                    SLCL = ctsp.SLConLai,
                    idDM = sanpham.DANHMUC.TenDM,
                };

            productDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Được ấn nếu page > 0
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Được ấn nếu như trang tiếp theo có tồn tại dữ liệu
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }


        
        

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

            

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QLNSEntities"].ToString();
            if (connectionString.ToLower().StartsWith("metadata="))
            {
                System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder efBuilder = new System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder(connectionString);
                connectionString = efBuilder.ProviderConnectionString;
            }
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            

            if (productDataGrid.SelectedItems.Count > 0)
            {
                // get id hoa don duoc chon
                var selectedSanPham = (dynamic)productDataGrid.SelectedItem;
                string selectedIdSP = selectedSanPham.MaSP;
                MessageBoxResult messageBoxResult = System.Windows.MessageBox.Show("Xác nhận xóa sản phẩm có mã " + selectedIdSP + "?" , "Delete Confirmation", System.Windows.MessageBoxButton.YesNo);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    sqlCommand.CommandText = "DELETE FROM CTSP WHERE MaCTSP = '" + selectedIdSP + "'";
                    try
                    {
                        sqlConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        throw ex;
                    }
                    finally { sqlConnection.Close(); }
                }
                LoadData(pageNumber);
            }
                

        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            AddNewProduct addNewProduct = new AddNewProduct(); 
            addNewProduct.ShowDialog();
        }
    }
}
