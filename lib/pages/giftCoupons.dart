import 'package:flutter/material.dart';

class GiftCouponsPage extends StatelessWidget {
  const GiftCouponsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('GiftCouponsPage'),
        ),
      ),
    );
  }
}
