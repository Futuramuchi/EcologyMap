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
    public class GeosmilesController : ApiController
    {
        private EcologyMapEntities _ent { get; set; } = new EcologyMapEntities();

        public IHttpActionResult Get() 
        {
            var geosmiles = _ent.Geosmile.ToList().ConvertAll(x => new GeosmileModel(x));

            return Ok(geosmiles);
        }

    }
}