// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'BuyNow.dart';
// import 'Home.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     checkFirstLaunch();
//   }
//
//   void checkFirstLaunch() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
//
//     await Future.delayed(Duration(seconds: 3)); // Simulate splash delay
//
//     if (isFirstLaunch) {
//       prefs.setBool('isFirstLaunch', false);
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => BuyNowPage()));
//     } else {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomeScreen()));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset("images/logo.jpg", width: 150), // Change your logo
//       ),
//     );
//   }
// }
