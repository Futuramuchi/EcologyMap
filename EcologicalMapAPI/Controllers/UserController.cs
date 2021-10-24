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
    /// User
    /// </summary>
    public class UserController : ApiController
    {
        private EcologicalMapEntities _ent { get; set; } = new EcologicalMapEntities();

        /// <summary>
        /// Autorisation for user via login and password
        /// </summary>
        /// <remarks>
        /// Autorisation for user via login and password
        /// </remarks>
        /// <param name="login"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Get(string login, string password)
        {
            var user = await _ent.User.FirstOrDefaultAsync(x => x.Login == login && x.Password == password);
            if (user != null)
            {
                var userData = new UserModel()
                {
                    Id = user.Id,
                    FirstName = user.FirstName,
                    MiddleName = user.MiddleName,
                    LastName = user.LastName,
                    Email = user.Email,
                    Login = user.Login
                };

                return Request.CreateResponse(HttpStatusCode.OK, userData);
            }

            return Request.CreateResponse(HttpStatusCode.BadRequest, "Пользователь не найден!");
        }

        /// <summary>
        /// Registration for user
        /// </summary>
        /// <remarks>
        /// Adding new user in DB
        /// </remarks>
        /// <param name="userModel"></param>
        /// <returns></returns>
        public async Task<HttpResponseMessage> Post([FromBody] UserModel userModel)
        {
            try
            {

                var user = new User()
                {
                    FirstName = userModel.FirstName,
                    MiddleName = userModel.MiddleName,
                    LastName = userModel.LastName,
                    Email = userModel.Email,
                    Login = userModel.Login,
                    Password = userModel.Password
                };

                _ent.User.Add(user);
                await _ent.SaveChangesAsync();

                return Request.CreateResponse(HttpStatusCode.OK, "Пользователь успешно добален!");
            }
            catch (Exception er)
            {

                return Request.CreateResponse(HttpStatusCode.BadRequest, $"{er.Message}");
            }
        }
    }
}
