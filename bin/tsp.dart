import 'package:tsp/permutations.dart';
import 'package:tsp/util.dart';

void main(List<String> arguments) {
  final costs = loadCostsFromFile("cities.txt");
  final cities = citiesFromCityKeys(costs);
  final permutations = Permutations<String>(List.from(cities));
  final cheapestJourneys = <List<String>>[];
  var lowestCost = double.maxFinite.toInt();

  print("Number of permutations ${factorial(cities.length)}");

  for (final journey in permutations) {
    final cityPairs = journeyToCityPairs(journey);
    final currentCost = calculateCost(cityPairs, costs);
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
