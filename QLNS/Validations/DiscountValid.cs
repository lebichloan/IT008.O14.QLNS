﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace QLNS.Validations
{
    public class DiscountValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {

            //throw new NotImplementedException();
            var temp = value as string;
            var isNumeric = int.TryParse(temp, out _);
            if (temp == null || temp == string.Empty)
            {
                return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
            }
            if (!isNumeric)
            {
                return new ValidationResult(false, "Vui lòng nhập một số!");
            }
            else if (int.Parse(temp) < 0 || int.Parse(temp) > 100)
            {
                return new ValidationResult(false, "Vui lòng nhập giá trị từ 0 đến 100!");
            }

            return new ValidationResult(true, null);
        }
    }
}
