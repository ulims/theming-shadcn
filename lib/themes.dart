import 'package:flutter/material.dart';

enum ColorOption {
  red(Colors.red, 'Red'),
  blue(Colors.blue, 'Blue'),
  green(Colors.green, 'Green'),
  cyan(Colors.cyan, 'Cyan');

  final Color color;
  final String name;

  const ColorOption(this.color, this.name);
}