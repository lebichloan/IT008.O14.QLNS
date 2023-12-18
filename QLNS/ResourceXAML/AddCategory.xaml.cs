﻿using QLNS.Model;
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
    /// Interaction logic for AddCategory.xaml
    /// </summary>
    public partial class AddCategory : Window
    {

        private string _DanhMuc;
        public string danhmuc { get => _DanhMuc; set { _DanhMuc = value; } }

        private string _MoTa;
        public string mota { get => _MoTa; set { _MoTa = value; } }
        public AddCategory()
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (tenDM.Text != "")
            {
                danhmuc = tenDM.Text;
                mota = moTa.Text;

                var DANHMUC = new DANHMUC()
                {

                    MoTa = mota,
                    TenDM = danhmuc,

                };

                DataProvider.Ins.DB.DANHMUCs.Add(DANHMUC);
                DataProvider.Ins.DB.SaveChanges();
                MessageBox.Show("Them danh muc thanh cong");
                this.Close();
            }
            else
                MessageBox.Show("Vui long nhap ten danh muc");
            
            
        }
    }
}
