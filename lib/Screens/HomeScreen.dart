import 'package:flutter/material.dart';
import 'package:west_road/pages/HomePage.dart';
import 'package:west_road/pages/applicationPage.dart';
import 'package:west_road/pages/cUpdatesPage.dart';
import 'package:west_road/pages/demandPage.dart';
import 'package:west_road/pages/giftCoupons.dart';
import 'package:west_road/pages/myProfilePage.dart';
import 'package:west_road/pages/paymentPage.dart';
import 'package:west_road/pages/supportPage.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int? index;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.btnColor),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('images/download 1.png'),
        actions: [
          Avatar.small(),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.btnColor,
        child: ListView(
          children: [
            ListTile(
              onTap: (() {
                Navigator.pop(context);
              }),
              trailing: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            menuItem(
              index: 0,
              icon: Icons.home_filled,
              text: 'HOME',
              onTap: (() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              }),
            ),
            menuItem(
              index: 1,
              icon: Icons.person,
              text: 'My Profile',
              onTap: (() => selectedItem(context, 1)),
            ),
            menuItem(
              index: 2,
              onTap: (() => selectedItem(context, 2)),
              icon: Icons.sticky_note_2,
              text: 'Application',
            ),
            menuItem(
              index: 3,
              icon: Icons.description,
              text: 'Demands',
              onTap: (() => selectedItem(context, 3)),
            ),
            menuItem(
              index: 4,
              onTap: (() => selectedItem(context, 4)),
              icon: Icons.currency_rupee_rounded,
              text: 'Payment',
            ),
            menuItem(
              index: 5,
              onTap: (() => selectedItem(context, 5)),
              icon: Icons.local_activity,
              text: 'Gift Coupons',
            ),
            menuItem(
              index: 6,
              onTap: (() => selectedItem(context, 6)),
              icon: Icons.construction,
              text: 'Construction Updates',
            ),
            menuItem(
              index: 7,
              onTap: (() => selectedItem(context, 7)),
              icon: Icons.support_agent,
              text: 'Support',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            HomePage(),
          ],
        ),
      ),
    );
  }
}

class menuItem extends StatelessWidget {
  menuItem({
    required this.text,
    required this.icon,
    required this.onTap,
    required this.index,
  });

  final IconData icon;
  final text;
  final VoidCallback onTap;
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationFormPage(index: 1),
        ),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationFormPage(index: 2),
        ),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationFormPage(index: 3),
        ),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(),
        ),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GiftCouponsPage(),
        ),
      );
      break;
    case 6:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationFormPage(index: 6),
        ),
      );
      break;
    case 7:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationFormPage(index: 7),
        ),
      );
      break;
  }
}
