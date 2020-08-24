using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Verdun.Enterprise.Inventory.Models;
using Verdun.Enterprise.Inventory.ViewModels;

namespace Verdun.Enterprise.Inventory.Data
{
    public class AssetService : IAssetService
    {
        private readonly ILogger<AssetService> _logger;
        private readonly AppDbContext _context;
        private readonly string _webUser;
        private readonly ISession _session;

        public AssetService(AppDbContext context, ILogger<AssetService> logger, IHttpContextAccessor httpContextAccessor)
        {
            _logger = logger;
            _session = httpContextAccessor.HttpContext.Session;
            _webUser = httpContextAccessor.HttpContext.User.Identity.Name ?? "Guest";
            _context = context;
        }

        public ISession Session { get { return _session; } }

        public IEnumerable<InvAssetType> GetAssetTypesWithDefault()
        {
            IList<InvAssetType> assetTypes = (IList<InvAssetType>) _context.InvAssetType.ToList();
            
            var defaultAssetType = new InvAssetType
                                    {
                                        AssetTypeId = 0,
                                        AssetTypeName = ""
                                    };    
            assetTypes.Insert(0, defaultAssetType);
            return assetTypes;             
        }

        public IEnumerable<InvAttributeControlData> GetAttributeControlDataWithDefault(int attributeId)
        {
            IList<InvAttributeControlData> ctrlList = _context.InvAttributeControlData.Where(d=>d.AttributeId==attributeId).ToList();

            var defaultControl = new InvAttributeControlData
            {
                AttributeControlDataId = 0,
                AttributeId = 0,
                ControlDataValue = ""
            };
            ctrlList.Insert(0, defaultControl);
            return ctrlList;
        }

        //public Dictionary<int, List<InvAttributeControlData>> GetAttributeControlDataWithDefault()
        //{
        //    Dictionary<int, List<InvAttributeControlData>> myDict = new Dictionary<int, List<InvAttributeControlData>>();
        //    List<InvAttribute> attrList = _context.InvAttribute.Where(a => a.DataType == "ControlData").ToList();
            
        //    foreach (var attr in attrList)
        //    {
        //        List<InvAttributeControlData> ctrlList = _context.InvAttributeControlData.Where(d => d.AttributeId == attr.AttributeId).ToList();
        //        //Add a default
        //        InvAttributeControlData defaultCtrl = new InvAttributeControlData()
        //        {
        //            AttributeControlDataId = 0,
        //            AttributeId = 0,
        //            ControlDataValue = ""
        //        };
        //        ctrlList.Insert(0, defaultCtrl);
        //        myDict.Add(attr.AttributeId, ctrlList);
        //    }
        //    return myDict;
        //}

        //Get attributes and possible control values at one time
        public IEnumerable<AssetTypeAttributeViewModel> GetAssetAttributesByAssetType(int assetTypeId)
        {
            IList<AssetTypeAttributeViewModel> result = new List<AssetTypeAttributeViewModel>();
            IList<InvAttributeControlData> ctrlList = null;
            // 1. Get attribute list
            using (_context) { 
                var param = new SqlParameter("@assetTypeId", assetTypeId);
                var resultVM = _context.vmAssetTypeAttributeNew.FromSqlRaw<AssetTypeAttributeVM>
                    ($"dbo.upInvGetAttributesByAssetTypeId @assetTypeId", param).AsNoTracking().ToList();
                if (resultVM != null)
                {
                    result = resultVM.Select(t => new AssetTypeAttributeViewModel
                    {
                        AssetTypeAttributeId = t.AssetTypeAttributeId,
                        AssetTypeId = t.AssetTypeId,
                        AssetTypeName = t.AssetTypeName,
                        InvAttributeId = t.InvAttributeId,
                        InvAttributeName = t.InvAttributeName,
                        AttributeDataType = t.AttributeDataType,
                        UnitOfMeasurement = t.UnitOfMeasurement,
                    }).ToList();
                }
                ctrlList = (IList<InvAttributeControlData>) _context.InvAttributeControlData.ToList();
            }
            // 2. Get possible control data list
            FillControlDataList4EachAttribute(result, ctrlList);
            return result;
        }

