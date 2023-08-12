import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFDE456),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color.fromARGB(255, 228, 103, 176),
              automaticallyImplyLeading: false,
              leading: Image.asset('lib/images/logosarı.png'),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: Container(
                          child: Text(
                        "e v e l o p",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color(
                              0xFFFDE456,
                            )),
                      )),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Color(0xFF57209D),
                ),
              ),

              expandedHeight: 00,
              // backgroundColor: Color.fromARGB(255, 228, 103, 176)
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: Color(0xFF57209D),
                ),
              ),
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: Color(0xFF57209D),
                ),
              ),
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: Color(0xFF57209D),
                ),
              ),
            ))
          ],
        ));
  }
}
