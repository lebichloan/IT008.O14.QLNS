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
    
    public partial class NGUOIDUNG
    {
        public int idND { get; set; }
        public string MaND { get; set; }
        public string TenDN { get; set; }
        public string MatKhau { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public bool TinhTrang { get; set; }
        public int idNV { get; set; }
        public int idLND { get; set; }
    
        public virtual LOAINGUOIDUNG LOAINGUOIDUNG { get; set; }
        public virtual NHANVIEN NHANVIEN { get; set; }
    }
}
