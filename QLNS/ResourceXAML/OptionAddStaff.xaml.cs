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
    /// Interaction logic for OptionAddStaff.xaml
    /// </summary>
    public partial class OptionAddStaff : Window
    {
        public OptionAddStaff()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void ButtonAddUser_Click(object sender, RoutedEventArgs e)
        {
            AddStaffAndUser addStaffAndUser = new AddStaffAndUser();
            this.Close();
            addStaffAndUser.ShowDialog();
        }

        private void ButtonNo_Click(object sender, RoutedEventArgs e)
        {
            AddStaff addStaff = new AddStaff();
            this.Close();
            addStaff.ShowDialog();
        }
    }
}
