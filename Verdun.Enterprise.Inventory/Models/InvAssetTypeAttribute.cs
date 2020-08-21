using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvAssetTypeAttribute
    {
        public InvAssetTypeAttribute()
        {
            InvAssetAttributeValue = new HashSet<InvAssetAttributeValue>();
        }
        [Key]
        public int AssetTypeAttributeId { get; set; }
        public int? AssetTypeId { get; set; }
        public int? AttributeId { get; set; }
        //public string AssetAttributeValueMin { get; set; }
        //public string AssetAttributeValueMax { get; set; }

        public virtual InvAssetType AssetType { get; set; }
        public virtual InvAttribute Attribute { get; set; }
        public virtual ICollection<InvAssetAttributeValue> InvAssetAttributeValue { get; set; }
               
    }
}
