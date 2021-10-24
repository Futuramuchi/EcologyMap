using EcologicalMapAPI.Helper;
using EcologicalMapAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace EcologicalMapAPI.Controllers
{
    /// <summary>
    /// AirState
    /// </summary>
    public class AirStateController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();
        
        /// <summary>
        /// Add new AirState
        /// </summary>
        /// <remarks>
        /// Adding new AirState in DB
        /// </remarks>
        /// <param name="airStateModel"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post([FromBody] AirStateModel airStateModel)
        {
            try
            {
                var airState = new AirState()
                {
                    COValue = airStateModel.COValue,
                    NO2Value = airStateModel.NO2Value
                };

                _ent.AirState.Add(airState);
                await _ent.SaveChangesAsync();

                PermanentData.AirStateId = airState.Id;
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception er)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, $"{er.Message}");

            }
        }
    }
}
