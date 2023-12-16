import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class MyCustomFab extends StatelessWidget {
  final String title;
  final Function? onTap;

  const MyCustomFab({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 58),
      child: TextButton(
        onPressed: onTap != null ? () => onTap!() : () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          iconColor: Get.theme.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Colors.black, width: 2)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(UniconsLine.plus),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(color: Get.theme.primaryColor, fontSize: 16, fontFamily: "FlamaBold", letterSpacing: 1),
            ),
          ],
        ),
      ),
    );
  }
}
