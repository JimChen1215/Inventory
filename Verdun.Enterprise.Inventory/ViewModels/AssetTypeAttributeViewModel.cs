using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Verdun.Enterprise.Inventory.Models;

namespace Verdun.Enterprise.Inventory.ViewModels
{
    [NotMapped]
    public class AssetTypeAttributeViewModel
    {
        //[Key]
        public int AssetTypeAttributeId { get; set; }
        public int? AssetTypeId { get; set; }
        public int? InvAttributeId { get; set; }
        public string AssetTypeName { get; set; }
        public string InvAttributeName { get; set; }
        public string InvAttributeValue { get; set; }
        public string AttributeDataType { get; set; }
        public string UnitOfMeasurement { get; set; }

        public List<InvAttributeControlData> ControlDataList { get; set; }
    }
}
