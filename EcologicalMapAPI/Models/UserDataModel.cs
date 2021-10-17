using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologicalMapAPI.Models
{
    public class UserDataModel
    {
        public int Id { get; set; }
        public UserModel User { get; set; }
        public GeosmileModel Geosmile { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public AirStateModel AirState { get; set; }
        public DateTime DateTime { get; set; }
        public double? Temperature { get; set; }
    }
}