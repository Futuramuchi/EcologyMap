using EcologyMapApi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace EcologyMapApi.Controllers
{
    public class PointsController : ApiController
    {
        private EcologyMapEntities _ent { get; set; } = new EcologyMapEntities();

        public IHttpActionResult GetAll()
        {
            var points = _ent.Point.Select(x => new PointModel()
            {
                Id = x.Id,
                Latitude = x.Latitude,
                Longitude = x.Longitude,
                AirState = new AirStateModel()
                {
                    Id = x.AirState.Id,
                    CO2Value = x.AirState.CO2Value,
                    Dust = x.AirState.Dust,
                    NO2Value = x.AirState.NO2Value
                },
                Geosmile = new GeosmileModel()
                {
                    Id = x.Geosmile.Id,
                    Image = x.Geosmile.Image,
                    Name = x.Geosmile.Name,
                    TemperatureMaxValue = x.Geosmile.TemparatureMaxValue,
                    TemperatureMinValue = x.Geosmile.TemparatureMinValue,
                    Weather = x.Geosmile.Weather
                },
                SoilState = new SoilStateModel()
                {
                    Id = x.SoilState.Id,
                    Category = new CategoryModel()
                    {
                        Id = x.SoilState.Category.Id,
                        Name = x.SoilState.Category.Name
                    },
                    IndexBGKP = x.SoilState.IndexBGKP,
                    PHValue = x.SoilState.PHValue
                },
                WaterState = new WaterStateModel()
                {
                    Id = x.WaterState.Id,
                    TDSValue = x.WaterState.TDSValue,
                    Description = x.WaterState.Description
                },
                Region = new RegionModel()
                {
                    Id = x.Region.Id,
                    Name = x.Region.Name,
                    Description = x.Region.Description
                },
                Temperature = x.Temperature,
                User = new UserModel()
                {
                    Id = x.User.Id,
                    Email = x.User.Email,
                    FirstName = x.User.FirstName,
                    LastName = x.User.LastName,
                    MiddleName = x.User.MiddleName,
                    Phone = x.User.Phone
                }
            });

            return Ok(points);
        }

        public IHttpActionResult GetAppropriate(double longitude, double latitude)
        {
            var points = _ent.Point.Where(x => x.Longitude == longitude
            && x.Latitude == latitude).Select(x => new PointModel()
            {
                Id = x.Id,
                Latitude = x.Latitude,
                Longitude = x.Longitude,
                AirState = new AirStateModel()
                {
                    Id = x.AirState.Id,
                    CO2Value = x.AirState.CO2Value,
                    Dust = x.AirState.Dust,
                    NO2Value = x.AirState.NO2Value
                },
                Geosmile = new GeosmileModel()
                {
                    Id = x.Geosmile.Id,
                    Image = x.Geosmile.Image,
                    Name = x.Geosmile.Name,
                    TemperatureMaxValue = x.Geosmile.TemparatureMaxValue,
                    TemperatureMinValue = x.Geosmile.TemparatureMinValue,
                    Weather = x.Geosmile.Weather
                },
                SoilState = new SoilStateModel()
                {
                    Id = x.SoilState.Id,
                    Category = new CategoryModel()
                    {
                        Id = x.SoilState.Category.Id,
                        Name = x.SoilState.Category.Name
                    },
                    IndexBGKP = x.SoilState.IndexBGKP,
                    PHValue = x.SoilState.PHValue
                },
                WaterState = new WaterStateModel()
                {
                    Id = x.WaterState.Id,
                    TDSValue = x.WaterState.TDSValue,
                    Description = x.WaterState.Description
                },
                Region = new RegionModel()
                {
                    Id = x.Region.Id,
                    Name = x.Region.Name,
                    Description = x.Region.Description
                },
                Temperature = x.Temperature,
                User = new UserModel()
                {
                    Id = x.User.Id,
                    Email = x.User.Email,
                    FirstName = x.User.FirstName,
                    LastName = x.User.LastName,
                    MiddleName = x.User.MiddleName,
                    Phone = x.User.Phone
                }
            });

            return Ok(points);
        }

        public async Task<HttpResponseMessage> Post([FromBody] PointModel pointModel)
        {
            var point = new Point()
            {
                Temperature = pointModel.Temperature,
                SoilStateId = pointModel.SoilState.Id,
                WaterStateId = pointModel.WaterState.Id,
                AirStateId = pointModel.AirState.Id,
                GeosmileId = pointModel.Geosmile.Id,
                Latitude = pointModel.Latitude,
                Longitude = pointModel.Longitude,
                RegionId = pointModel.Region.Id,
                UserId = pointModel.User.Id
            };

            _ent.Point.Add(point);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, point.Id);
        }
    }
}