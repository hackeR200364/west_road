import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:west_road/values.dart';

class RaiseTicketUploadedFile extends StatelessWidget {
  const RaiseTicketUploadedFile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.field,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: AppColors.btnColor,
                    child: Icon(
                      Icons.photo,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('kitchen.jpg'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.clear),
                  Icon(Icons.refresh),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
