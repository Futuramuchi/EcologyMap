using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologicalMapAPI.Models
{
    public class AirStateModel
    {
        public int? Id { get; set; }
        public double? COValue { get; set; }
        public double? NO2Value { get; set; }
    }
}