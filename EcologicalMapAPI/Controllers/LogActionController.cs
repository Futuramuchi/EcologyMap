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
    /// LogAction
    /// </summary>
    public class LogActionController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();

        /// <summary>
        /// Add new LogAction
        /// </summary>
        /// <remarks>
        /// Adding new Log
        /// </remarks>
        /// <param name="logActionModel"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post([FromBody] LogActionModel logActionModel)
        {
            var logAction = new LogAction()
            {
                DateTimeEvent = DateTime.Now,
                StationDataId = logActionModel.StationData.Id,
                UserId = logActionModel.User.Id,
                Description = logActionModel.Description
            };

            _ent.LogAction.Add(logAction);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.OK, "Лог сохранен");
        }

        public async Task<HttpResponseMessage> Get() 
        {
            var logActionList = await _ent.LogAction.Select(x => new LogActionModel()
            {
                Id = x.Id,
                StationData = new StationDataModel() 
                {
                    Id = x.StationDataId                    
                },
                Description = x.Description,
                DateTimeEvent = x.DateTimeEvent,
                User = new UserModel() 
                {
                    Id = x.UserId
                }
            }).ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, logActionList);
        }
    }

}
