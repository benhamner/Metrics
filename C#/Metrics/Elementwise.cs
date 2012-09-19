using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Koalas;

namespace Metrics
{
    class Elementwise : Metric {
        public override bool IsMax { get { throw new NotImplementedException(); } }
        public override string Name { get { throw new NotImplementedException(); } }
        public override string Description { get { throw new NotImplementedException(); } }

        public override double Score(DataFrame actual, DataFrame predicted) {
            throw new NotImplementedException();
        }
    }
}
