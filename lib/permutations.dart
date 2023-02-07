import 'dart:collection';

class Permutation<T> implements Iterator<List<T>> {
  late List<T> _a;
  late int _n;
  late List<int> _p;
  int _i = 1;
  bool _initialCall = true;

  Permutation(List<T> a) {
    _a = List<T>.from(a);
    _n = _a.length;
    _p = createIntegerArray(_n);
  }

  @override
  List<T> get current => List.from(_a);

  @override
  bool moveNext() {
    if (!(_i < _n)) {
      return false;
    }
    if (_initialCall) {
      _initialCall = false;
      return true;
    } else if (_i < _n) {
      _p[_i] -= 1;
      var j = odd(_i) ? _p[_i] : 0;
      swap(_a, j, _i);
      _i = 1;
      while (_p[_i] == 0) {
        _p[_i] = _i;
        _i++;
      }
    }
    return true;
  }
}

class Permutations<T> extends IterableBase<List<T>> {
  @override
  late Permutation<T> iterator;

  Permutations(List<T> a) {
    iterator = Permutation(a);
  }
}

List<int> createIntegerArray(int length) {
  return List<int>.generate(length + 1, (index) => index);
}

bool odd(int number) {
  return number % 2 != 0;
}

void swap<T>(List<T> list, int a, int b) {
  var temp = list[a];
  list[a] = list[b];
  list[b] = temp;
}
