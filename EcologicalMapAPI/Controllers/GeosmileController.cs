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
    /// Geosmile
    /// </summary>
    public class GeosmileController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();

        /// <summary>
        /// Get all geosmiles
        /// </summary>
        /// <remarks>
        /// Get a list of all geosmiles
        /// </remarks>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Get()
        {
            var geosmileList = await _ent.Geosmile.Select(x => new GeosmileModel()
            {
                Id = x.Id,
                Description = x.Description
            }).ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, geosmileList);
        }

    }
}
