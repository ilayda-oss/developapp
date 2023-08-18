import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 231, 197, 209),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User122535"),
            accountEmail: Text(user!.email!),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://wallpaperaccess.com/full/6295120.jpg',
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.freecodecamp.org/news/content/images/2021/06/w-qjCHPZbeXCQ-unsplash.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: signUserOut,
          ),
        ],
      ),
    );
  }
}
