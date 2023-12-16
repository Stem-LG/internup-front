import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/data/models/bookmark.dart';
import 'package:internup/data/repositories/bookmarks.dart';

class BookmarksController extends GetxController {
  final BookmarksRepository _bookmarksRepository;

  BookmarksController(this._bookmarksRepository);

  RxList<Bookmark> bookmarksList = <Bookmark>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBookmarks();
  }

  void getBookmarks() async {
    List<Bookmark> bookmarks = await _bookmarksRepository.getBookmarks();
    bookmarksList.assignAll(bookmarks);
  }

  bool isBookmarked(Bookmark bookmark) {
    return bookmarksList.any((B) => B.id == bookmark.id && B.type == bookmark.type);
  }

  void toggleBookmark(Bookmark bookmark) {
    bool booked = isBookmarked(bookmark);
    if (booked) {
      bookmarksList.removeWhere((B) => B.id == bookmark.id && B.type == bookmark.type);
    } else {
      bookmarksList.add(bookmark);
    }
    debugPrint("toggled bookmark $booked");
  }
}
