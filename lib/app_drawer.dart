import 'package:flutter/material.dart';
import 'package:flutter_layout/basic_screen.dart';
import 'package:flutter_layout/home.dart';
import 'package:flutter_layout/settings.dart';

import 'activity.dart';
import 'favorite_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage("assets/Flora.png"),
                fit: BoxFit.contain,
              ),
            ),
            child: null,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasicScreen()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: const Text('About'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityScreen()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Activity'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.favorite,
              ),
              title: const Text('Favorite Plants'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.settings_outlined,
              ),
              title: const Text('Settings'),
            ),
          ),
        ],
      ),
    );
  }
}
