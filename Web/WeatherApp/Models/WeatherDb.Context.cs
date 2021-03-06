//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sequencing.WeatherApp.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WeatherAppDbEntities : DbContext
    {
        public WeatherAppDbEntities()
            : base("name=WeatherAppDbEntities")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<DeviceInfo> DeviceInfo { get; set; }
        public virtual DbSet<SendInfo> SendInfo { get; set; }
        public virtual DbSet<UserInfo> UserInfo { get; set; }
        public virtual DbSet<Condition> Conditions { get; set; }
        public virtual DbSet<MelanomaRisk> MelanomaRisks { get; set; }
        public virtual DbSet<Recommendation> Recommendations { get; set; }
        public virtual DbSet<VitaminD> VitaminDs { get; set; }
        public virtual DbSet<SendForecast> SendForecasts { get; set; }
        public virtual DbSet<ApplicationName> ApplicationNames { get; set; }
    }
}
