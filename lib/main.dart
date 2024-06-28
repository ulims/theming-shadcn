import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadtheming/darktheme.dart';
import 'package:shadtheming/lightheme.dart';
import 'package:shadtheming/pickerscreen.dart';
import 'package:shadtheming/themeprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(builder: (context, colorProvider, child) {
      final (lightScheme, darkScheme) = colorProvider.getColorScheme();
      return ShadApp.material(
        title: 'Mufasa',
        theme: lightTheme(context, lightScheme),
        darkTheme: darkTheme(context, darkScheme),
        home: const ColorPickerScreen(),
      );
    });
  }
}