        public IEnumerable<AssetViewModel> Read()
        {
            return (IEnumerable<AssetViewModel>) GetBaseAssets();
        }

        //Convert DataModel to ViewModel
        //public IList<AssetViewModel> GetBaseAssetViewModel()
        //{
        //    //When use session, not easy to sync when there is any change in Application, Role or User.
        //    //var result = Session.GetObjectFromJson<IList<AssetViewModel>>("UserViewModelList");
        //    //if (result == null)
        //    //{
        //    var result = _context.InvAsset.ToList().Select(asset =>
        //       {
        //           return new AssetViewModel
        //           {
        //               AssetId = asset.AssetId,
        //               AssetName = asset.AssetName,
        //               AssetTypeId = asset.AssetTypeId,
        //               AssetDescription = asset.AssetDescription,
        //               Brand = asset.Brand,
        //               //ModelName = asset.ModelName,
        //               //ModelNumber = asset.ModelNumber
        //           };
        //       }).ToList();

        //    //    Session.SetObjectAsJson("UserViewModelList", result);
        //    //}
        //    return result;
        //}

        public IList<AssetViewModel> GetBaseAssets()
        {
            //Revert to ADO.NET API: 08/20/2020
            //using (var context = new SampleContext())
            //using (var command = context.Database.GetDbConnection().CreateCommand())
            //{
            //    command.CommandText = "SELECT * From Table1";
            //    context.Database.OpenConnection();
            //    using (var result = command.ExecuteReader())
            //    {
            //        // do something with result
            //    }
            //}
            return _context.vmAsset.FromSqlRaw<AssetViewModel>($"dbo.upInvGetBaseAssets").ToList();
        }

        public IEnumerable<AssetTypeAttributeViewModel> GetAssetAttributeValuesForEdit(int assetId)
        {
            IEnumerable<AssetTypeAttributeViewModel> result = null;                        
            IList<InvAttributeControlData> ctrlList = null;
            // 1. Get attribute list
            using (_context)
            {
                var param = new SqlParameter("@assetId", assetId);
                result = _context.vmAssetTypeAttribute.FromSqlRaw<AssetTypeAttributeViewModel>
                    ($"dbo.upInvGetAssetAttributesForEditByAssetId @assetId", param).ToList();                
                ctrlList = (IList<InvAttributeControlData>) _context.InvAttributeControlData.ToList();
            }
            // 2. Get possible control data list
            FillControlDataList4EachAttribute(result, ctrlList);
            return result;
        }

        private void FillControlDataList4EachAttribute(IEnumerable<AssetTypeAttributeViewModel> result, IList<InvAttributeControlData> ctrlList)
        {
            if (result == null || ctrlList == null)
                return;

            foreach (var item in result)
            {
                if (item.AttributeDataType == "ControlData")
                {
                    item.ControlDataList = ctrlList.Where(d => d.AttributeId == item.InvAttributeId).ToList();
                    InvAttributeControlData defaultCtrl = new InvAttributeControlData()
                    {
                        AttributeControlDataId = 0,
                        AttributeId = 0,
                        ControlDataValue = ""
                    };
                    item.ControlDataList.Insert(0, defaultCtrl);
                }
            }
        }

        public AssetViewModel GetAssetForEdit(int assetId)
        {
            //.ToList is a must in this statement on 08/12/2020
            var asset = GetBaseAssets().FirstOrDefault(a => a.AssetId == assetId);
            if (asset == null)
                return asset;

            return asset;
        }

