﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EcologyMapApi.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EcologyMapEntities : DbContext
    {
        public EcologyMapEntities()
            : base("name=EcologyMapEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AirState> AirState { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Geosmile> Geosmile { get; set; }
        public virtual DbSet<Point> Point { get; set; }
        public virtual DbSet<Region> Region { get; set; }
        public virtual DbSet<SoilState> SoilState { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<WaterState> WaterState { get; set; }
    }
}