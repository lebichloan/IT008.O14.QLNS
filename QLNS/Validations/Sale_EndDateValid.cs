using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class Sale_EndDateValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            if (value != null)
            {
                string t;
                if (App.Current.Properties["startDate"] != null)
                {
                    t = App.Current.Properties["startDate"].ToString();
                    if (t == "")
                    {
                        return new ValidationResult(false, "Vui lòng nhập ngày bắt đầu!");
                    }
                }
                else
                {
                    return new ValidationResult(false, "Vui lòng nhập ngày bắt đầu!");
                }

                DateTime start = DateTime.Parse(t);
                DateTime end = DateTime.Parse(value.ToString());
                if (DateTime.Compare(start, end) > 0)
                {
                    return new ValidationResult(false, "Ngày kết thúc phải trễ hơn ngày bắt đầu!");
                }
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
