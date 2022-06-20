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
    using QuanLyKhoHangCBNV.ViewModel;
    using System;
    using System.Collections.Generic;
    
    public partial class Supply : BaseViewModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Supply()
        {
            this.ExportInfoes = new HashSet<ExportInfo>();
            this.ImportInfoes = new HashSet<ImportInfo>();
        }

        //Id
        private string _Id;
        public string Id { get { return _Id; } set { _Id = value; OnPropertyChanged(); } }
        //DisplayName
        private string _DisplayName;
        public string DisplayName { get { return _DisplayName; } set { _DisplayName = value; OnPropertyChanged(); } }
        //Measure
        private int _IdMeasure;
        public int IdMeasure { get => _IdMeasure; set { _IdMeasure = value; OnPropertyChanged(); } }
        //IdSupplier
        private int _IdSupplier;
        public int IdSupplier { get { return _IdSupplier; } set { _IdSupplier = value; OnPropertyChanged(); } }
        //QRCode
        private string _QRCode;
        public string QRCode { get { return _QRCode; } set { _QRCode = value; OnPropertyChanged(); } }
        //BarCode
        private string _BarCode;
        public string BarCode { get => _BarCode; set { _BarCode = value; OnPropertyChanged(); } }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExportInfo> ExportInfoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ImportInfo> ImportInfoes { get; set; }
        private  Measure _Measure;
        public virtual Measure Measure { get => _Measure; set { _Measure = value; OnPropertyChanged(); } }
        private Supplier _Supplier;
        public virtual Supplier Supplier { get => _Supplier; set { _Supplier = value; OnPropertyChanged(); } }
    }
}