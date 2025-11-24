import 'dart:math';

void main () {
  final random = Random();
  final myList = List<int>.generate(1000000, (_) => random.nextInt(1000000));

  print("Generated 1,000,000 numbers!");

  final stopwatch = Stopwatch()..start();
  quicksort(myList);
  stopwatch.stop();

  print("Quicksort completed in: ${stopwatch.elapsedMilliseconds} ms");
}


void quicksort(List<int> list) {
  _quicksort(list, 0, list.length - 1);
}

void _quicksort(List<int> list, int low, int high) {
  if (low >= high) return;
  final pivotIndex = _lomutoPartition(list, low, high);
  _quicksort(list, low, pivotIndex - 1);
  _quicksort(list, pivotIndex + 1, high);
}

int _lomutoPartition(List<int> list, int low, int high) {
  int pivot = list[high];
  int smaller = low - 1;
  for (int current = low; current < high; current++) {
    if (list[current] <= pivot) {
      smaller++;
      _swap(list, smaller, current);
    }
  }
  smaller++;
  _swap(list, smaller, high);
  return smaller;
}

void _swap(List<int> list, int indexA, int indexB) {
  if (indexA == indexB) return;
  final temp = list[indexA];
  list[indexA] = list[indexB];
  list[indexB] = temp;
}
