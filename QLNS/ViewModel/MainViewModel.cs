using MaterialDesignThemes.Wpf;
using QLNS.ResourceXAML;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace QLNS.ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        public MainViewModel() 
        {
            LoginWindow login = new LoginWindow();
            login.ShowDialog();
            if (login.DataContext == null)
                return;
            var loginVM = login.DataContext as LoginViewModel;
            if(loginVM.IsLogin == true)
            {
                if(loginVM.IdWindowShow == 1)
                {
                    MainQuanLy mainQuanLy = new MainQuanLy();   
                    mainQuanLy.ShowDialog();
                }
                else if(loginVM.IdWindowShow == 2)
                {
                    MainThuNgan mainThuNgan = new MainThuNgan();
                    mainThuNgan.ShowDialog();
                }
                else if( loginVM.IdWindowShow == 3)
                {
                    MainNhanVienKho mainNhanVienKho = new MainNhanVienKho();
                    mainNhanVienKho.ShowDialog();
                }
            }
        }
    }
}
