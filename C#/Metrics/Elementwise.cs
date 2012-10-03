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

        public override double Score(DataFrame solution, DataFrame submission)
        {
            var actual = (Series<double>) solution[-1];
            var predicted = (Series<double>) submission[-1];
            return actual.Zip(predicted, CellError).ToSeries().Mean();
        }

        public abstract double CellError(double actual, double predicted);
    }

    [Metric(Abbreviation = "MSE", Name = "Mean Squared Error")]
    public class MeanSquaredError : MeanError {
        public override double CellError(double actual, double predicted) {
            return Math.Pow(actual - predicted, 2.0);
        }
    }

    [Metric(Abbreviation = "MAE", Name = "Mean Absolute Error")]
    public class MeanAbsoluteError : MeanError {
        public override double CellError(double actual, double predicted) {
            return Math.Abs(actual - predicted);
        }
    }
}
