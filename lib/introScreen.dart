// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:testapps/Home.dart';
// import 'package:testapps/SignInPage.dart';
//
// class IntroScreen extends StatefulWidget {
//   const IntroScreen({super.key});
//
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   final PageController _pageController = PageController();
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         children: [
//           buildPage("Welcome", "Explore amazing features!", "images/logo.jpg"),
//           buildPage("Shop Easily", "Find what you need quickly!", "images/logo.jpg"),
//           buildPage("Fast Delivery", "Get items at your doorstep!", "images/logo.jpg"),
//         ],
//       ),
//       bottomSheet: currentIndex == 2
//           ? TextButton(
//         onPressed: () async {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.setBool('isFirstLaunch', false);
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => HomeScreen()));
//         },
//         child: Text("Get Started", style: TextStyle(fontSize: 18)),
//       )
//           : Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           TextButton(
//             onPressed: () => _pageController.jumpToPage(2),
//             child: Text("Skip"),
//           ),
//           Row(
//             children: List.generate(3, (index) {
//               return Container(
//                 margin: EdgeInsets.all(4),
//                 width: currentIndex == index ? 12 : 8,
//                 height: 8,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: currentIndex == index ? Colors.blue : Colors.grey,
//                 ),
//               );
//             }),
//           ),
//           TextButton(
//             onPressed: () => _pageController.nextPage(
//                 duration: Duration(milliseconds: 500), curve: Curves.ease),
//             child: Text("Next"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildPage(String title, String subtitle, String imgPath) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(imgPath, width: 250),
//         SizedBox(height: 20),
//         Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
//       ],
//     );
//   }
// }
