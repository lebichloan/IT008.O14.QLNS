using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class StaffDayOfWorkValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            if (value != null)
            {
                DateTime workingDate = DateTime.Parse(value.ToString());
                DateTime now = DateTime.Now;
                if (workingDate > now)
                {
                    return new ValidationResult(false, "Ngày vào làm không được lớn hơn ngày hiện tại");
                }
                if (App.Current.Properties["BirthDay"] != null && App.Current.Properties["BirthDay"].ToString() != "")
                {
                    DateTime birthDay = DateTime.Parse(App.Current.Properties["BirthDay"].ToString());
                    if (workingDate < birthDay)
                    {
                        return new ValidationResult(false, "Ngày vào làm không được bé hơn ngày sinh!");
                    }
                    if (workingDate.Year - birthDay.Year < 18)
                    {
                        return new ValidationResult(false, "Nhân viên phải đủ 18 tuổi tại thời điểm vào làm!");
                    }
                }
                App.Current.Properties["BirthDay"] = "";
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
