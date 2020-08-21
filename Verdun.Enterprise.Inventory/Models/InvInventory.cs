using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvInventory
    {
        [Key]
        public int InventoryId { get; set; }
        public int? InventoryTypeId { get; set; }
        public int? AssetId { get; set; }
        public DateTime? TransferDateTime { get; set; }
        public string TransferFrom { get; set; }
        public string TransferTo { get; set; }
        public decimal? TransferQuantity { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string ModifiedBy { get; set; }

        public virtual InvAsset Asset { get; set; }
        public virtual InvInventoryType InventoryType { get; set; }
    }
}
