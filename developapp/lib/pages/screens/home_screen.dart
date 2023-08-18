import 'package:developapp/components/widgets/theme_modifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: themeProvider.bodyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            expandedHeight: 20, // Bu değeri ihtiyaca göre ayarlayın
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: themeProvider.appBarColor),
            ),
            actions: [ThemeModifier()],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: themeProvider.isDarkMode
                      ? Color(0xFFFDE456)
                      : Color(0xFF57209D),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: themeProvider.isDarkMode
                      ? Color(0xFFFDE456)
                      : Color(0xFF57209D),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: themeProvider.isDarkMode
                      ? Color(0xFFFDE456)
                      : Color(0xFF57209D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
