import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class MyEditRemoveButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  const MyEditRemoveButton({super.key, required this.onTap, this.text = "Request Edit / Removal", this.icon = UniconsLine.edit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Get.theme.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 22),
          ),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: "FlamaMedium"),
              ),
              const SizedBox(
                width: 7,
              ),
              Icon(
                icon,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
