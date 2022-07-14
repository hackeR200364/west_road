import 'package:flutter/cupertino.dart';
import 'package:west_road/pages/supportPage.dart';

class SupportMyTicket extends StatelessWidget {
  const SupportMyTicket({
    Key? key,
    required this.isSelectedConsideration,
  }) : super(key: key);

  final bool isSelectedConsideration;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isSelectedConsideration,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SupportPage(),
          ],
        ),
      ),
    );
  }
}
