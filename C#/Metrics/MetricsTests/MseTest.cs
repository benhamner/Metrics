using Koalas;
using Metrics;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace MetricsTests
{
    public class MseTest
    {
        [Test]
        public void MseTests() {
            var solution = DataFrame.FromCsvData(@"1.0
2.0
3");
            var submission = DataFrame.FromCsvData(@"2.0
3.0
4");
            var scoreKeeper = new MeanSquaredError();
            Assert.AreEqual(1.0, scoreKeeper.Score(solution, submission));

            var solutionStream = Koalas.CsvReader.StringToStream("1.0\n2.0\n3");
            var submissionStream = Koalas.CsvReader.StringToStream("2.0\n3.0\n4");
            Assert.AreEqual(1.0, Evaluate.Metric(solutionStream, submissionStream, "mse"));
            Assert.AreEqual(1.0, Evaluate.Metric(solutionStream, submissionStream, "MSE"));
            Assert.AreEqual(1.0, Evaluate.Metric(solutionStream, submissionStream, "mean squared error"));
        }
    }
}
