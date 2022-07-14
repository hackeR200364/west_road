import 'package:flutter/material.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/avatar.dart';
import 'package:west_road/widgets/bttmSocio.dart';

class IndividualDemand extends StatelessWidget {
  const IndividualDemand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.btnColor,
            ),
            onPressed: (() {
              Navigator.pop(context);
            }),
          ),
          actions: [
            Avatar.small(
              onTap: (() {}),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DemandContainer(
                  label1: 'Demand ID',
                  label2: '5206',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'Demand Amount',
                  label2: '5206',
                  showIcon: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DemandContainer(
                      label1: 'Demand Date',
                      label2: '5206',
                      showIcon: true,
                    ),
                    DemandContainer(
                      label1: 'Due Date',
                      label2: '5206',
                      showIcon: true,
                    ),
                  ],
                ),
                DemandContainer(
                  label1: 'Demand Type',
                  label2: '5206',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'Description',
                  label2: 'This is a description',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'Sale Team',
                  label2: '5206',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'GST',
                  label2: '5206',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'Payment Amount',
                  label2: '5206',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'GST',
                  label2: '5206',
                  showIcon: false,
                ),
                DemandContainer(
                  label1: 'Amount Pending',
                  label2: '5206',
                  showIcon: false,
                ),
                socioContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DemandContainer extends StatelessWidget {
  DemandContainer({
    required this.label1,
    required this.label2,
    required this.showIcon,
  });

  String label1;
  String label2;
  bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label1),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.field,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(label2),
              ),
              SizedBox(
                width: 15,
              ),
              (showIcon == true) ? Icon(Icons.calendar_month) : Text(''),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
