using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class PointModel
    {
        public PointModel(Point point)
        {
            Id = point.Id;
            Latitude = point.Latitude;
            Longitude = point.Longitude;
            Temperature = point.Temperature;
            Region = new RegionModel()
            {
                Id = point.Region.Id,
                Name = point.Region.Name
            };
            User = new UserModel()
            {
                Id = point.User.Id,
                FirstName = point.User.FirstName,
                MiddleName = point.User.MiddleName,
                LastName = point.User.LastName
            };
            SoilState = new SoilStateModel()
            {
                Id = point.SoilState.Id,
                Category = new CategoryModel()
                {
                    Id = point.SoilState.Category.Id,
                    Name = point.SoilState.Category.Name
                },                
                IndexBGKP = point.SoilState.IndexBGKP,
                PHValue = point.SoilState.PHValue
            };
            WaterState = new WaterStateModel()
            {
                Id = point.WaterState.Id,
                Description = point.WaterState.Description,
                TDSValue = point.WaterState.TDSValue
            };
            AirState = new AirStateModel()
            {
                Id = point.AirState.Id,
                CO2Value = point.AirState.CO2Value,
                Dust = point.AirState.Dust,
                NO2Value = point.AirState.NO2Value
            };
            Geosmile = new GeosmileModel(point.Geosmile);           
        }

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