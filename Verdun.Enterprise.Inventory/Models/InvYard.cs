using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class InvYard
    {
        [Key]
        public int YardId { get; set; }
        public string YardName { get; set; }
        public string CostCenterCode { get; set; }
        public string YardLocation { get; set; }
        public double? YardLat { get; set; }
        public double? YardLng { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
