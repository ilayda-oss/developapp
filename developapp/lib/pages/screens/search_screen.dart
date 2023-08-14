import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Color(0xFFFDE456),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 103, 176),
        automaticallyImplyLeading: false,
        leading: Image.asset('lib/images/logosarı.png'),
        title: Text(
          "e v e l o p",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: isDarkMode ? Colors.white : Color(0xFF57209D),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Search Screen Content', // Ekran içeriğini burada oluşturabilirsiniz
        ),
      ),
    );
  }
}
