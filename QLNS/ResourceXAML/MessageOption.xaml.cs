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
    /// Interaction logic for MessageOption.xaml
    /// </summary>
    public partial class MessageOption : Window
    {
        public static bool isAgree;
        public MessageOption()
        {
            InitializeComponent();
            isAgree = false;
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnNo_Click(object sender, RoutedEventArgs e)
        {
            isAgree = false;
            Close();
        }

        private void btnYes_Click(object sender, RoutedEventArgs e)
        {
            isAgree = true;
            Close();
        }
    }
}
