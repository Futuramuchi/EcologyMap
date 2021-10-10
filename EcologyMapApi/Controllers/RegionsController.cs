using EcologyMapApi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Http;
using System.Runtime.Remoting.Messaging;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace EcologyMapApi.Controllers
{
    public class RegionsController : ApiController
    {
        private EcologyMapEntities _ent { get; set; } = new EcologyMapEntities();

        public async Task<HttpResponseMessage> GetAll() 
        {
            var regions = await _ent.Region.Select(x => new RegionModel()
            {
                Name = x.Name,
                Description = x.Description,
                Coordinates = x.Coordinates
            }).ToListAsync();


            return Request.CreateResponse(System.Net.HttpStatusCode.OK, regions);
        }
    }
}