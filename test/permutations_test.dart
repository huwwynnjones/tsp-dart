import 'package:tsp/permutations.dart';
import 'package:test/test.dart';

void main() {
  test('createIntegerArray', () {
    expect(createIntegerArray(3), [0, 1, 2, 3]);
  });

  test('swap', () {
    var list = [1, 2, 3];
    swap(list, 0, 2);
    expect(list, [3, 2, 1]);
  });

  test('permutation iterator', () {
    var a = [1, 2, 3];
    var p = Permutation(a);
    expect(p.moveNext(), true);
    expect(p.current, [1, 2, 3]);
    expect(p.moveNext(), true);
    expect(p.current, [2, 1, 3]);
    expect(p.moveNext(), true);
    expect(p.current, [3, 1, 2]);
    expect(p.moveNext(), true);
    expect(p.current, [1, 3, 2]);
    expect(p.moveNext(), true);
    expect(p.current, [2, 3, 1]);
    expect(p.moveNext(), true);
    expect(p.current, [3, 2, 1]);
    expect(p.moveNext(), false);
  });
}
