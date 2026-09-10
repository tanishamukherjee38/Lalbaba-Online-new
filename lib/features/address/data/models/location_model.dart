class LocationItem {
  final String name;
  final String? iso2;

  const LocationItem({required this.name, this.iso2});

  factory LocationItem.fromJson(Map<String, dynamic> json) {
    return LocationItem(
      name: json['name']?.toString() ?? '',
      iso2: json['iso2']?.toString(),
    );
  }

  @override
  String toString() => name;
}
