import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/home.dart';
import 'flora_provider.dart';

class CustomColors {
  static const int _brownPrimaryValue = 0xFF442B2D;

  static const MaterialColor brownPrimary = MaterialColor(
    _brownPrimaryValue,
    <int, Color>{
      50: Color(0xFFEFEBE9),
      100: Color(0xFFD7CCC8),
      200: Color(0xFFBCAAA4),
      300: Color(0xFFA1887F),
      400: Color(0xFF8D6E63),
      500: Color(0xFF795548),
      600: Color(0xFF6D4C41),
      700: Color(0xFF5D4037),
      800: Color(0xFF4E342E),
      900: Color(_brownPrimaryValue), // Colors.brown.shade900 equivalent
    },
  );
}

ThemeData themeData = ThemeData(
  primarySwatch: CustomColors.brownPrimary, // Use the custom MaterialColor
);

MaterialApp app = MaterialApp(
  title: 'FLORA',
  theme: themeData,
  home: FloraProvider(
    child: HomeScreen(),
  ),
);

FloraProvider provider = FloraProvider(child: app);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return app;
  }
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