        //------------- CRUD functions ----------------------------
    public void Create(AssetViewModel asset)
        {
            try
            {
                //An asset can't have identical Asset Name                   
                var first = _context.InvAsset.FirstOrDefault(a => a.AssetName == asset.AssetName);
                if (first != null)
                {
                    throw new Exception("This Asset Name already exists in database:" + asset.AssetName);
                }

                using (_context)
                {
                    // 1. Save asset
                    var entity = new InvAsset();                    
                    entity.AssetName = asset.AssetName;
                    entity.AssetTypeId = asset.AssetTypeId;
                    entity.AssetDescription = asset.AssetDescription;
                    entity.Brand = asset.Brand;
                    entity.QuantityOnHand = asset.QuantityOnHand;
                    entity.Notes = asset.Notes;
                    //entity.IsDeleted = false;
                    entity.CreatedBy = _webUser;
                    entity.CreatedDate = DateTime.Now;
                    entity.ModifiedBy = _webUser;
                    entity.ModifiedDate = DateTime.Now;
                    _context.InvAsset.Add(entity);
                    _context.SaveChanges();

                    asset.AssetId = entity.AssetId;

                    // 2. Save asset attribute. Assume assetTypeId exists in AssetTypeAttribute
                    if (asset.AssetTypeAttributeList == null || asset.AssetTypeAttributeList.Count == 0)
                    {
                        throw new Exception("This Asset is saved but no attributes are found, " + asset.AssetName);
                    }

                    foreach(var attr in asset.AssetTypeAttributeList)
                    {
                        var attrEntity = new InvAssetAttributeValue();
                        attrEntity.AssetAttributeValue = attr.InvAttributeValue;
                        attrEntity.AssetId = asset.AssetId;
                        attrEntity.AssetTypeAttributeId = attr.AssetTypeAttributeId;
                        attrEntity.CreatedBy = _webUser;
                        attrEntity.CreatedDate = DateTime.Now;
                        _context.InvAssetAttributeValue.Add(attrEntity);                                           
                    }     
                    _context.SaveChanges();                
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "::Create::");
                throw ex;
            }
        }

        public void Update(AssetViewModel asset)
        {
            try
            {                
                using (_context)
                {                
                    var target = _context.InvAsset.FirstOrDefault(a => a.AssetId == asset.AssetId);
                    if (target == null)
                    {
                        return;
                    }

                    //1. Update values in base table
                    target.AssetName = asset.AssetName;
                    target.AssetTypeId = asset.AssetTypeId;
                    target.AssetDescription = asset.AssetDescription;
                    target.Brand = asset.Brand;
                    target.QuantityOnHand = asset.QuantityOnHand;
                    target.Notes = asset.Notes;
                    target.ModifiedBy = _webUser;
                    target.ModifiedDate = DateTime.Now;                  

                    //2. Update the attributes in attributeValue table   
                    foreach (var attr in asset.AssetTypeAttributeList)
                    {
                        var attrEntity = _context.InvAssetAttributeValue.FirstOrDefault(a => a.AssetId == asset.AssetId 
                                && a.AssetTypeAttributeId == attr.AssetTypeAttributeId);
                        if (attrEntity != null)
                        {
                            attrEntity.AssetAttributeValue = attr.InvAttributeValue;
                            attrEntity.ModifiedBy = _webUser;
                            attrEntity.ModifiedDate = DateTime.Now;
                        }
                    }
                    _context.SaveChanges();                   
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "::Update::");
                throw ex;
            }
        }

        public void Destroy(AssetViewModel asset)
        {
            try
            {
                using (_context)
                {
                    ////1. Remove all attributes belong to this Asset in attributeValue table first
                    //var attrList = _context.InvAssetAttributeValue.Where(a => a.AssetId == asset.AssetId).ToList();
                    //if (attrList != null && attrList.Count > 0)
                    //{
                    //    foreach (var attr in attrList)
                    //    {                            
                    //        _context.InvAssetAttributeValue.Remove(attr);                            
                    //    }
                    //}

                    //2. Update values in base table. Only mark IsDeleted due to soft deletion. 08/21/2020
                    var target = _context.InvAsset.FirstOrDefault(a => a.AssetId == asset.AssetId);
                    if (target != null)
                    {
                        //_context.InvAsset.Remove(target);
                        target.IsDeleted = true;
                    }

                    _context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "::Destroy::");
                throw ex;
            }
        }
        //----end of class
    }
}
