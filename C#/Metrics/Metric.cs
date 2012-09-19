using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Koalas;

namespace Metrics
{
    public abstract class Metric {
        public abstract bool IsMax { get; }
        public abstract String Name { get; }
        public abstract String Description { get; }
        public abstract double Score(DataFrame actual, DataFrame predicted);
    }
}
