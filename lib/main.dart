//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/home.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(StaticApp());
}

class StaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.brown.shade50,
        appBarTheme: AppBarTheme(
          elevation: 10,
          titleTextStyle: TextStyle(
            // change from TextTheme
            fontFamily: 'Babylonica',
            fontSize: 24,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
