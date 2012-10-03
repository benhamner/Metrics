using Koalas;
using Metrics;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace MetricsTests
{
    public class ElementwiseTests
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
            var submissionStream = Koalas.CsvReader.StringToStream("3.0\n4.0\n5");
            Assert.AreEqual(4.0, Evaluate.Metric(solutionStream, submissionStream, "mse"));
            Assert.AreEqual(4.0, Evaluate.Metric(solutionStream, submissionStream, "MSE"));
            Assert.AreEqual(4.0, Evaluate.Metric(solutionStream, submissionStream, "mean squared error"));
        }

        [Test]
        public void MaeTests() {
            var solutionStream = Koalas.CsvReader.StringToStream("1.0\n2.0\n3");
            var submissionStream = Koalas.CsvReader.StringToStream("2.0\n3.0\n4");
            Assert.AreEqual(1.0, Evaluate.Metric(solutionStream, submissionStream, "mae"));

            solutionStream = Koalas.CsvReader.StringToStream("1.0\n2.0\n11");
            submissionStream = Koalas.CsvReader.StringToStream("2.0\n3.0\n4");
            Assert.AreEqual(3.0, Evaluate.Metric(solutionStream, submissionStream, "MAE"));
        }
    }
}
