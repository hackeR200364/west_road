import 'package:flutter/material.dart';
import 'package:west_road/Screens/logTimeScreens/logInQRStartScreen.dart';
import 'package:west_road/Screens/logTimeScreens/logOutQRStartScreen.dart';
import 'package:west_road/values.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({Key? key}) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  DateTime now = DateTime.now();
  String loggedInTime = "";
  String loggedOutTime = "";
  int time = 0;

  // void loginTimeChanged() {
  //
  // }

  // Future logoutTimeChanged() async => ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.btnColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginQRStartScreen(),
                    ),
                  );
                }),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.btnColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogoutQRStartScreen(),
                    ),
                  );
                }),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: AppColors.btnColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
