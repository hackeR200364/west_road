import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:west_road/values.dart';

class DemandHeading extends StatelessWidget {
  const DemandHeading({
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
            Icons.description,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Demand List',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
