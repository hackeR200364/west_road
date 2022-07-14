import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:west_road/values.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({Key? key}) : super(key: key);

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  TextEditingController usrNameController = TextEditingController();
  bool isLoading = false;
  var position;
  DateTime now = DateTime.now();
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: 'QR');
  String? imeiNumber;
  bool isExist = false;

  List demoUsers = [
    {
      "UserName": "Rupam",
      "IMEI": "865513035821038",
    },
    {
      "UserName": "Arijit",
      "IMEI": "865513035821030",
    },
  ];

  QRViewController? controller;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
    usrNameController.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission are permanently denied.');
    }
    return await Geolocator.getCurrentPosition();
  }

  var userDistance;
  double ofcLat = 22.73388533451694; //near me lat
  double ofcLong = 88.46852946136711;

  late double distanceInMeter;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Alert!'),
            content: const Text('Do you want to exit ?'),
            actions: [
              RaisedButton(
                color: AppColors.btnColor,
                onPressed: (() {
                  Navigator.of(context).pop(false);
                }),
                child: Text('No'),
              ),
              RaisedButton(
                color: AppColors.btnColor,
                onPressed: (() {
                  Navigator.of(context).pop(true);
                }),
                child: Text('Exit'),
              ),
            ],
          ),
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQRScan(context),
            Positioned(
              // top: MediaQuery.of(context).size.width / 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.field,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: usrNameController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 4,
              child: RaisedButton(
                child: isLoading
                    ? CircularProgressIndicator(
                        backgroundColor: AppColors.btnColor,
                      )
                    : Text('Scan'),
                onPressed: () async {
                  if (barcode != null) {
                    if (usrNameController.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });
                      position = await _determinePosition();
                      distanceInMeter = Geolocator.distanceBetween(
                        position.latitude,
                        position.longitude,
                        ofcLat,
                        ofcLong,
                      );
                      var statusPhone = await Permission.phone.status;
                      var statusCamera = await Permission.camera.status;
                      var statusLocation = await Permission.location.status;
                      if (statusLocation.isDenied) {
                        await Permission.location.request();
                      }
                      if (statusCamera.isDenied) {
                        await Permission.camera.request();
                      }
                      if (statusPhone.isDenied) {
                        await Permission.phone.request();
                      }

                      if (distanceInMeter <= 500) {
                        imeiNumber = await DeviceInformation.deviceIMEINumber;
                        for (int i = 0; i < demoUsers.length + 1; i++) {
                          if (demoUsers[i]['IMEI'] == imeiNumber &&
                              demoUsers[i]['UserName'] ==
                                  usrNameController.text) {
                            isExist = true;
                          }
                          break;
                        }
                        if (isExist == true) {
                          Navigator.of(context).pop(
                            "LogIn time : ${now.hour}:${now.minute}:${now.second}\n"
                            "QR value : ${barcode!.code}\n"
                            "Longitude : ${position.longitude}\n"
                            "Latitude : ${position.latitude}\n"
                            "Distance : ${distanceInMeter.toStringAsFixed(0)}",
                          );
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text:
                                'You are not registered\nPlease contact to your office',
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      } else {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          text:
                              'You are not in office,\nYou cannot give attendance',
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } else {
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.error,
                        text: 'Please enter your username',
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  } else {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'No QR found',
                    );
                    setState(() {
                      isLoading = false;
                    });
                  }
                  // else if (barcode == null &&
                  //     usrNameController.text.isNotEmpty) {
                  //   CoolAlert.show(
                  //     context: context,
                  //     type: CoolAlertType.error,
                  //     text: 'No QR found',
                  //   );
                  // } else if (barcode != null &&
                  //     usrNameController.text.isEmpty) {
                  //   CoolAlert.show(
                  //     context: context,
                  //     type: CoolAlertType.error,
                  //     text: 'Please enter your user name',
                  //   );
                  // } else if (barcode == null &&
                  //     usrNameController.text.isEmpty) {
                  //   CoolAlert.show(
                  //     context: context,
                  //     type: CoolAlertType.error,
                  //     text: 'No QR found\nPlease enter your username',
                  //   );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQRScan(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: AppColors.btnColor,
          borderRadius: 10,
          borderWidth: 5,
        ),
      );
  void onQRViewCreated(QRViewController qrViewController) {
    setState(() {
      controller = qrViewController;
    });
    qrViewController.scannedDataStream.listen((event) {
      setState(() {
        barcode = event;
      });
    });
  }
}
