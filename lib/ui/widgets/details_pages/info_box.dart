import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/url_operations.dart';

class MyInfoBox extends StatelessWidget {
  final Widget child;

  const MyInfoBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Get.theme.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }
}

class MyInfoSection extends StatelessWidget {
  final String title;
  final Widget child;
  final double marginBottom;

  const MyInfoSection({super.key, required this.title, required this.child, this.marginBottom = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(height: 1, fontSize: 16)),
        const SizedBox(
          height: 3,
        ),
        child,
        SizedBox(
          height: marginBottom,
        ),
      ],
    );
  }
}

class _MyInfoSectionItem extends StatelessWidget {
  final String title;
  final String? link;

  // ignore: unused_element
  const _MyInfoSectionItem({required this.title, this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 22,
        child: RawMaterialButton(
            onPressed: link != null
                ? () {
                    easyLaunchUrl(link!);
                  }
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // Button border radius
              side: BorderSide(color: Get.theme.primaryColor, width: 1.5), // Button border
            ),
            padding: const EdgeInsets.only(top: 0, right: 6, bottom: 2, left: 6),
            constraints: const BoxConstraints(minHeight: 20),
            child: Text(
              title,
              style: const TextStyle(height: 1, fontSize: 12),
            )));
  }
}

class MyInfoSectionItemList extends StatelessWidget {
  final List<Map<String, String>> items;

  const MyInfoSectionItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        runSpacing: 5,
        children: items.map((e) {
          if (e["link"] != null) {
            return _MyInfoSectionItem(title: e["title"]!, link: e["link"]!);
          } else {
            return _MyInfoSectionItem(title: e["title"]!);
          }
        }).toList(),
      ),
    );
  }
}
