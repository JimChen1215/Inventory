using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Verdun.Enterprise.Inventory.ViewModels
{
    [NotMapped]
    public class AssetTypeAttributeVM
    {
        //[Key]
        public int AssetTypeAttributeId { get; set; }
        public int? AssetTypeId { get; set; }
        public int? InvAttributeId { get; set; }
        public string AssetTypeName { get; set; }
        public string InvAttributeName { get; set; }        
        public string AttributeDataType { get; set; }
        public string UnitOfMeasurement { get; set; }       
    }
}
