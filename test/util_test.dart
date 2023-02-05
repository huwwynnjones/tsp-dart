import 'dart:collection';

import 'package:tsp/citykey.dart';
import 'package:tsp/util.dart';
import 'package:test/test.dart';

void main() {
  test('cities from city keys', () {
    final costs = {CityKey('A', 'B'): 80, CityKey('A', 'C'): 30};
    final correctResult = HashSet.from(['A', 'B', 'C']);
    expect(citiesFromCityKeys(costs), correctResult);
  });

  test('journey to city pairs', () {
    final journey = ['A', 'B', 'C'];
    final correctResult = [
      ['A', 'B'],
      ['B', 'C']
    ];
    expect(journeyToCityPairs(journey), correctResult);
  });
}
