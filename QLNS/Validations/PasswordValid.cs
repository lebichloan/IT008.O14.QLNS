using QLNS.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class PasswordValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            string str = value as string;
            if (value != null && str != string.Empty)
            {
                if (str.Length > 30)
                {
                    return new ValidationResult(false, "Mật khẩu không được quá 30 ký tự!");
                }
                App.Current.Properties["newPassword"] = str;
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
