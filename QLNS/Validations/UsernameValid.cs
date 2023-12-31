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
    public class UsernameValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            string str = value as string;
            if (value != null && str != string.Empty)
            {
                QLNSEntities qlns = new QLNSEntities();
                var query = from nd in qlns.NGUOIDUNGs
                            orderby nd.idND
                            select nd;
                var lst = query.ToList();
                for (int i = 0; i < lst.Count; i++)
                {
                    if (lst[i].TenDN == str)
                    {
                        return new ValidationResult(false, "Đã tồn tại tài khoản người dùng này!");
                    }
                }
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");
        }
    }
}
