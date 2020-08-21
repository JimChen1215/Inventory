using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvInventoryType
    {
        public InvInventoryType()
        {
            InvInventory = new HashSet<InvInventory>();
        }
        [Key]
        public int InventoryTypeId { get; set; }
        public string InventoryTypeName { get; set; }

        public virtual ICollection<InvInventory> InvInventory { get; set; }
    }
}
