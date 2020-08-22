using System.Collections.Generic;
using Verdun.Enterprise.Inventory.ViewModels;

namespace Verdun.Enterprise.Inventory.Models
{
    public interface IInventoryService
    {        
        IEnumerable<AssetViewModel> Read();
        //IList<AssetViewModel> GetAssetWithAttribute();
        IList<AssetViewModel> GetBaseAssets();
        IEnumerable<InvAssetType> GetAssetTypesWithDefault();
        //AssetViewModel GetAssetWithAttributeById(int assetId);
        AssetViewModel GetAssetForEdit(int assetId);
        IEnumerable<AssetTypeAttributeViewModel> GetAssetAttributesByAssetType(int assetTypeId);
        IEnumerable<AssetTypeAttributeViewModel> GetAssetAttributeValuesForEdit(int assetId);

        IEnumerable<InvAttributeControlData> GetAttributeControlDataWithDefault(int attributeId);
        //Dictionary<int, List<InvAttributeControlData>> GetAttributeControlDataWithDefault();
        void Create(AssetViewModel asset);
        void Update(AssetViewModel asset);
        void Destroy(AssetViewModel asset);
    }
}
