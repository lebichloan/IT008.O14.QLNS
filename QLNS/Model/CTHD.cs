//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLNS.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class CTHD
    {
        public int idCTHD { get; set; }
        public Nullable<int> idHD { get; set; }
        public Nullable<int> idCTSP { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }
    
        public virtual CTSP CTSP { get; set; }
        public virtual HOADON HOADON { get; set; }
    }
}
