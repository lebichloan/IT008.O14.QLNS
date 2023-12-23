using QLNS.ResourceXAML;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class ConfirmPasswordValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            string str = value as string;
            string newPass = string.Empty;
            if (App.Current.Properties["newPassword"] != null)
            {
                newPass = App.Current.Properties["newPassword"].ToString();
            }
            if (value != null && str != string.Empty)
            {
                if (!(str.Equals(newPass)))
                {
                    return new ValidationResult(false, "Mật khẩu không trùng khớp!");
                }
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
