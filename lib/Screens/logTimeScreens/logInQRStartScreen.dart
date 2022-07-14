import 'package:flutter/material.dart';
import 'package:west_road/Screens/logTimeScreens/qrScanScreen.dart';
import 'package:west_road/values.dart';

class LoginQRStartScreen extends StatefulWidget {
  @override
  State<LoginQRStartScreen> createState() => _LoginQRStartScreenState();
}

class _LoginQRStartScreenState extends State<LoginQRStartScreen> {
  String loginDetails = '';
  // DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.btnColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(loginDetails),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                child: Text('Login QR Scanner'),
              ),
              RaisedButton(
                onPressed: (() async {
                  final newValue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRScanScreen(),
                    ),
                  );
                  setState(() {
                    loginDetails = newValue;
                  });
                }),
                child: Text('Start Scan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
