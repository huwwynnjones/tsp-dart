import 'dart:io';

import 'package:tsp/citykey.dart';
import 'package:tsp/permutations.dart';
import 'package:tsp/util.dart';

void main(List<String> arguments) {
  final costs = loadCostsFromFile("cities.txt");
  final cities = citiesFromCityKeys(costs);
  final Permutations<String> permutations = Permutations(List.from(cities));
  var cheapestJourneys = <List<String>>[];
  var lowestCost = double.maxFinite.toInt();

  print("Number of permutations ${factorial(cities.length)}");

  for (final journey in permutations) {
    final cityPairs = journeyToCityPairs(journey);
    var currentCost = calculateCost(cityPairs, costs);
    if (currentCost < lowestCost) {
      cheapestJourneys.clear();
      cheapestJourneys.add(journey);
      lowestCost = currentCost;
    } else if (currentCost == lowestCost) {
      cheapestJourneys.add(journey);
    }
  }

  print("Lowest cost $lowestCost, cheapest journey $cheapestJourneys");
}
