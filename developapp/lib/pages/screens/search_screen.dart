import 'package:developapp/components/widgets/theme_modifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: themeProvider.bodyColor,
      appBar: AppBar(
        backgroundColor: themeProvider.appBarColor,
        automaticallyImplyLeading: false,
        leading: Image.asset(
          themeProvider.isDarkMode
              ? 'lib/images/logomor.png'
              : 'lib/images/logosarı.png',
        ),
        title: Text(
          "e v e l o p",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: themeProvider.textColor),
        ),
        actions: [ThemeModifier()],
      ),
      body: Center(
        child: Text(
          'Search Screen Content', // Ekran içeriğini burada oluşturabilirsiniz
        ),
      ),
    );
  }
}
