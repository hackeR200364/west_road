import 'package:flutter/material.dart';
import 'package:west_road/Screens/logTimeScreens/qrScanLogoutScreen.dart';
import 'package:west_road/Screens/logTimeScreens/qrScanScreen.dart';
import 'package:west_road/values.dart';

class LogoutQRStartScreen extends StatefulWidget {
  const LogoutQRStartScreen({Key? key}) : super(key: key);

  @override
  State<LogoutQRStartScreen> createState() => _LogoutQRStartScreenState();
}

class _LogoutQRStartScreenState extends State<LogoutQRStartScreen> {
  String logOutDetails = '';

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
              Text(logOutDetails),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                child: Text('Logout QR Scanner'),
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
                    logOutDetails = newValue;
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
