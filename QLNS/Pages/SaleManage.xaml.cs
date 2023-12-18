﻿using QLNS.Model;
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
            
            var query = DataProvider.Ins.DB.KHUYENMAIs.OrderBy(khuyenmai => khuyenmai.idKM);
            memberDataGrid.ItemsSource = query.Skip(pageSize * page).Take(pageSize).ToList();
            btnPre.IsEnabled = page > 0; // Kiểm tra page có ở trang đầu tiên không
            btnNext.IsEnabled = query.Skip(pageSize * (page + 1)).Take(pageSize).Any(); // Kiểm tra page kế tiếp có dữ liệu không
            lblPage.Text = string.Format("{0}/{1}", page + 1, (query.Count() + pageSize - 1) / pageSize);
        }

        private void btnAddSale_Click(object sender, RoutedEventArgs e)
        {
            AddSale addSale = new AddSale();
            addSale.ShowDialog();
        }

        private void btnDetail_Click(object sender, RoutedEventArgs e)
        {
            try 
            {
                KHUYENMAI khuyenmai = (KHUYENMAI)memberDataGrid.SelectedItem;
                DetailSale detailSale = new DetailSale();
                detailSale.saleManage = this;
                detailSale.idKM = khuyenmai.idKM;

                detailSale.TenKM.Text = khuyenmai.TenKM.ToString();
                detailSale.NgayBD.Text = khuyenmai.NgayBD.ToString("dd/MM/yyyy");
                detailSale.NgayKT.Text = khuyenmai.NgayKT.ToString("dd/MM/yyyy");
                detailSale.GiamGia.Text = khuyenmai.GiamGia.ToString();

                if (khuyenmai.idLKH == null)
                {
                    detailSale.idLKH.Text = "";
                }
                else
                {
                    detailSale.idLKH.Text = khuyenmai.idLKH.ToString();
                }

                if (khuyenmai.MoTa == null)
                {
                    detailSale.MoTa.Text = "";
                }
                else
                {
                    detailSale.MoTa.Text = khuyenmai.MoTa.ToString();
                }

                detailSale.ShowDialog();

            }
            catch { }
        }
    }
}
