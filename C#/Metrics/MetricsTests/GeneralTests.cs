using System;
using System.Data.SqlTypes;
using System.Collections.Generic;
using System.IO;
using Koalas;
using Metrics;
using NUnit.Framework;

namespace MetricsTests {
    class GeneralTests {
        [Test]
        public void MetricNotFoundTest() {
            Assert.Throws<KeyNotFoundException>(() => Evaluate.Metric(new MemoryStream(), new MemoryStream(), "FakeEvaluationMetric"));
        }

    }
}
