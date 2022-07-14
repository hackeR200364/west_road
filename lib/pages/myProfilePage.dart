import 'package:flutter/material.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/customerDetailsHead.dart';
import 'package:intl/intl.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late TextEditingController _date;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _date = TextEditingController();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _date.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerdetailsHead(),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                profile(
                  label: 'Name',
                  text: 'Mahmudul Amit',
                  icon: Icons.edit,
                  index: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    'DOB',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 13, right: 10),
                  child: TextFormField(
                    onTap: (() async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                        });
                      }
                    }),
                    controller: _date,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      border: InputBorder.none,
                      hintText: '11/01/22',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset('images/border.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: profile(
                    index: 1,
                    label: 'Gender',
                    text: 'Male',
                    icon: Icons.edit,
                  ),
                ),
                profile(
                  index: 2,
                  label: 'PIN',
                  text: '******',
                  icon: Icons.edit,
                ),
              ],
            )),
      ],
    );
  }
}

class profile extends StatefulWidget {
  profile({
    required this.label,
    required this.text,
    required this.icon,
    required this.index,
  });

  final String label;
  final String text;
  final IconData icon;
  final int index;

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late TextEditingController _controller;
  String name = '';

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 5, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.text),
                IconButton(
                  splashRadius: 20,
                  icon: Icon(widget.icon),
                  onPressed: (() async {
                    //   if (widget.index == 0) {
                    //     final nameTemp = await NameChange(context: context);
                    //     if (nameTemp != null) {
                    //       print(nameTemp);
                    //     }
                    //     // setState(() => name = nameTemp);
                    //   }
                    //   if (widget.index == 1) {
                    //     GenderChange(context: context);
                    //   }
                    //   if (widget.index == 2) {
                    //     PINChange(context: context);
                    //   }
                  }),
                ),
              ],
            ),
          ),
          Image.asset('images/border.png'),
        ],
      ),
    );
  }

  Future<String?> NameChange({required BuildContext context}) =>
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Your name:',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          content: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: ('Enter your new name'),
            ),
          ),
          actions: [
            TextButton(
                onPressed: (() {
                  Navigator.pop(context, _controller.text);
                }),
                child: Text(
                  'SAVE',
                  style: TextStyle(color: AppColors.btnColor),
                ))
          ],
        ),
      );

  Future GenderChange({required BuildContext context}) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Your Gender:',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          content: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: ('Enter your gender'),
            ),
          ),
          actions: [
            TextButton(
                onPressed: (() {}),
                child: Text(
                  'SAVE',
                  style: TextStyle(color: AppColors.btnColor),
                ))
          ],
        ),
      );

  Future PINChange({required BuildContext context}) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Your PIN:',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          content: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: ('Enter your new PIN'),
            ),
          ),
          actions: [
            TextButton(
                onPressed: (() {}),
                child: Text(
                  'SAVE',
                  style: TextStyle(color: AppColors.btnColor),
                ))
          ],
        ),
      );
}
