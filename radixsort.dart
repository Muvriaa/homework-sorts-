import 'dart:math';

void main() {
  final random = Random();
  final list = List<int>.generate(1000000, (_) => random.nextInt(1000000));

  print("Benchmarking Radix Sort...");
  final stopwatch = Stopwatch()..start();
  radixSort(list);
  stopwatch.stop();

  print("Radix Sort took: ${stopwatch.elapsedMilliseconds} ms");
}

void radixSort(List<int> list) {
  if (list.length <= 1) return;

  int place = 1;

  int biggestNumber = list[0];
  for (int value in list) {
    if (value > biggestNumber) biggestNumber = value;
  }

  final numberOfDigits = biggestNumber.toString().length;

  for (int i = 0; i < numberOfDigits; i++) {
    final buckets = List<List<int>>.generate(10, (_) => []);

    for (int value in list) {
      final digit = (value ~/ place) % 10;
      buckets[digit].add(value);
    }

    list.clear();
    for (final bucket in buckets) {
      list.addAll(bucket);
    }

    place *= 10;
  }
}
