using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologicalMapAPI.Models
{
    public class StationDataModel
    {
        public int? Id { get; set; }
        public StationModel Station { get; set; }
        public DateTime DateTime { get; set; }
        public double? COValue { get; set; }
        public double? NO2Value { get; set; }
        public double? NOValue { get; set; }
        public double? PM10 { get; set; }
        public double? PM25 { get; set; }
        public double? TValue { get; set; }
        public double? ModuleV { get; set; }
        public double? V { get; set; }
        public double? Pressure { get; set; }
        public double? Humidity { get; set; }
        public double? Precipitation { get; set; }

    }
}