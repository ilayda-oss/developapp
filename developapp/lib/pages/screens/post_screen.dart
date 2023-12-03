import 'package:developapp/components/widgets/theme_modifier.dart';
import 'package:developapp/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DrakTheme'
        : 'LightTheme';
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
                color: themeProvider.textColor,
              ),
            ),
            actions: [ThemeModifier()],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFF66DA7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            height: 105,
                            child: Image.asset('lib/images/kamera.png'),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          child: TextField(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              labelText: 'Başlık',
                              filled:
                                  true, // TextField'ın iç rengini etkinleştirir
                              fillColor: Color.fromARGB(255, 255, 141,
                                  190), // TextField'ın iç rengini ayarlar
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Dışındaki yumuşaklığı ayarlar
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          height: 30,
                          child: TextField(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              labelText: 'Kategori/Alan',
                              filled:
                                  true, // TextField'ın iç rengini etkinleştirir
                              fillColor: Color.fromARGB(255, 255, 141,
                                  190), // TextField'ın iç rengini ayarlar
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Dışındaki yumuşaklığı ayarlar
                              ),
                            ),
                          ),
                        ),
                        // Buraya başka widget'lar ekleyebilirsiniz.
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
