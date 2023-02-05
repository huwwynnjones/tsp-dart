import 'dart:io';

import 'package:tsp/citykey.dart';
import 'package:tsp/permutations.dart';
import 'package:tsp/util.dart';

void main(List<String> arguments) {
  final costs = loadCostsFromFile("cities.txt");
  print(costs.isEmpty);
}
