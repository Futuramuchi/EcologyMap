using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class PointModel
    {

        public int Id { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public double? Temperature { get; set; }
        public RegionModel Region { get; set; }
        public UserModel User { get; set; }
        public WaterStateModel WaterState { get; set; }
        public SoilStateModel SoilState { get; set; }
        public AirStateModel AirState { get; set; }
        public GeosmileModel Geosmile { get; set; }
    }
}