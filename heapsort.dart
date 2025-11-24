import 'dart:math';
import 'heap.dart';

void main() {
  final random = Random();
  final list = List<int>.generate(1000000, (_) => random.nextInt(1000000));

  print("Benchmarking Heap Sort...");
  final stopwatch = Stopwatch()..start();
  final sorted = heapSort(list);
  stopwatch.stop();

  print("Heap Sort took: ${stopwatch.elapsedMilliseconds} ms");
}

List<int> heapSort(List<int> list) {
  final result = <int>[];
  final heap = MaxHeap();

  for (int value in list) {
    heap.insert(value);
  }

  while (heap.top != null) {
    result.add(heap.removeMax()!);
  }

  return result;
}
