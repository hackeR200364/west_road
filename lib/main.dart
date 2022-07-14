import 'package:flutter/material.dart';
import 'package:west_road/Screens/HomeScreen.dart';
import 'package:west_road/Screens/attendenceScreen.dart';
import 'package:west_road/Screens/logInScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Image.asset(
                'images/LoginBg.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.grey.withOpacity(0.4),
                  ],
                ),
              ),
            ),
            LogInScreen(),
          ],
        ),
      ),
    );
  }
}
