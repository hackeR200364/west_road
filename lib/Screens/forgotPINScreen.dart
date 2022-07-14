import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:west_road/Screens/successScreen.dart';
import 'package:west_road/values.dart';

class ForgorPINScreen extends StatefulWidget {
  const ForgorPINScreen({Key? key}) : super(key: key);

  @override
  State<ForgorPINScreen> createState() => _ForgorPINScreenState();
}

class _ForgorPINScreenState extends State<ForgorPINScreen> {
  bool value = false;
  var hColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Image.asset('images/download 1.png'),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.btnColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Forget PIN',
                          style: TextStyle(
                            color: hColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              CupertinoIcons.person_solid,
                              color: hColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Customer ID',
                                style: TextStyle(
                                  color: hColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                            padding:
                                EdgeInsets.only(left: 25, right: 25, top: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: hColor,
                            ),
                            child: TextFormField(
                              onChanged: ((value) {}),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username21',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.apartment,
                              color: hColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Unit Name',
                                style: TextStyle(
                                  color: hColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                            padding:
                                EdgeInsets.only(left: 25, right: 25, top: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              onChanged: ((value) {}),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'E42/7',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              CupertinoIcons.phone_fill,
                              color: hColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Registered Phone No.',
                                style: TextStyle(
                                  color: hColor,
                                ),
                              ),
                            ),
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
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            onChanged: ((value) {}),
                            decoration: InputDecoration(
                              prefixIcon: CountryCodePicker(
                                // onChanged: print,
                                initialSelection: 'IN',
                                enabled: true,
                                showFlagMain: false,
                              ),
                              border: InputBorder.none,
                              hintText: '0000000000',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.5,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: (() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PINSuccessScreen(),
                              ),
                            );
                          }),
                          child: Center(
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                letterSpacing: 2,
                                color: AppColors.btnColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
