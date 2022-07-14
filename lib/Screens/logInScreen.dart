import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:west_road/Screens/HomeScreen.dart';
import 'package:west_road/Screens/forgotPINScreen.dart';
import 'package:west_road/models.dart';
import 'package:west_road/services/credentials.dart';
import 'package:west_road/testAPI.dart';
import 'package:west_road/values.dart';
import 'package:http/http.dart' as http;

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _PINController = TextEditingController();

  List<UserLogin> demoUser = [
    UserLogin(userName: 'userName', PIN: '2003'),
    UserLogin(userName: 'userName', PIN: '2004'),
    UserLogin(userName: 'userName', PIN: '2005'),
    UserLogin(userName: 'userName', PIN: '2006'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _PINController.dispose();
    _userNameController.dispose();
  }

  Future<void> sendRequest({
    required String customerID,
    required String PIN,
    required BuildContext context,
  }) async {
    var cstPIN = int.parse(PIN);
    Map<String, dynamic> body = {"customerId": customerID, "pin": cstPIN};
    final request =
        await http.post(Uri.parse(apiURL), body: body, headers: header);
    var response = jsonDecode(request.body);
    if (request.statusCode == 200) {
      if (response['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Success',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response['status'],
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'StatusCode: ${request.statusCode}\nUsrName: $customerID\nPIN : $PIN PINDataType : ${PIN.runtimeType}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 5,
              ),
              Image.asset('images/download 1.png'),
              SizedBox(
                height: MediaQuery.of(context).size.width / 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person),
                          Text('Customer ID'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username21',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.lock_fill),
                          Text('Enter PIN'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 25, right: 25, top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: PinCodeTextField(
                          cursorColor: AppColors.btnColor,
                          controller: _PINController,
                          length: 4,
                          appContext: context,
                          onChanged: (String value) {},
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() async {
                        if (_userNameController.text.isNotEmpty ||
                            _PINController.text.isNotEmpty) {
                          sendRequest(
                              customerID: _userNameController.text,
                              PIN: _PINController.text,
                              context: context);
                          String tempUserName = '';
                          String tempPIN = '';
                          print(tempPIN);
                          // if (_userNameController.text == tempUserName &&
                          //     _PINController.text == tempPIN) {
                          //   Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const HomeScreen(),
                          //     ),
                          //   );
                          // } else if (_userNameController.text != tempUserName ||
                          //     _PINController.text != tempPIN) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       backgroundColor: AppColors.btnColor,
                          //       content: Text(
                          //         'Your Username and PIN is incorrect. Try again!',
                          //       ),
                          //     ),
                          //   );
                          // }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter your Username and PIN',
                              ),
                            ),
                          );
                        }
                      }),
                      child: Hero(
                        tag: 'submit',
                        child: Container(
                          margin: EdgeInsets.only(top: 35, left: 10, right: 10),
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.btnColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgorPINScreen(),
                          ),
                        );
                      }),
                      child: Text(
                        'Forget PIN ?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          shadows: [
                            Shadow(
                              color: AppColors.field,
                              blurRadius: 6,
                            ),
                            Shadow(
                              color: AppColors.field,
                              blurRadius: 6,
                            ),
                            Shadow(
                              color: AppColors.field,
                              blurRadius: 6,
                            ),
                            Shadow(
                              color: AppColors.field,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
