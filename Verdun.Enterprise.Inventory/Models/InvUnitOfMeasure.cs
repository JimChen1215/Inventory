using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvUnitOfMeasure
    {
        public InvUnitOfMeasure()
        {
            InvAttribute = new HashSet<InvAttribute>();
        }
        [Key]
        public int UoMid { get; set; }
        public string UoMname { get; set; }

        public virtual ICollection<InvAttribute> InvAttribute { get; set; }
    }
}
