import 'dart:math';

void main() {
  final random = Random();
  final list = List<int>.generate(1000000, (_) => random.nextInt(1000000));

  print("Benchmarking Merge Sort...");
  final stopwatch = Stopwatch()..start();
  final sorted = mergeSort(list);
  stopwatch.stop();

  print("Merge Sort took: ${stopwatch.elapsedMilliseconds} ms");
}

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) return list;

  final mid = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, mid));
  final right = mergeSort(list.sublist(mid));

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  final result = <int>[];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }

  while (i < left.length) result.add(left[i++]);
  while (j < right.length) result.add(right[j++]);

  return result;
}
