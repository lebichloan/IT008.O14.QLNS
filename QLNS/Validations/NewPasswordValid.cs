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
    internal class NewPasswordValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            string str = value as string;
            if (value != null && str != string.Empty)
            {
                int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());
                QLNSEntities qlns = new QLNSEntities();
                var query = from nd in qlns.NGUOIDUNGs
                            where nd.idND == id
                            select nd;
                var lst = query.ToList();
                if (str.Equals(lst[0].MatKhau))
                {
                    return new ValidationResult(false, "Mật khẩu mới không được trùng mật khẩu cũ!");
                }
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
