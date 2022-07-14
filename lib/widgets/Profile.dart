import 'package:flutter/cupertino.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/avatar.dart';

class topProfile extends StatelessWidget {
  const topProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, Mahmudul Amit',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.btnColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'WH/7/C',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              width: 5,
              style: BorderStyle.solid,
              color: AppColors.btnColor,
            ),
          ),
          child: Avatar.large(),
        ),
      ],
    );
  }
}
