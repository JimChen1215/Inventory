using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Verdun.Enterprise.Inventory.ViewModels;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        // View Model
        public virtual DbSet<AssetViewModel> vmAsset { get; set; }       
        public virtual DbSet<AssetTypeAttributeViewModel> vmAssetTypeAttribute { get; set; }
        public virtual DbSet<AssetAttributeValueVM> vmAssetAttributeValue { get; set; }
        public virtual DbSet<AssetTypeAttributeVM> vmAssetTypeAttributeNew { get; set; }

        //Real Tables
        public virtual DbSet<InvAsset> InvAsset { get; set; }        

        public virtual DbSet<InvAssetAttributeValue> InvAssetAttributeValue { get; set; }
        public virtual DbSet<InvAssetType> InvAssetType { get; set; }
        public virtual DbSet<InvAssetTypeAttribute> InvAssetTypeAttribute { get; set; }
        
        
        public virtual DbSet<InvAttribute> InvAttribute { get; set; }
        public virtual DbSet<InvAttributeControlData> InvAttributeControlData { get; set; }

        public virtual DbSet<InvInventory> InvInventory { get; set; }
        public virtual DbSet<InvInventoryType> InvInventoryType { get; set; }
        public virtual DbSet<InvUnitOfMeasure> InvUnitOfMeasure { get; set; }
        public virtual DbSet<InvYard> InvYard { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
    
            //ViewModels only for SPs
            modelBuilder.Entity<AssetAttributeValueVM>().HasNoKey();
            modelBuilder.Entity<AssetTypeAttributeVM>().HasNoKey();
            modelBuilder.Entity<AssetTypeAttributeViewModel>().HasNoKey();
            modelBuilder.Entity<AssetViewModel>().HasNoKey();

            //OnModelCreatingPartial(modelBuilder);
        }

        //partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
