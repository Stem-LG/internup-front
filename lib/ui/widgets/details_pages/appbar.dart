import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/bookmarks_controller.dart';
import 'package:internup/data/models/bookmark.dart';
import 'package:unicons/unicons.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget MyDetailsAppBar(String title, {Bookmark? bookmark}) {
  BookmarksController bookmarksController = Get.find<BookmarksController>();

  RxBool isBookmarked =
      bookmark != null && bookmarksController.isBookmarked(bookmark) ? true.obs : false.obs;

  bookmarksController.bookmarksList.listen((_) {
    isBookmarked.value = bookmarksController.isBookmarked(bookmark!);
  });

  return AppBar(
    title: Text(title),
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(UniconsLine.angle_left_b)),
    actions: bookmark != null
        ? [
            Obx(() => GestureDetector(
                onTap: () => bookmarksController.toggleBookmark(bookmark),
                child: isBookmarked.value
                    ? const Icon(UniconsSolid.bookmark)
                    : const Icon(UniconsLine.bookmark))),
            const SizedBox(
              width: 20,
            ),
          ]
        : [],
  );
}
