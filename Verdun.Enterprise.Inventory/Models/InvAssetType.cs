using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvAssetType
    {
        public InvAssetType()
        {
            InvAsset = new HashSet<InvAsset>();
            InvAssetTypeAttribute = new HashSet<InvAssetTypeAttribute>();
        }
        [Key]
        public int AssetTypeId { get; set; }
        public string AssetTypeName { get; set; }

        public virtual ICollection<InvAsset> InvAsset { get; set; }
        public virtual ICollection<InvAssetTypeAttribute> InvAssetTypeAttribute { get; set; }
    }
}
