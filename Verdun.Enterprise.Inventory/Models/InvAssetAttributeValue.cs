using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvAssetAttributeValue
    {
        [Key]
        public int AssetAttributeValueId { get; set; }
        public int? AssetId { get; set; }
        public int? AssetTypeAttributeId { get; set; }
        public string AssetAttributeValue { get; set; }
        //public string AssetAttributeValueMin { get; set; }
        //public string AssetAttributeValueMax { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }

        public virtual InvAsset Asset { get; set; }
        public virtual InvAssetTypeAttribute AssetTypeAttribute { get; set; }
    }
}
