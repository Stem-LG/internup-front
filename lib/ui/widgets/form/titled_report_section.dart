import 'package:flutter/material.dart';

class MyTitledReportSection extends StatelessWidget {
  final String title;
  final Widget child;

  const MyTitledReportSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 36,
              child: Center(
                  child: Text(
                title,
                style: const TextStyle(fontFamily: "FlamaMedium", fontSize: 14),
              ))),
          child
        ],
      ),
    );
  }
}
