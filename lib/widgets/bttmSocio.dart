import 'package:flutter/material.dart';
import 'package:west_road/values.dart';

class socioContainer extends StatelessWidget {
  const socioContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.btmSocial,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/download 1.png'),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/socio/fbIcon.png'),
                Image.asset('images/socio/instaIcon.png'),
                Image.asset('images/socio/copyRight.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
