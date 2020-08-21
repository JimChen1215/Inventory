using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Verdun.Enterprise.Inventory.Models
{
    public partial class VOC_EnterpriseContext : DbContext
    {
        public VOC_EnterpriseContext()
        {
        }

        public VOC_EnterpriseContext(DbContextOptions<VOC_EnterpriseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<InvAttributeControlData> InvAttributeControlData { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Data Source=tcp:voc-dev-sql01.database.windows.net,1433;Initial Catalog=VOC_Enterprise;User Id=devsqladmin@voc-dev-sql01;Password=Verbat1916!");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<InvAttributeControlData>(entity =>
            {
                entity.HasKey(e => e.AttributeControlDataId);

                entity.ToTable("invAttributeControlData");

                entity.Property(e => e.AttributeControlDataId).HasColumnName("AttributeControlDataID");

                entity.Property(e => e.AttributeId).HasColumnName("AttributeID");

                entity.Property(e => e.ControlDataValue)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
