using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNS.ViewModel
{
    public class ErrorItemListBox
    {
        

        public string itemMaSPL { get; set; }

        public string itemTenSPL { get; set; }
        public int itemIDCTSP { get; set; }
        public short itemSoLuongSPL { get; set; }
        public DateTime NgayLoi { get; set; }
        public string ChiTietLoi { get; set; }

        public int idND {  get; set; }


        public ErrorItemListBox(string itemMaSPL, string itemTenSPL, int IDCTSP, short itemSoLuongSPL,string ChiTietLoi, DateTime NgayLoi , int idND)
        {
            this.itemMaSPL = itemMaSPL;
            this.itemTenSPL = itemTenSPL;
            this.itemIDCTSP = IDCTSP;
            this.itemSoLuongSPL = itemSoLuongSPL;
            this.NgayLoi = NgayLoi;
            this.ChiTietLoi = ChiTietLoi;
            this.idND = idND;
        }

        public ErrorItemListBox(ErrorItemListBox item)
        {
            this.itemMaSPL = item.itemMaSPL;
            this.itemTenSPL = item.itemTenSPL;
            this.itemIDCTSP = item.itemIDCTSP;
            this.itemSoLuongSPL = item.itemSoLuongSPL;
            this.NgayLoi = item.NgayLoi;
            this.ChiTietLoi= item.ChiTietLoi;
            this.idND  = item.idND;
        }
    }
}
