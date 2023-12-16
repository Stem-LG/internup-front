import 'package:flutter/material.dart';

class MyCustomOutlinedInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final int maxLines;

  const MyCustomOutlinedInput({super.key, this.label, this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: Colors.black, width: 2)),
          label: label != null ? Text(label!) : null,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14),
          labelStyle: const TextStyle(fontFamily: "FlamaMedium", fontSize: 16),
          contentPadding: const EdgeInsets.all(12.5)),
      style: TextStyle(fontSize: maxLines > 1 ? 14 : 16),
    );
  }
}
