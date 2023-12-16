class Technology {
  final int id;
  final String name;
  final String? logo;
  final String? link;

  const Technology({required this.id, required this.name, this.logo, this.link});

  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }
}
