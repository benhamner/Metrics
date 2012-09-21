using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Koalas;

namespace Metrics
{
    public abstract class MeanError : Metric {
        public override bool IsMax { get { throw new NotImplementedException(); } }
        public override string Name { get { throw new NotImplementedException(); } }
        public override string Description { get { throw new NotImplementedException(); } }

        public override double Score(DataFrame solution, DataFrame submission) {
            return solution.GetSeriesByType<Double>().Zip(submission.GetSeriesByType<Double>(), CellError).ToSeries().Mean();
        }

        public abstract double CellError(double actual, double predicted);
    }

    public class MeanSquaredError : MeanError {
        public override double CellError(double actual, double predicted) {
            return Math.Pow(actual - predicted, 2.0);
        }
    }
}
