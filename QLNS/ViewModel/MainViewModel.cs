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
            ForgotPasswordWindow fpwd= new ForgotPasswordWindow();
            fpwd.ShowDialog();
            VerifyEmailWindow verifyEmail = new VerifyEmailWindow();
            verifyEmail.ShowDialog();
            ResetPasswordWindow resetPassword = new ResetPasswordWindow();
            resetPassword.ShowDialog();
        }
    }
}
