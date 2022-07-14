import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:west_road/values.dart';

class CustomerdetailsHead extends StatelessWidget {
  const CustomerdetailsHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      color: AppColors.btnColor,
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Customer Details',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
