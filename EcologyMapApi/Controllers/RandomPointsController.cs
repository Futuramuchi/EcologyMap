using EcologyMapApi.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace EcologyMapApi.Controllers
{
    public class RandomPointsController : ApiController
    {

        public IHttpActionResult GetRandomValue() 
        {
            return Ok(ValuesGenerator.PointsValues());
        }
    }
}