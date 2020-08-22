using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Verdun.Enterprise.Inventory.Models;

namespace Verdun.Enterprise.Inventory.ViewModels
{    
    [NotMapped]    
    public class InventoryViewModel
    {
        //public AssetViewModel()
        //{
        //    AssetTypeAttributeList = new List<AssetTypeAttributeViewModel>();
        //}

        //[Key]
        public int AssetId { get; set; }
        
        public int? AssetTypeId { get; set; }
     
        public string AssetName { get; set; }
       
        public string Brand { get; set; }
        public string AssetDescription { get; set; }
        
        public decimal? QuantityOnHand { get; set; }
        
        public string ModelName { get; set; }


        public string AssetTypeName { get; set; }

        [UIHint("AssetTypeDropDown")]
        public InvAssetType AssetType { get; set; }

        public List<AssetTypeAttributeViewModel> AssetTypeAttributeList { get; set; }
             
    }
}
