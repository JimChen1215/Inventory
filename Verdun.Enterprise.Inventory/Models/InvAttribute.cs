using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvAttribute
    {
        public InvAttribute()
        {
            InvAssetTypeAttribute = new HashSet<InvAssetTypeAttribute>();
            InvAttributeControlData = new HashSet<InvAttributeControlData>();
        }
        [Key]
        public int AttributeId { get; set; }
        public string AttributeName { get; set; }
        public string DataType { get; set; }
        public int? UoMid { get; set; }
        public bool? IsRange { get; set; }
        public string AssetAttributeValueMin { get; set; }
        public string AssetAttributeValueMax { get; set; }

        public virtual InvUnitOfMeasure UoM { get; set; }
        public virtual ICollection<InvAssetTypeAttribute> InvAssetTypeAttribute { get; set; }
        public virtual ICollection<InvAttributeControlData> InvAttributeControlData { get; set; }
    }
}
