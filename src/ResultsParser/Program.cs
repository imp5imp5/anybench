﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Text.Json;
using System.Text;

namespace ResultsParser
{
    class Program
    {
        static void Main(string[] args)
        {
            var resultsPath = Path.Combine("..", "..", "..", "..", "..", "results");

            var outputPath = "output";

            if (!Directory.Exists(outputPath))
            {
                Directory.CreateDirectory(outputPath);
            }

            var files = Directory.GetFiles(resultsPath, "*.log", new EnumerationOptions() { RecurseSubdirectories = true });

            var benchmarksParser = new BenchmarksResultsParser();

            var benchItems = files.Select(f => benchmarksParser.Parse(f))
                .Where(b => !string.IsNullOrEmpty(b.ResultText))
                .GroupBy(b => b.Benchmark).ToArray();

            var cpuInfos = benchItems.SelectMany(bi => bi.Select(b => b.CpuInfo))
                .GroupBy(g => g.Name)
                .Select(g => g.First())
                .ToArray();

            var cpusCsvPath = Path.Combine(outputPath, "Cpus.csv");
            WriteCsv(cpusCsvPath, new []{"Name", "Vendor", "Architecture", "Model", "Description", "Cores"}, 
                cpuInfos.Select(c => new[] { c.Name, c.Vendor, c.Architecture, c.Model, c.Description, c.Cores.ToString() }));


            var cpusJson = JsonSerializer.Serialize(cpuInfos, new JsonSerializerOptions()
            {
                WriteIndented = true,
                AllowTrailingCommas = true
            });

            var cpusJsonPath = Path.Combine(outputPath, "Cpus.json");

            File.WriteAllText(cpusJsonPath, cpusJson);


            foreach (var benchItem in benchItems)
            {
                if (!Directory.Exists(Path.Combine(outputPath, benchItem.Key)))
                {
                    Directory.CreateDirectory(Path.Combine(outputPath, benchItem.Key));
                }

                var maxInCategory = benchItem.AsEnumerable()
                    .GroupBy(b => b.Category, (it, gr) => gr.OrderByDescending(o => o.Value).First());

                foreach (var benchValues in maxInCategory)
                {
                    byte[] bytes = Encoding.Default.GetBytes(benchValues.ResultText);
                    benchValues.ResultText = Encoding.UTF8.GetString(bytes);


                    var benchJson = JsonSerializer.Serialize(benchValues, new JsonSerializerOptions()
                    {
                        WriteIndented = true,
                        AllowTrailingCommas = true
                    });

                    var path1 = Path.Combine(outputPath, benchItem.Key, benchValues.Category);

                    File.WriteAllText($"{path1}.json", benchJson);
                }

                var maxValuesDictionary = benchItem.AsEnumerable()
                    .GroupBy(b => b.Category)
                    .ToDictionary(kv => kv.Key, kv => kv.Max(b => b.Value))
                    .OrderBy(kv => kv.Value)
                    .ToDictionary(kv => kv.Key, kv => kv.Value);

                var csvData = maxValuesDictionary.Select(item => new string[] { item.Key, item.Value.ToString(CultureInfo.InvariantCulture) });

                var path = Path.Combine(outputPath, benchItem.Key, $"{benchItem.Key.ToLowerInvariant()}.csv");
                WriteCsv(path, new[] { "Name", "Value" }, csvData);
            }
        }

        private static void WriteCsv(string fileName, IEnumerable<string> header, IEnumerable<IEnumerable<string>> data)
        {
            using var stream = File.CreateText(fileName);
            stream.WriteLine(String.Join(',', header.ToArray()));
            foreach (var item in data)
            {
                stream.WriteLine(String.Join(',', item.ToArray()));
            }
        }

    }
}
