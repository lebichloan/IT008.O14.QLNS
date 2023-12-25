using QLNS.Model;
using QLNS.ResourceXAML;
using QLNS.ViewModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QLNS.Pages
{
    /// <summary>
    /// Interaction logic for HomeQuanLy.xaml
    /// </summary>
    public partial class HomeThuNgan : Page, INotifyPropertyChanged
    {

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public HomeThuNgan()
        {
            InitializeComponent();
            DataContext = this;
            SetValue();
        }

        private string tenNV;
        public string tennv { get { return tenNV; } set { tenNV = value; OnPropertyChanged(); } }

        private void SetValue()
        {
            LoginViewModel loginViewModel = new LoginViewModel();
            if (App.Current.Properties["isLogin"] != null && int.Parse(App.Current.Properties["isLogin"].ToString()) == 1)
            {
                int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());
                QLNSEntities qlnsEntities = new QLNSEntities();
                var query = from nd in qlnsEntities.NGUOIDUNGs
                            join nv in qlnsEntities.NHANVIENs on nd.idNV equals nv.idNV
                            where nd.idND == id
                            select nd;
                var lst = query.ToList();
                tennv = lst[0].NHANVIEN.TenNV;
            }
            else
            {
                tennv = "< Chưa đăng nhập >";
            }
        }

        private void ViewProfile_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (App.Current.Properties["isLogin"] != null && int.Parse(App.Current.Properties["isLogin"].ToString()) == 1)
            {
                UserDialog detailUser = new UserDialog();
                detailUser.ShowDialog();
            }
            else
            {
                Message message = new Message();
                message.message.Text = "Vui lòng đăng nhập để xem thông tin!";
                message.ShowDialog();
            }
        }
    }
}
