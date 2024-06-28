import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

ShadThemeData lightTheme(BuildContext context, ShadColorScheme colorscheme) => ShadThemeData(
    colorScheme: colorscheme,
    brightness: Brightness.light);