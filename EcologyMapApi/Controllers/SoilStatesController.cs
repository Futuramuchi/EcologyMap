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
    public class SoilStatesController : ApiController
    {
        private EcologyMapEntities _ent { get; set; } = new EcologyMapEntities();

        public async Task<HttpResponseMessage> Post([FromBody] SoilStateModel soilStateModel)
        {
            var soilSatte = new SoilState()
            {
                CategoryId = soilStateModel.Category.Id,
                IndexBGKP = soilStateModel.IndexBGKP,
                PHValue = soilStateModel.PHValue
            };

            _ent.SoilState.Add(soilSatte);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK, soilSatte.Id);
        }
    }
}