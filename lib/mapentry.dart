import 'package:tsp/citykey.dart';

class MapEntry {
  final CityKey key;
  final int cost;

  MapEntry(this.key, this.cost);

  factory MapEntry.from(String input) {
    var items = input.split(" ");
    var key = CityKey(items[0], items[1]);
    var cost = int.parse(items[2]);
    return MapEntry(key, cost);
  }

  @override
  bool operator ==(Object other) =>
      other is MapEntry && key == other.key && cost == other.cost;

  @override
  int get hashCode => key.hashCode + cost.hashCode;
}
