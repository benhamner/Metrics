using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
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

    public static class Evaluate {
        public static double Metric(Stream solution, Stream submission, String metricName) {
            var metricType = typeof (Metric);
            var metric = metricType.Assembly.GetTypes().Where(metricType.IsAssignableFrom).FirstOrDefault(
                type => type.GetCustomAttributes(typeof(MetricAttribute), false)
                    .OfType<MetricAttribute>()
                    .Any(attr => attr.Abbreviation.Equals(metricName, StringComparison.InvariantCultureIgnoreCase)
                        || attr.Name.Equals(metricName, StringComparison.InvariantCultureIgnoreCase)));
            if (metric == null) {
                throw new NullReferenceException("Metric not found");
            }
            var scorer = System.Activator.CreateInstance(metric) as Metric;
            if (scorer == null) {
                throw new NullReferenceException("Metric not found");
            }
            return scorer.Score(DataFrame.FromCsvData(solution), DataFrame.FromCsvData(submission));
        }
    }

}
