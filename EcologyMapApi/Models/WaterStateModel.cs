using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class WaterStateModel
    {
        public int? Id { get; set; }
        public double? TDSValue { get; set; }
        public string Description { get; set; }
    }
}