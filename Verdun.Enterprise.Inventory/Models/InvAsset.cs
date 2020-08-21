using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvAsset
    {
        public InvAsset()
        {
            InvAssetAttributeValue = new HashSet<InvAssetAttributeValue>();
            InvInventory = new HashSet<InvInventory>();
        }
        [Key]
        public int AssetId { get; set; }
        public string AssetName { get; set; }
        public string Brand { get; set; }
        public string VendorCode { get; set; }
        public string ModelName { get; set; }
        public string ModelNumber { get; set; }
        public string SerialNumber { get; set; }
        public string AssetDescription { get; set; }
        public int? AssetTypeId { get; set; }
        public decimal? PerUnitCost { get; set; }
        public decimal? QuantityOnHand { get; set; }
        public decimal? ReorderLevel { get; set; }
        public int? ReorderTimeInDays { get; set; }
        public decimal? ReorderQuantity { get; set; }
        public bool? Discountinued { get; set; }
        public string Notes { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }

        [UIHint("AssetTypeDropDown")]
        public virtual InvAssetType AssetType { get; set; }
        public virtual ICollection<InvAssetAttributeValue> InvAssetAttributeValue { get; set; }
        public virtual ICollection<InvInventory> InvInventory { get; set; }
    }
}
