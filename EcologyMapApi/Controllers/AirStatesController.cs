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
    public class AirStatesController : ApiController
    {
        private EcologyMapEntities _ent { get; set; } = new EcologyMapEntities();

        public async Task<HttpResponseMessage> Post([FromBody] AirStateModel airStateModel)
        {
            var airState = new AirState()
            {
                CO2Value = airStateModel.CO2Value,
                Dust = airStateModel.Dust,
                NO2Value = airStateModel.NO2Value
            };

            _ent.AirState.Add(airState);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, airState.Id);
        }
    }
}