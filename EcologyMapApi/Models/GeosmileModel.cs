using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class GeosmileModel
    {
        public GeosmileModel(Geosmile geosmile)
        {
            Id = geosmile.Id;
            Image = geosmile.Image;
            Name = geosmile.Name;
            TemperatureMaxValue = (double)geosmile.TemparatureMaxValue;
            TemperatureMinValue = (double)geosmile.TemparatureMinValue;
            Weather = geosmile.Weather;
        }

        public int Id { get; set; }
        public byte[] Image { get; set; }
        public string Name { get; set; }
        public double TemperatureMinValue { get; set; }
        public double TemperatureMaxValue { get; set; }
        public string Weather { get; set; }
    }
}