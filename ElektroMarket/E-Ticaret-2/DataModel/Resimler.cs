//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Ticaret_2.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Resimler
    {
        public int ID { get; set; }
        public int UrunID { get; set; }
        public string Urunresimyolu1 { get; set; }
        public string Urunresimyolu2 { get; set; }
        public string Urunresimyolu3 { get; set; }
        public string Urunresimyolu4 { get; set; }
        public bool Silindi { get; set; }
    
        public virtual Urunler Urunler { get; set; }
    }
}