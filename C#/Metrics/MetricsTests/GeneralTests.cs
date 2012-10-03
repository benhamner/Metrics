using System;
using System.Data.SqlTypes;
using System.IO;
using Koalas;
using Metrics;
using NUnit.Framework;

namespace MetricsTests {
    class GeneralTests {
        [Test]
        public void MetricNotFoundTest() {
            Assert.Throws<NullReferenceException>(() => Evaluate.Metric(new MemoryStream(), new MemoryStream(), "FakeEvaluationMetric"));
        }

    }
}
