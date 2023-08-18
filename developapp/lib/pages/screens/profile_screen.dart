import 'package:developapp/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/theme_modifier.dart';
import '../../provider/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      child: Scaffold(
        drawer: NavBar(),
        backgroundColor: themeProvider.bodyColor,
        appBar: AppBar(
          backgroundColor: themeProvider.appBarColor,
          actions: [
            ThemeModifier(),
          ],
        ),
      ),
    );
  }
}
//  Color(0xFF57209D), mor, Color(0xFFFDE456), sarı
// her gün yeni bi şey öğreniyok stl yazınca direkt çıkomus statless widget way 
