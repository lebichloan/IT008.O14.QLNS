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
    
    public partial class KHUYENMAI
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KHUYENMAI()
        {
            this.HOADONs = new HashSet<HOADON>();
        }
    
        public int idKM { get; set; }
        public string MaKM { get; set; }
        public string TenKM { get; set; }
        public string MoTa { get; set; }
        public Nullable<int> idLKH { get; set; }
        public System.DateTime NgayBD { get; set; }
        public System.DateTime NgayKT { get; set; }
        public short GiamGia { get; set; }
        public int idND { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HOADON> HOADONs { get; set; }
        public virtual LOAIKHACHHANG LOAIKHACHHANG { get; set; }
        public virtual NGUOIDUNG NGUOIDUNG { get; set; }
    }
}
