using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class GeosmileModel
    {

        public int? Id { get; set; }
        public byte[] Image { get; set; }
        public string Name { get; set; }
        public double? TemperatureMinValue { get; set; }
        public double? TemperatureMaxValue { get; set; }
        public string Weather { get; set; }

        public static List<GeosmileModel> Geosmile(List<Geosmile> geosmile)
        {
            var res = geosmile.ToList().ConvertAll(x => new GeosmileModel());
            return res;
        }

        public static GeosmileModel OneGeosmile(Geosmile geosmile)
        {
            return new GeosmileModel() 
            {
                Id = geosmile.Id,
                Name = geosmile.Name,
                Image = geosmile.Image,
                TemperatureMaxValue = geosmile.TemparatureMaxValue,
                TemperatureMinValue = geosmile.TemparatureMinValue,
                Weather = geosmile.Weather
            };
        }
    }
}