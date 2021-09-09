using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologyMapApi.Models
{
    public class SoilStateModel
    {
        public int? Id { get; set; }
        public CategoryModel Category { get; set; }
        public double? IndexBGKP { get; set; }
        public double? PHValue { get; set; }
    }
}