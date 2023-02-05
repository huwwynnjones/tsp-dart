class CityKey {
  final String start, end;

  CityKey(this.start, this.end);

  factory CityKey.from(List<String> pair) {
    return CityKey(pair[0], pair[1]);
  }

  CityKey reverseKey() {
    return CityKey(end, start);
  }

  @override
  bool operator ==(Object other) =>
      other is CityKey && start == other.start && end == other.end;

  @override
  int get hashCode => start.hashCode + end.hashCode;

  @override
  String toString() {
    return "$start, $end";
  }
}
