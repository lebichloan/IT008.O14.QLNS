using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNS.ViewModel
{
    public class BillCustomerListBoxItem
    {
        private int idKH { get; set; }
        private string itemMaKH { get; set; }
        private string itemTenKH { get; set; }
        private int itemDiemTichLuy { get; set; }
        private string itemSDT { get; set; }
        private string itemDiaChi { get; set; }
        private string itemLoaiKH { get; set; }
        private DateTime? itemNgayTG { get; set; }

        public BillCustomerListBoxItem(int idKH, string itemMaKH, string itemTenKH, int itemDiemTichLuy, string itemSDT, string itemDiaChi, string itemLoaiKH, DateTime? itemNgayTG)
        {
            this.idKH = idKH;
            this.itemMaKH = itemMaKH;
            this.itemTenKH = itemTenKH;
            this.itemDiemTichLuy = itemDiemTichLuy;
            this.itemSDT = itemSDT;
            this.itemDiaChi = itemDiaChi;
            this.itemLoaiKH = itemLoaiKH;
            this.itemNgayTG = itemNgayTG;
        }

        public BillCustomerListBoxItem(BillCustomerListBoxItem item)
        {
            this.idKH = item.idKH;
            this.itemMaKH = item.itemMaKH;
            this.itemTenKH = item.itemTenKH;
            this.itemDiemTichLuy = item.itemDiemTichLuy;
            this.itemSDT = item.itemSDT;
            this.itemDiaChi = item.itemDiaChi;
            this.itemLoaiKH = item.itemLoaiKH;
            this.itemNgayTG = item.itemNgayTG;
        }
    }
}
