import 'package:flutter/material.dart';

class Button {
  final int id;
  String text;
  Color bg;
  bool enabled;

  Button({required this.id, this.text = "", this.bg = Colors.grey, this.enabled = true});
}
