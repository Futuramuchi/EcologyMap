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
    /// StationData
    /// </summary>
    public class StationDataController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();

        /// <summary>
        /// Get an appropriate data of station via its Id
        /// </summary>
        /// <param name="stationId"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Get(int stationId)
        {
            var stationData = await _ent.StationData.Where(x => x.StationId == stationId).Select(x => new StationDataModel()
            {
                Id = x.Id,
                Station = new StationModel() 
                {
                    Id = x.Station.Id,
                    Name = x.Station.Name,
                    Latitude = x.Station.Latitude,
                    Longitude = x.Station.Longitude
                },
                COValue = x.COValue,
                NO2Value = x.NO2Value,
                DateTime = x.DateTime,
                NOValue = x.NOValue,
                Humidity = x.Humidity,
                ModuleV = x.ModuleV,
                PM10 = x.PM10,
                PM25 = x.PM25,
                Precipitation = x.Precipitation,
                Pressure = x.Pressure,
                TValue = x.TValue,
                V = x.V
            }).ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, stationData);
        }


        /// <summary>
        /// Add new Station data
        /// </summary>
        /// <remarks>
        /// Adding new Station data
        /// </remarks>
        /// <param name="stationDataModel"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post([FromBody] StationDataModel stationDataModel)
        {
            var stationData = new StationData()
            {
                StationId = stationDataModel.Station.Id,
                COValue = stationDataModel.COValue,
                DateTime = DateTime.Now,
                Humidity = stationDataModel.Humidity,
                Precipitation = stationDataModel.Precipitation,
                Pressure = stationDataModel.Pressure,
                PM10 = stationDataModel.PM10,
                PM25 = stationDataModel.PM25,
                ModuleV = stationDataModel.ModuleV,
                NOValue = stationDataModel.NOValue,
                NO2Value = stationDataModel.NOValue,
                TValue = stationDataModel.TValue,
                V = stationDataModel.V
            };

            _ent.StationData.Add(stationData);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.OK);
        }
      
    }
}
