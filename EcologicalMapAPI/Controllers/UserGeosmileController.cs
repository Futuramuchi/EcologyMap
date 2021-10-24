using EcologicalMapAPI.Helper;
using EcologicalMapAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace EcologicalMapAPI.Controllers
{
    /// <summary>
    /// UserGeosmile
    /// </summary>
    public class UserGeosmileController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();

        /// <summary>
        /// Get all User's geosmiles
        /// </summary>
        /// <remarks>
        /// Get a list of all Users' geosmiles
        /// </remarks>
        /// <returns></returns>
        public async Task<HttpResponseMessage> GetAll()
        {
            var userGeosmile = await _ent.UserGeosmile.Select(x => new UserGeosmileModel()
            {
                Id = x.Id,
                GeosmileId = (int)x.GeosmileId,
                UserId = x.UserData.UserId,
                Latitude = (double)x.Latitude,
                Longitude = (double)x.Longitude
            }).ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, userGeosmile);
        }

        /// <summary>
        /// Add new User's geosmile data
        /// </summary>
        /// <remarks>
        /// Adding new User's geosmile data in DB
        /// </remarks>
        /// <param name="userGeosmile"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post([FromBody] UserGeosmileModel userGeosmile)
        {
            try
            {

                var userGeosmileData = new UserGeosmile()
                {
                    UserId = PermanentData.UserId,
                    GeosmileId = userGeosmile.GeosmileId,
                    Latitude = userGeosmile.Latitude,
                    Longitude = userGeosmile.Longitude
                };

                _ent.UserGeosmile.Add(userGeosmileData);
                await _ent.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Данные успешно сохранены!");
            }
            catch (Exception er)
            {
                return Request.CreateResponse(HttpStatusCode.OK, $"{er.Message}");
            }
        }
    }
}
