using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNS.ViewModel
{
    public class ImportItemListBox
    {
        public int itemMaSP { get; set; }
        
        public string itemTenSP { get; set; }
        public short itemSoLuongNhapSP { get; set; }
        public decimal itemDonGiaNhapSP { get; set; }
        public decimal itemThanhTienSP { get; set; }

        public ImportItemListBox(int itemMaSP, string itemTenSP, short itemSoLuongNhapSP, decimal itemDonGiaNhapSP, decimal itemThanhTienSP)
        {
            this.itemMaSP = itemMaSP;
            this.itemTenSP = itemTenSP;
            this.itemSoLuongNhapSP = itemSoLuongNhapSP;
            this.itemDonGiaNhapSP = itemDonGiaNhapSP;
            this.itemThanhTienSP = itemThanhTienSP;
        }

        public ImportItemListBox(ImportItemListBox item)
        {
            this.itemMaSP = item.itemMaSP;
            this.itemTenSP = item.itemTenSP;
            this.itemSoLuongNhapSP = item.itemSoLuongNhapSP;
            this.itemDonGiaNhapSP = item.itemDonGiaNhapSP;
            this.itemThanhTienSP = item.itemThanhTienSP;
        }
    }
}
