using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Metrics
{
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, AllowMultiple = false)]
    public class MetricAttribute : Attribute
    {
        public MetricAttribute()
        {
            Abbreviation = "";
            Name = "";
            Description = "";
            IsMax = false;
        }

        public MetricAttribute(string abbreviation)
            : this()
        {
            Abbreviation = abbreviation;
        }

        public string Abbreviation { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsMax { get; set; }
    }
}
