class Industry {
  final int id;
  final String name;
  final String? logo;

  const Industry({required this.id, required this.name, this.logo});

  factory Industry.fromJson(Map<String, dynamic> json) {
    return Industry(
      id: json['id'],
      name: json['name'],
    );
  }
}
