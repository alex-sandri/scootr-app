class Location {
  final num latitude;
  final num longitude;

  const Location({
    required this.latitude,
    required this.longitude,
  });

  Location.deserialize(Map<String, dynamic> json): this(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );
}
