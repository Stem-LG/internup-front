class Bookmark {
  String type;
  int id;

  Bookmark({required this.type, required this.id});

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      type: json['type'],
      id: json['id'],
    );
  }
}
