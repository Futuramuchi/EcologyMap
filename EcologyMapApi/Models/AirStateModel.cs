using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class AirStateModel
    {
        public int? Id { get; set; }
        public double? CO2Value { get; set; }
        public double? NO2Value { get; set; }
        public double? Dust { get; set; }
    }
}