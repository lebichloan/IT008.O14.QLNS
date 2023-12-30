using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class PhoneNumberValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            string number = value as string;
            var isNumeric = Int64.TryParse(number, out _);
            if (value != null && number != string.Empty)
            {
                if (!isNumeric)
                {
                    return new ValidationResult(false, "Vui lòng nhập số điện thoại hợp lệ (số điện thoại có 10 chữ số)!");
                }
                if (number.Length != 10)
                {
                    return new ValidationResult(false, "Vui lòng nhập số điện thoại hợp lệ (số điện thoại có 10 chữ số)!");
                }
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
