class CityKey {
  final String start, end;

  CityKey(this.start, this.end);

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
