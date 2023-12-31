using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class CustomerJoiningDateValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            if (value != null)
            {
                DateTime joiningDate = DateTime.Parse(value.ToString());
                DateTime now = DateTime.Now;
                if (joiningDate > now)
                {
                    return new ValidationResult(false, "Ngày tham gia không được lớn hơn ngày hiện tại");
                }
                if (App.Current.Properties["BirthDay"] != null && App.Current.Properties["BirthDay"].ToString() != "")
                {
                    DateTime birthDay = DateTime.Parse(App.Current.Properties["BirthDay"].ToString());
                    if (joiningDate < birthDay)
                    {
                        return new ValidationResult(false, "Ngày tham gia không được bé hơn ngày sinh!");
                    }
                }
                App.Current.Properties["BirthDay"] = "";
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
