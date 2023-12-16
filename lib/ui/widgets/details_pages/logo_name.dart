import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class MyDetailsLogoName extends StatelessWidget {
  final String title;
  final String? logoUrl;

  const MyDetailsLogoName({super.key, required this.title, this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(width: 2, color: Get.theme.primaryColor), borderRadius: const BorderRadius.all(Radius.circular(16))),
          width: 160,
          height: 160,
          child: const Icon(
            UniconsLine.linux,
            size: 120,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
