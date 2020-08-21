using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Verdun.Enterprise.Inventory.Models;

namespace Verdun.Enterprise.Inventory.ViewModels
{    
    [NotMapped]
    public class AssetViewModel
    {
        //public AssetViewModel()
        //{
        //    AssetTypeAttributeList = new List<AssetTypeAttributeViewModel>();
        //}

        //[Key]
        public int AssetId { get; set; }
        [Required]        
        public int? AssetTypeId { get; set; }
        [Required]
        [MaxLength(100, ErrorMessage ="Name cannot exceed 100 characters")]
        public string AssetName { get; set; }
        [Required]
        [MaxLength(10, ErrorMessage = "Name cannot exceed 100 characters")]
        public string Brand { get; set; }
        public string AssetDescription { get; set; }
        [Range(0, 1000.00, ErrorMessage ="Number cannot exceeed 1000.00")]
        public decimal? QuantityOnHand { get; set; }
        
        public string ModelName { get; set; }
        public string ModelNumber { get; set; }
        public string SerialNumber { get; set; }
        public decimal? PerUnitCost { get; set; }
        public string VendorCode { get; set; }

        //public decimal? ReorderLevel { get; set; }
        //public int? ReorderTimeInDays { get; set; }
        //public decimal? ReorderQuantity { get; set; }
        //public bool? Discountinued { get; set; }
        //public string Notes { get; set; }
        //public string CreatedBy { get; set; }
        //public DateTime? CreatedDate { get; set; }
        //public string ModifiedBy { get; set; }
        //public DateTime? ModifiedDate { get; set; }

        public string AssetTypeName { get; set; }

        [UIHint("AssetTypeDropDown")]
        public InvAssetType AssetType { get; set; }

        public List<AssetTypeAttributeViewModel> AssetTypeAttributeList { get; set; }
             
    }
}
