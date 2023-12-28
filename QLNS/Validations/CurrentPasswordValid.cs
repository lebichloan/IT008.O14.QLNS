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
    public class CurrentPasswordValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            //throw new NotImplementedException();
            string currentPass = value as string;

            if (value != null && currentPass != string.Empty)
            {
                int id = int.Parse(App.Current.Properties["idND_Sale"].ToString());
                QLNSEntities qlns = new QLNSEntities();
                var query = from nd in qlns.NGUOIDUNGs
                            where nd.idND == id
                            select nd;
                var lst = query.ToList();
                if (!(currentPass.Equals(lst[0].MatKhau)))
                {
                    return new ValidationResult(false, "Mật khẩu không đúng. Vui lòng nhập lại mật khẩu!");
                }
                return new ValidationResult(true, null);
            }
            return new ValidationResult(false, "Vui lòng điền đầy đủ thông tin!");

        }
    }
}
