//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyKhoHangCBNV.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class ImportInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ImportInfo()
        {
            this.ExportInfoes = new HashSet<ExportInfo>();
        }
    
        public string Id { get; set; }
        public string IdSupply { get; set; }
        public string IdImport { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<double> ImportPrice { get; set; }
        public Nullable<double> ExportPrice { get; set; }
        public string Status { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExportInfo> ExportInfoes { get; set; }
        public virtual Import Import { get; set; }
        public virtual Supply Supply { get; set; }
    }
}
