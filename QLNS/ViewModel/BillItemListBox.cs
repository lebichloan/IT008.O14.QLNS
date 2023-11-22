using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNS.ViewModel
{
    public class BillItemListBox
    {
        public int HDidCTSP { get; set; }
        public string HDTenSP { get; set; }
        public string HDSoLuong { get; set; }
        public string HDDonGia { get; set; }
        public string HDThanhTien { get; set; }

        public BillItemListBox(int idCTSP, string tenSP, string soLuong, string donGia, string thanhTien)
        {
            HDidCTSP = idCTSP;
            HDTenSP = tenSP;
            HDSoLuong = soLuong;
            HDDonGia = donGia;
            HDThanhTien = thanhTien;
        }

    }
}
