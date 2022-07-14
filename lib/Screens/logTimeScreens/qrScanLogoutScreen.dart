import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:west_road/values.dart';

class QRScanScreenLogout extends StatefulWidget {
  const QRScanScreenLogout({Key? key}) : super(key: key);

  @override
  State<QRScanScreenLogout> createState() => _QRScanScreenLogoutState();
}

class _QRScanScreenLogoutState extends State<QRScanScreenLogout> {
  bool isLoading = false;
  var position;
  DateTime now = DateTime.now();
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: 'QR');
  late List<Placemark> placemark;

  QRViewController? controller;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
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

  Future<void> GetAddressFromLatLong(Position pos) async {
    placemark = await placemarkFromCoordinates(pos.latitude, pos.longitude);
  }

  // getCurrentAddressFromCoordinates(Coordinates coordinates) async {var addresses = await }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Alert!'),
            content: Text('Do you want to exit ?'),
            actions: [
              ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pop(false);
                }),
                child: Text('No'),
              ),
              ElevatedButton(
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
              bottom: 10,
              child: RaisedButton(
                child: isLoading ? CircularProgressIndicator() : Text('Scan'),
                onPressed: () async {
                  if (barcode != null) {
                    setState(() {
                      isLoading = true;
                    });
                    // await GetAddressFromLatLong(position);
                    position = await _determinePosition();
                    Navigator.of(context).pop(
                        "LogIn time : ${now.hour}:${now.minute}:${now.second}\n"
                        "QR value : ${barcode!.code}\n"
                        "Longitude : ${position.longitude}\n"
                        "Latitude : ${position.latitude}"
                        // "Location : ${placemark}",
                        );
                    // .pop("${now.hour}:${now.minute}:${now.second}");
                  } else {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      text: 'No QR found',
                    );
                  }
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
