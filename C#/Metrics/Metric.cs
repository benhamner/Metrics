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
        private static Dictionary<string, Metric> _abbreviationToMetric = new Dictionary<string, Metric>(StringComparer.OrdinalIgnoreCase);
        private static Dictionary<string, Metric> _nameToMetric = new Dictionary<string, Metric>(StringComparer.OrdinalIgnoreCase);

        private static void InitializeMetricDictionaryViaReflection() {
            var metricType = typeof (Metric);
            var metricTypes = metricType.Assembly.GetTypes().Where(metricType.IsAssignableFrom).Where(type => type.GetCustomAttributes(typeof(MetricAttribute), false).Any());
            foreach (var type in metricTypes) {
                var attr = type.GetCustomAttributes(typeof (MetricAttribute), false).OfType<MetricAttribute>().First();
                var metric = (Metric) Activator.CreateInstance(type);
                _abbreviationToMetric.Add(attr.Abbreviation, metric);
                _nameToMetric.Add(attr.Name, metric);
            }
        }

        public static Metric GetMetric(string metricAbbreviationOrName) {
            if (_abbreviationToMetric.Count==0) {
                InitializeMetricDictionaryViaReflection();
            }
            if (_abbreviationToMetric.ContainsKey(metricAbbreviationOrName)) {
                return _abbreviationToMetric[metricAbbreviationOrName];
            }
            if (_nameToMetric.ContainsKey(metricAbbreviationOrName)) {
                return _nameToMetric[metricAbbreviationOrName];
            }
            throw new KeyNotFoundException("Metric " + metricAbbreviationOrName + " not found");
        }

        public static double Metric(Stream solution, Stream submission, String metricName) {
            return GetMetric(metricName).Score(DataFrame.FromCsvData(solution), DataFrame.FromCsvData(submission));
        }
    }

}
