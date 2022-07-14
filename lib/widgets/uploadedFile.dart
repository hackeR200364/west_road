import 'package:flutter/material.dart';
import 'package:west_road/values.dart';

class UploadedFiles extends StatelessWidget {
  UploadedFiles({required this.label, required this.status});

  String label;
  String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(6),
      ),
      width: MediaQuery.of(context).size.width / 2.5,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.field,
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: AppColors.btnColor,
              child: Center(
                child: Text('jpg'),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.btnColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
