using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNS.ViewModel
{
    public class NhanVien
    {
        public int idNV { get; set; }
        public string MaNV { get; set; }
        public string TenNV { get; set; }
        public System.DateTime NgaySinh { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string SDT { get; set; }
        public System.DateTime NgayVL { get; set; }
        public string ChucVu { get; set; }
        public int TinhTrang { get; set; }
        public string GhiChu { get; set; }
    }
}
