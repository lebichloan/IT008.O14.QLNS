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
        public string itemSoLuongSP { get; set; }
        public string itemDonGiaSP { get; set; }
        public string itemThanhTienSP {  get; set; }

        public BillProductListBoxItem(int itemIdCTSP, string itemTenSP, string itemSoLuongSP, string itemDonGiaSP, string itemThanhTienSP)
        {
            this.itemIdCTSP = itemIdCTSP;
            this.itemTenSP = itemTenSP;
            this.itemSoLuongSP = itemSoLuongSP;
            this.itemDonGiaSP = itemDonGiaSP;
            this.itemThanhTienSP = itemThanhTienSP;
        }
    }
}
