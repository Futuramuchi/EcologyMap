
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace EcologicalMapAPI.Models
{

using System;
    using System.Collections.Generic;
    
public partial class UserGeosmile
{

    public int Id { get; set; }

    public Nullable<int> UserId { get; set; }

    public int GeosmileId { get; set; }

    public double Longitude { get; set; }

    public double Latitude { get; set; }



    public virtual Geosmile Geosmile { get; set; }

    public virtual UserData UserData { get; set; }

}

}
