class SocialMedia {
  final int id;
  final String name;
  final String? link;

  const SocialMedia({required this.id, required this.name, this.link});

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      id: json['id'],
      name: json['name'],
      link: json['link'],
    );
  }
}
