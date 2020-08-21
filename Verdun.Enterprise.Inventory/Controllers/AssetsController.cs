using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Verdun.Enterprise.Inventory.Models;
using Verdun.Enterprise.Inventory.ViewModels;

namespace Verdun.Enterprise.Inventory.Controllers
{
    public class AssetController : Controller
    {        
        private readonly IAssetService _invService;
        private readonly ISession _session;

        public AssetController(IAssetService assetService, IHttpContextAccessor httpContextAccessor)
        {            
            _invService = assetService;
            _session = httpContextAccessor.HttpContext.Session; 
        }

        public IActionResult Index()
        {
            //var appDbContext = _context.InvAsset.Include(i => i.AssetType);
            //return View(await appDbContext.ToListAsync());

            //To show assetTypeID as dropdown list in grid
            //PopulateAssetTypes4KendoUI();
            return View(_invService.GetBaseAssets());
        }

        private void PopulateAssetTypes4KendoUI()
        {
            var apps = _invService.GetAssetTypesWithDefault();
            ViewData["assetTypes"] = apps;
            ViewData["defaultAssetType"] = apps.First();
        }

        public IActionResult Details(int? assetId)
        {
            if (assetId == null)
            {
                return NotFound();
            }

            AssetViewModel vmAsset = _invService.GetAssetForEdit((int)assetId);                   
            if (vmAsset == null)
            {
                return NotFound();
            } 
            vmAsset.AssetTypeAttributeList = _invService.GetAssetAttributeValuesForEdit((int)assetId).ToList();    
            MakeAssetTypeSelectList((int)vmAsset.AssetTypeId);
            return View(vmAsset);
        }

        private void MakeAssetTypeSelectList(int selectedType)
        {
            var assetTypes = _invService.GetAssetTypesWithDefault();
            if (selectedType > 0)
                ViewData["AssetTypeId"] = new SelectList(assetTypes, "AssetTypeId", "AssetTypeName", selectedType);            
            else
                ViewData["AssetTypeId"] = new SelectList(assetTypes, "AssetTypeId", "AssetTypeName");
        }
        [HttpGet]
        public IActionResult Create()
        {            
            MakeAssetTypeSelectList(0);                     
            return View();
        }

        public PartialViewResult GetAssetTypeAttributes(int assetTypeId)
        {
            //1. Get attribute list & possible control data list
            List<AssetTypeAttributeViewModel> result = _invService.GetAssetAttributesByAssetType(assetTypeId).ToList();             
            _session.SetObjectAsJson("UserViewModelList", result);
            //2. Get control data lists: 
            //Dictionary<int, List<InvAttributeControlData>> myDict = _invService.GetAttributeControlDataWithDefault();
            //ViewData["ControlDataLists"] = myDict;
            return PartialView("_AssetTypeAttributes", result);
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]        
        public IActionResult Create(AssetViewModel vmAsset, IFormCollection formData)
        {                        
            if (ModelState.IsValid)
            {
                List<AssetTypeAttributeViewModel> attrList = _session.GetObjectFromJson<List<AssetTypeAttributeViewModel>>("attrList4new");
                
                if (attrList == null)
                {
                    attrList = _invService.GetAssetAttributesByAssetType((int)vmAsset.AssetTypeId).ToList();
                }

                foreach (var attr in attrList)
                {
                    attr.InvAttributeValue = formData[""+attr.InvAttributeId];
                }
                //AssetTypeName is set up after AssetTypeId is selected in partial view.
                vmAsset.AssetTypeName = formData["AssetTypeName"];

                vmAsset.AssetTypeAttributeList = attrList;
                _invService.Create(vmAsset);
                //return RedirectToAction(nameof(Index));
                return View("Details", vmAsset);
            }
            MakeAssetTypeSelectList((int)vmAsset.AssetTypeId);            
            return View(vmAsset);
        }

        
        public IActionResult Edit(int? assetId)
        {
            if (assetId == null)
            {
                return NotFound();
            }

            AssetViewModel vmAsset = _invService.GetAssetForEdit((int)assetId);            
            if (vmAsset == null)
            {
                return NotFound();
            }
            vmAsset.AssetTypeAttributeList = _invService.GetAssetAttributeValuesForEdit((int)assetId).ToList();
            _session.SetObjectAsJson("attrList4Edit", vmAsset.AssetTypeAttributeList);
            MakeAssetTypeSelectList((int)vmAsset.AssetTypeId);            
            return View(vmAsset);
        }

        
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int assetId, AssetViewModel vmAsset, IFormCollection formData)
        {
            if (assetId != vmAsset.AssetId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    // 1. Get the attribute list
                    List<AssetTypeAttributeViewModel> attrList = _session.GetObjectFromJson<List<AssetTypeAttributeViewModel>>("attrList4Edit"); ;
                    if (attrList == null)
                    {
                        attrList = _invService.GetAssetAttributeValuesForEdit((int)vmAsset.AssetTypeId).ToList();
                    }

                    // 2. Update attribute values from FormData
                    foreach (var attr in attrList)
                    {
                        attr.InvAttributeValue = formData["" + attr.InvAttributeId];
                    }
                    vmAsset.AssetTypeAttributeList = attrList;
                    _invService.Update(vmAsset);                    
                }
                catch (DbUpdateConcurrencyException)
                {
                    //if (!InvAssetExists(vmAsset.AssetId))
                    //{
                    //    return NotFound();
                    //}                    
                    throw;                    
                }
                //return RedirectToAction(nameof(Index));

                return View("Details", vmAsset);
            }
            MakeAssetTypeSelectList((int)vmAsset.AssetTypeId);
            return View(vmAsset);
        }

        [AcceptVerbs("Post")]
        public ActionResult EditingInline_Destroy([DataSourceRequest] DataSourceRequest request, AssetViewModel vmAsset)
        {
            try
            {
                if (vmAsset != null && ModelState.IsValid)
                {
                    _invService.Destroy(vmAsset);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Delete Application:" + vmAsset ?? (vmAsset.AssetName)
                                , "Make sure no user is linked to the application.\n" + ex.Message);
            }
            return Json(new[] { vmAsset }.ToDataSourceResult(request, ModelState));
        }
    }
}
