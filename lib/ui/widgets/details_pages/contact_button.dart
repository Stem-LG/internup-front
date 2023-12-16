import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyContactButton extends StatelessWidget {
  final String? text;
  final IconData? icon;

  // ignore: unused_element
  const MyContactButton({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 38),
      child: TextButton(
        style: TextButton.styleFrom(iconColor: Get.theme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Colors.black, width: 2)), padding: const EdgeInsets.all(0)),
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(icon!),
                  )
                : const SizedBox(),
            SizedBox(
              width: text != null && icon != null ? 10 : 0,
            ),
            text != null
                ? Text(
                    text!,
                    style: TextStyle(fontSize: 13, color: Get.theme.primaryColor),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
