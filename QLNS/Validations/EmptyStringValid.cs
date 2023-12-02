using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using ValidationResult = System.Windows.Controls.ValidationResult;

namespace QLNS.Validations
{
    public class EmptyStringValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            var str = value as string;
            if (str == null || str == string.Empty)
            {
                return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
            }
            return new ValidationResult(true, null);
        }
    }
}
