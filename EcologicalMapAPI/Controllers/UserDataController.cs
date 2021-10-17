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
    public class UserDataController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();

        public async Task<HttpResponseMessage> Post([FromBody] UserDataModel userDataModel)
        {
            var userData = new UserData()
            {
                UserId = (int)userDataModel.User.Id,
                GeosmileId = userDataModel.Geosmile.Id,
                AirStateId = PermanentData.AirStateId,
                DateTime = DateTime.Now,
                Latitude = userDataModel.Latitude,
                Longitude = userDataModel.Longitude,
                Temperature = userDataModel.Temperature
            };

            _ent.UserData.Add(userData);
            await _ent.SaveChangesAsync();

            return Request.CreateResponse(HttpStatusCode.OK, "Данные успешно сохранены!");
        }

        public async Task<HttpResponseMessage> Get() 
        {
            var userDataList = await _ent.UserData.Select(x => new UserDataModel()
            {
                Id = x.Id,
                User = new UserModel() 
                {
                    Id = x.User.Id,
                    FirstName = x.User.FirstName,
                    MiddleName = x.User.MiddleName,
                    LastName = x.User.LastName
                },
                Temperature = x.Temperature,
                DateTime = x.DateTime,
                Latitude = x.Latitude,
                Longitude = x.Longitude,
                AirState = new AirStateModel() 
                {
                    Id = x.AirState.Id,
                    COValue = x.AirState.COValue,
                    NO2Value = x.AirState.NO2Value
                },
                Geosmile = new GeosmileModel() 
                {
                    Id = x.Geosmile.Id,
                    Description = x.Geosmile.Description
                }
            }).ToListAsync();

            return Request.CreateResponse(HttpStatusCode.OK, userDataList);

        }
    }
}
