using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcologicalMapAPI.Models
{
    public class LogActionModel
    {
        public int Id { get; set; }
        public UserModel User { get; set; }
        public string Description { get; set; }
        public DateTime DateTimeEvent { get; set; }
        public StationDataModel DtationData { get; set; }
    }
}