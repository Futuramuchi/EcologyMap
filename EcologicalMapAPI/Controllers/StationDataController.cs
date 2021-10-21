using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace EcologicalMapAPI.Controllers
{
    public class StationDataController : ApiController
    {
        public HttpResponseMessage GetCO(DateTime dateTime, int stationId, float NO2, float NO, float PM25, float T, float moduleV, float V, float pressure, float humidity, float precipitation)
        {
            float CO = 0;
            return Request.CreateResponse(HttpStatusCode.OK, CO);
        }

        public HttpResponseMessage GetNO2(DateTime dateTime, int stationId, float CO, float NO, float PM25, float T, float moduleV, float V, float pressure, float humidity, float precipitation)
        {
            float NO2 = 0;
            return Request.CreateResponse(HttpStatusCode.OK, NO2);
        }

        public HttpResponseMessage GetNO(DateTime dateTime, int stationId, float CO, float NO2, float PM25, float T, float moduleV, float V, float pressure, float humidity, float precipitation)
        {
            float NO = 0;
            return Request.CreateResponse(HttpStatusCode.OK, NO);
        }

        public HttpResponseMessage GetNPM25(DateTime dateTime, int stationId, float CO, float NO, float NO2, float T, float moduleV, float V, float pressure, float humidity, float precipitation)
        {
            float PM25 = 0;
            return Request.CreateResponse(HttpStatusCode.OK, PM25);
        }

        public HttpResponseMessage GetT(DateTime dateTime, int stationId, float CO, float NO, float PM25, float NO2, float moduleV, float V, float pressure, float humidity, float precipitation)
        {
            float T = 0;
            return Request.CreateResponse(HttpStatusCode.OK, T);
        }

        public HttpResponseMessage GetModuleV(DateTime dateTime, int stationId, float CO, float NO, float PM25, float T, float NO2, float V, float pressure, float humidity, float precipitation)
        {
            float moduleV = 0;
            return Request.CreateResponse(HttpStatusCode.OK, moduleV);
        }

        public HttpResponseMessage GetV(DateTime dateTime, int stationId, float CO, float NO, float PM25, float T, float moduleV, float NO2, float pressure, float humidity, float precipitation)
        {
            float V = 0;
            return Request.CreateResponse(HttpStatusCode.OK, V);
        }

        public HttpResponseMessage GetPressure(DateTime dateTime, int stationId, float CO, float NO, float PM25, float T, float moduleV, float V, float NO2, float humidity, float precipitation)
        {
            float pressure = 0;
            return Request.CreateResponse(HttpStatusCode.OK, pressure);
        }

        public HttpResponseMessage GetHumidity(DateTime dateTime, int stationId, float CO, float NO, float PM25, float T, float moduleV, float V, float pressure, float NO2, float precipitation)
        {
            float humidity = 0;
            return Request.CreateResponse(HttpStatusCode.OK, humidity);
        }

        public HttpResponseMessage GetPrecipitation(DateTime dateTime, int stationId, float CO, float NO, float PM25, float T, float moduleV, float V, float pressure, float humidity, float NO2)
        {
            float precipitation = 0;
            return Request.CreateResponse(HttpStatusCode.OK, precipitation);
        }
    }
}
