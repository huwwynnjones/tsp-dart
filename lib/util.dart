import 'dart:collection';
import 'dart:io';

import 'package:tsp/citykey.dart';
import 'package:tsp/mapentry.dart';

Map<CityKey, int> loadCostsFromFile(String filename) {
  final file = File("cities.txt");
  return file.readAsLinesSync().fold(<CityKey, int>{}, (costs, line) {
    final mapEntry = MapEntry.from(line);
    costs[mapEntry.key] = mapEntry.cost;
    return costs;
  });
}

Set<String> citiesFromCityKeys(Map<CityKey, int> costs) {
  return costs.keys.fold(HashSet<String>(), (cities, cityKey) {
    cities.add(cityKey.start);
    cities.add(cityKey.end);
    return cities;
  });
}

List<List<String>> journeyToCityPairs(List<String> journey) {
  final cities = Queue.from(journey);
  final cityPairs = <List<String>>[];
  while (cities.length > 1) {
    final first = cities.first;
    cities.removeFirst();
    final second = cities.first;
    cityPairs.add([first, second]);
  }
  return cityPairs;
}

int calculateCost(List<List<String>> cityPairs, Map<CityKey, int> costs) {
  return cityPairs.fold(0, (int cost, pair) {
    final key = CityKey.from(pair);
    if (costs.containsKey(key)) {
      return cost + costs[key]!;
    } else if (costs.containsKey(key.reverseKey())) {
      return cost + costs[key.reverseKey()]!;
    } else {
      throw Exception("No costs for $pair");
    }
  });
}

int factorial(int number) {
  return List<int>.generate(number, (index) => index + 1)
      .fold(1, (value, element) => value * element);
}
