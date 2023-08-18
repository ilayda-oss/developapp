import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class ThemeModifier extends StatelessWidget {
  const ThemeModifier({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final windowPadding = MediaQuery.of(context).padding;
    return Row(
      children: [
        SizedBox(width: 10), // Görüntü ile anahtar arasına boşluk ekledik
        Padding(
          padding: const EdgeInsets.only(
            left: 53,
          ),
          child: Transform.scale(
            scale: 0.45,
            child: DayNightSwitch(
              dayColor: Color(0xFFFDE456),
              nightColor: Color(0xFF57209D),
              value: themeProvider.isDarkMode,
              moonImage: AssetImage('lib/images/dark.png'),
              sunImage: AssetImage('lib/images/light.png'),
              sunColor: Color(0xFF57209D),
              moonColor: Color(0xFFFDE456),
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
        ),
      ],
    );
  }
}
