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

        // End: Button Close | Restore | Minimize

        private void addBill_Loaded(object sender, RoutedEventArgs e)
        {
            ucAddProduct.IsActive = true;
            ucAddCustomer.IsUnable = true;
            ucCheckBill.IsUnable = true;
            ucCheckOut.IsUnable = true;
            ucExport.IsUnable=true;

            ucAddCustomer.IsEnabled = false;
            ucCheckBill.IsEnabled=false;
            ucCheckOut.IsEnabled=false;
            ucExport.IsEnabled=false;

            stepContainer.Navigate(new System.Uri("Pages/AddBillStep1.xaml", UriKind.RelativeOrAbsolute));
        }

        private int current_step = 1;

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            if (current_step >= 1 )
            {
                stepContainer.Navigate(new System.Uri("Pages/AddBillStep1.xaml", UriKind.RelativeOrAbsolute));
                ucAddProduct.IsActive=true;
                current_step = 2;
            }
        }

        private void btnAddCustomer_Click(object sender, RoutedEventArgs e)
        {
            if (current_step >= 2)
            {
                stepContainer.Navigate(new System.Uri("Pages/AddBillStep2.xaml", UriKind.RelativeOrAbsolute));
                ucAddProduct.IsActive = true;
                current_step = 3;
            }
        }

        private void btnCheckBill_Click(object sender, RoutedEventArgs e)
        {
            if (current_step >= 3)
            {
                stepContainer.Navigate(new System.Uri("Pages/AddBillStep3.xaml", UriKind.RelativeOrAbsolute));
                ucAddProduct.IsActive = true;
                current_step = 4;
            }
        }

        private void btnCheckOut_Click(object sender, RoutedEventArgs e)
        {
            if (current_step >= 4)
            {
                stepContainer.Navigate(new System.Uri("Pages/AddBillStep4.xaml", UriKind.RelativeOrAbsolute));
                ucAddProduct.IsActive = true;
                current_step = 5;
            }
        }

        private void btnExport_Click(object sender, RoutedEventArgs e)
        {
            if (current_step >= 5)
            {
                stepContainer.Navigate(new System.Uri("Pages/AddBillStep5.xaml", UriKind.RelativeOrAbsolute));
                ucAddProduct.IsActive = true;
                current_step = 6;
            }
        }
    }
}
