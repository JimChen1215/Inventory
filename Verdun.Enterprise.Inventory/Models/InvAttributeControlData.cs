using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvAttributeControlData
    {
        [Key]
        public int AttributeControlDataId { get; set; }
        public int AttributeId { get; set; }
        public string ControlDataValue { get; set; }

        public virtual InvAttribute Attribute { get; set; }
    }
}
