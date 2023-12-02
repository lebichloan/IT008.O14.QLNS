using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class Sale_StartDateValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            if (value != null)
            {
                var time = DateTime.Parse(value.ToString());
                DateTime now = DateTime.Today;
                if (DateTime.Compare(time, now) > 0)
                {
                    return new ValidationResult(false, "Ngày bắt đầu phải từ ngày hôm nay trở về trước!");
                }
                App.Current.Properties["startDate"] = value.ToString();
                return new ValidationResult(true, null);
            }
            App.Current.Properties["startDate"] = "";
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
