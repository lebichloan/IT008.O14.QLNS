using QLNS.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
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
    /// Interaction logic for DetailHomeAccount.xaml
    /// </summary>
    public partial class DetailHomeAccount : Window, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public int idND { get; set; }

        private string maNguoiDung;
        public string MaNguoiDung { get { return maNguoiDung; } set { maNguoiDung = value; OnPropertyChanged(); } }

        public DetailHomeAccount()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void detailHomeAccount_Loaded(object sender, RoutedEventArgs e)
        {
            DataContext = this;
            NGUOIDUNG nguoidung = DataProvider.Ins.DB.NGUOIDUNGs.Find(idND);
            if (nguoidung != null)
            {
                MaNguoiDung = nguoidung.MaND;
            }
        }
    }
}
