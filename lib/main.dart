import 'package:cat_or_dog_ia/pages/home_page.dart';
import 'package:cat_or_dog_ia/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/second': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'TFLite (Cat or Dog)',
      theme: _buildTheme(),
      home: SplashScreen(),
    );
  }

  _buildTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFF212121),
      accentColor: Colors.indigo,
      primarySwatch: Colors.indigo,
    );
  }
}
