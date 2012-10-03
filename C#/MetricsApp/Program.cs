using Metrics;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MetricsApp {
    class Program {
        static void Main(string[] args) {
            if (args.Length < 3) {
                System.Console.WriteLine("Usage: metrics.exe solution.csv submission.csv metric_name");
            }
            Stream solutionFile = new FileStream(args[0], FileMode.Open, FileAccess.Read);
            Stream submissionFile = new FileStream(args[1], FileMode.Open, FileAccess.Read);
            var score = Evaluate.Metric(solutionFile, submissionFile, args[2]);
            System.Console.WriteLine("Score: " + score);
        }
    }
}
