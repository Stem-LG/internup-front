import 'package:internup/data/models/bookmark.dart';

class BookmarksRepository {
  Future<List<Bookmark>> getBookmarks() async {
    return [
      Bookmark.fromJson({
        "id": 0,
        "type": "company",
      }),
      Bookmark.fromJson({
        "id": 0,
        "type": "offer",
      }),
      Bookmark.fromJson({
        "id": 1,
        "type": "company",
      }),
      Bookmark.fromJson({
        "id": 1,
        "type": "offer",
      }),
    ];
  }
}
