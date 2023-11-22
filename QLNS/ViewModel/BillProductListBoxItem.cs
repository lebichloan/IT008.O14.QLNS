using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNS.ViewModel
{
    public class BillProductListBoxItem
    {
        public int itemIdCTSP { get; set; }
        public string itemTenSP { get; set; }
        public int itemSoLuongSP { get; set; }
        public decimal itemDonGiaSP { get; set; }
        public decimal itemThanhTienSP {  get; set; }

        public BillProductListBoxItem(int itemIdCTSP, string itemTenSP, int itemSoLuongSP, decimal itemDonGiaSP, decimal itemThanhTienSP)
        {
            this.itemIdCTSP = itemIdCTSP;
            this.itemTenSP = itemTenSP;
            this.itemSoLuongSP = itemSoLuongSP;
            this.itemDonGiaSP = itemDonGiaSP;
            this.itemThanhTienSP = itemThanhTienSP;
        }
    }
}
