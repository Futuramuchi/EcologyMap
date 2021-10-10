using EcologyMapApi.Helper;
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
        private string _soilState { get; set; }
        private double _commonSoilState { get; set; }
        public IHttpActionResult GetAll()
        {
            //foreach (var status in _ent.Point)
            //{
            //    if (status.SoilState.IndexBGKP != null)
            //    {
            //        _commonSoilState = ((double)status.SoilState.IndexBGKP * 100) / 1000;
            //        if (status.SoilState.IndexBGKP <= 10 && status.SoilState.IndexBGKP > 0)
            //        {
            //            _soilState = "чистая";
            //            _commonSoilState = ((double)status.SoilState.IndexBGKP * 100) / 1000;
            //        }
            //        if (status.SoilState.IndexBGKP > 10 && status.SoilState.IndexBGKP <= 100)
            //        {
            //            _soilState = "умеренно чистая";
            //        }
            //        if (status.SoilState.IndexBGKP > 100 && status.SoilState.IndexBGKP <= 1000)
            //        {
            //            _soilState = "опасная";
            //        }
            //        if (status.SoilState.IndexBGKP > 1000)
            //        {
            //            _soilState = "чрезвычайно опасная";
            //        }
            //    }


            //}
            //var pointModel = _ent.Point.ToList();
            //for (int i = 0; i < pointModel.Count; i++)
            //{
            //    var points = new PointModel()
            //    {
            //        Id = pointModel[i].Id,
            //        Latitude = pointModel[i].Latitude,
            //        Longitude = pointModel[i].Longitude,
            //        AirState = new AirStateModel()
            //        {
            //            Id = pointModel[i].AirState.Id,
            //            CO2Value = pointModel[i].AirState.CO2Value,
            //            NO2Value = pointModel[i].AirState.NO2Value
            //        },
            //        SoilState = new SoilStateModel()
            //        {
            //            Id = pointModel[i].SoilState.Id,
            //            IndexBGKP = pointModel[i].SoilState.IndexBGKP,
            //            PHValue = pointModel[i].SoilState.PHValue
            //        },
            //        WaterState = new WaterStateModel()
            //        {
            //            Id = pointModel[i].WaterState.Id,
            //            TDSValue = pointModel[i].WaterState.TDSValue
            //        },
            //        Region = new RegionModel()
            //        {
            //            Coordinates = pointModel[i].Region.Coordinates
            //        },
            //        Geosmile = new GeosmileModel()
            //        {
            //            Id = pointModel[i].Geosmile.Id,
            //            Image = pointModel[i].Geosmile.Image,
            //            Name = pointModel[i].Geosmile.Name,
            //            Weather = pointModel[i].Geosmile.Weather
            //        }
            //    };
            //}

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
                    Name = x.Region.Name,
                    Description = x.Region.Description,
                    Coordinates = x.Region.Coordinates
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
            }).ToList();

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
                    Name = x.Region.Name,
                    Description = x.Region.Description,
                    Coordinates = x.Region.Coordinates
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
                RegionName = pointModel.Region.Name,
                UserId = pointModel.User.Id
            };

            _ent.Point.Add(point);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, point.Id);
        }
    }
}