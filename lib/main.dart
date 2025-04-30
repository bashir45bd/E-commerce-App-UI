// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testapps/Home.dart';
import 'package:testapps/splashScreen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primaryColor: Color(0xFFDC1E76),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Color(0xFFDC1E76),
          secondary: Color(0xFFFAE208),
        ),
      ),
      home: Main(),
    );
  }
}
