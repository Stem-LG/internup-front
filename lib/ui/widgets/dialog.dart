import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class MyCustomDialog extends StatelessWidget {
  final String? title;
  final Widget? body;

  const MyCustomDialog({super.key, this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 3,
            ),
            _MyDialogTitle(
              title: title,
            ),
            body != null
                ? body!
                : const SizedBox(
                    height: 0,
                  )
          ],
        ));
  }
}

class _MyDialogTitle extends StatelessWidget {
  final String? title;

  const _MyDialogTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _MyBlancIconButton(),
          title != null
              ? Text(
                  title!,
                  style: const TextStyle(fontSize: 20, fontFamily: "FlamaMedium"),
                )
              : const _MyBlancIconButton(),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(UniconsLine.times)),
        ],
      ),
    );
  }
}

class _MyBlancIconButton extends StatelessWidget {
  const _MyBlancIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: null,
      icon: Icon(UniconsLine.times),
      disabledColor: Colors.transparent,
    );
  }
}
