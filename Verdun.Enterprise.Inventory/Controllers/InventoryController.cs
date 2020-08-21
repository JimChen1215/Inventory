using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Verdun.Enterprise.Inventory.Models;

namespace Verdun.Enterprise.Inventory.Controllers
{
    public class InventoryController : Controller
    {
        private readonly AppDbContext _context;

        public InventoryController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            //return View(Json(await _context.InvAssetType.ToListAsync()));
            return View(await _context.InvAssetType.ToListAsync());
        }

        //[HttpGet]
        public async Task<IActionResult> SearchAsset(int assetTypeId)
        {
            

            //OK in EF CORE but fails on client side in json conversion                  
            var assets = await _context.InvAsset.Where(a=>a.AssetTypeId == assetTypeId).ToListAsync();
            return View("SearchAssetList", assets);
            
        }

        // GET: Inventory
        public async Task<IActionResult> MaterialList()
        {
            //return View(Json(await _context.InvAssetType.ToListAsync()));
            return View(await _context.InvAssetType.ToListAsync());
        }
    
        public async Task<IActionResult> Read()
        {
            return View(await _context.InvAssetType.ToListAsync());
            //return View(Json(await _context.InvAssetType.ToListAsync()));
        }

        public async Task<IActionResult> AssetList()
        {
            return View(await _context.InvAsset.ToListAsync());
        }

        // GET: Inventory/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var InvAssetType = await _context.InvAssetType
                .FirstOrDefaultAsync(m => m.AssetTypeId == id);
            if (InvAssetType == null)
            {
                return NotFound();
            }

            return View(InvAssetType);
        }

        // GET: Inventory/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Inventory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AssetTypeId,AssetTypeName")] InvAssetType InvAssetType)
        {
            if (ModelState.IsValid)
            {
                _context.Add(InvAssetType);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(InvAssetType);
        }

        // GET: Inventory/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var InvAssetType = await _context.InvAssetType.FindAsync(id);
            if (InvAssetType == null)
            {
                return NotFound();
            }
            return View(InvAssetType);
        }

        // POST: Inventory/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AssetTypeId,AssetTypeName")] InvAssetType InvAssetType)
        {
            if (id != InvAssetType.AssetTypeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(InvAssetType);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InvAssetTypeExists(InvAssetType.AssetTypeId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(InvAssetType);
        }

        // GET: Inventory/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var InvAssetType = await _context.InvAssetType
                .FirstOrDefaultAsync(m => m.AssetTypeId == id);
            if (InvAssetType == null)
            {
                return NotFound();
            }

            return View(InvAssetType);
        }

        // POST: Inventory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var InvAssetType = await _context.InvAssetType.FindAsync(id);
            _context.InvAssetType.Remove(InvAssetType);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool InvAssetTypeExists(int id)
        {
            return _context.InvAssetType.Any(e => e.AssetTypeId == id);
        }
    }
}
