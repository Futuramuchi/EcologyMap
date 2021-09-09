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
            var points = _ent.Point.ToList().ConvertAll(x => new PointModel(x));

            return Ok(points);
        }

        public IHttpActionResult GetAppropriate(double longitude, double latitude)
        {
            var points = _ent.Point.Where(x => x.Longitude == longitude
            && x.Latitude == latitude).ToList().ConvertAll(x => new PointModel(x));

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