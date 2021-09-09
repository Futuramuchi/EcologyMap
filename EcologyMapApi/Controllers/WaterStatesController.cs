using EcologyMapApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace EcologyMapApi.Controllers
{
    public class WaterStatesController : ApiController
    {
        private EcologyMapEntities _ent { get; set; } = new EcologyMapEntities();

        public async Task<HttpResponseMessage> Post([FromBody] WaterStateModel waterStateModel)
        {
            var waterState = new WaterState()
            {
                Description = waterStateModel.Description,
                TDSValue = waterStateModel.TDSValue
            };

            _ent.WaterState.Add(waterState);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, waterState.Id);
        }

    }
}