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
            LoginWindow loginwd = new LoginWindow();
            loginwd.ShowDialog();
        }
    }
}
