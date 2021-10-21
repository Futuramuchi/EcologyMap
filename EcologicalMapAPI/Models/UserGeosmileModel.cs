using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologicalMapAPI.Models
{
    public class UserGeosmileModel
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public int GeosmileId { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
    }
}