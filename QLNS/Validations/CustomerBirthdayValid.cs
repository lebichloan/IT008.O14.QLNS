using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Markup;

namespace QLNS.Validations
{
    public class CustomerBirthdayValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            if (value != null)
            {
                DateTime now = DateTime.Now;
                DateTime birthDay = DateTime.Parse(value.ToString());
                if (birthDay > now)
                {
                    return new ValidationResult(false, "Ngày sinh không được lớn hơn ngày hiện tại!");
                }
                App.Current.Properties["BirthDay"] = value.ToString();
                return new ValidationResult(true, null);
            }
            else
            {
                App.Current.Properties["BirthDay"] = "";
            }
            return new ValidationResult(true, null);
        }
    }
}
