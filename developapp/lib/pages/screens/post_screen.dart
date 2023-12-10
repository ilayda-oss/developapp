import 'package:developapp/components/widgets/theme_modifier.dart';
import 'package:developapp/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  void openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Seçilen resmin yolu pickedFile.path olarak kullanılabilir.
      // İstediğiniz işlemleri yapabilirsiniz.
      print('Galeriden seçilen dosya yolu: ${pickedFile.path}');
    } else {
      print('Galeriden resim seçilmedi.');
    }
  }

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
                    height: 120,
                    decoration: BoxDecoration(
                      color: themeProvider.textfieldColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Burada galeriyi açma işlemini gerçekleştirebilirsiniz.
                            // Örneğin, galeriye gidilmesi için bir metot çağırabilirsiniz.
                            openGallery();
                          },
                          child: Container(
                            width: 120,
                            child: Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Image.asset('lib/images/kamera.png'),
                            ),
                          ),
                        ),
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            controller: titleController,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                                labelText: 'Başlık',
                                filled:
                                    true, // TextField'ın iç rengini etkinleştirir
                                fillColor: themeProvider
                                    .textfieldColor, // TextField'ın iç rengini ayarlar
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // Dışındaki yumuşaklığı ayarlar
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    titleController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                )),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          height: 40,
                          child: TextField(
                            controller: categoryController,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                                labelText: 'Kategori/Alan',
                                filled:
                                    true, // TextField'ın iç rengini etkinleştirir
                                fillColor: themeProvider
                                    .textfieldColor, // TextField'ın iç rengini ayarlar
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // Dışındaki yumuşaklığı ayarlar
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    categoryController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                )),
                          ),
                        ),
                        SizedBox(height: 35),

                        // Buraya başka widget'lar ekleyebilirsiniz.
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: themeProvider.switchImagesMargin,
                  child: Container(
                    width: 300,
                    height: 250, // Sabit kutunun yüksekliği
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(themeProvider
                            .switchImages), // Resim dosyasının yolu
                        fit: BoxFit.cover, // Resmi kaplamak için uygun fit türü
                      ),
                    ), // Kutu rengi
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
