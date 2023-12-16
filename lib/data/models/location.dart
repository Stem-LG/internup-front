class Location {
  final int id;
  final String name;
  final String? link;

  const Location({required this.id, required this.name, this.link});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }
}
