




enum FilterType {
  ResidentComplexFilter,
  RoomFilter
}

class FilterArgument {
  FilterArgument({required this.previousFilter});
  final FilterType previousFilter;
}