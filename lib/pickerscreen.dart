
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadtheming/themeprovider.dart';
import 'package:shadtheming/themes.dart';

class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Color Picker'),
      ),
      body: Consumer<ColorProvider>(
        builder: (context, colorProvider, child) {
          return ListView.builder(
            itemCount: ColorOption.values.length,
            itemBuilder: (context, index) {
              final colorOption = ColorOption.values[index];

              return ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorOption.color,
                  ),
                ),
                title: Text(colorOption.name),
                trailing: ShadButton(
 text: const Text('Primary'),
 onPressed: () {},
),
                onTap: () {
                  colorProvider.setSelectedColor(colorOption);
                },
              );
            },
          );
        },
      ),
    );
  }
}