import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:west_road/Screens/demandsIndividual.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/demandHeading.dart';

class DemandPage extends StatefulWidget {
  @override
  State<DemandPage> createState() => _DemandPageState();
}

class _DemandPageState extends State<DemandPage> {
  String? pay;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DemandHeading(),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton<String>(
                    borderRadius: BorderRadius.circular(20),
                    value: pay,
                    items: const [
                      DropdownMenuItem(
                        value: "Item 1",
                        child: Text(
                          'Item 1',
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Item 2",
                        child: Text(
                          'Item 2',
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Item 3",
                        child: Text(
                          'Item 3',
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Item 4",
                        child: Text(
                          'Item 4',
                        ),
                      ),
                    ],
                    onChanged: ((payment) {
                      setState(() {
                        pay = payment.toString();
                      });
                    }),
                  ),
                  Row(
                    children: [
                      Text('Unpaid'),
                      SizedBox(
                        width: 5,
                      ),
                      FlutterSwitch(
                        width: 50.0,
                        height: 20.0,
                        activeColor: AppColors.btnColor,
                        value: status,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Paid'),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 400,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: AppColors.status,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        splashColor: Colors.red[100],
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IndividualDemand(),
                            ),
                          );
                        }),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Due ID'),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    children: [
                                      Text('Demand Type'),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Demand Date'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: AppColors.btnColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Demand Amount'),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Amount due'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text('Due date'),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Payment Date'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DemandListContainer extends StatelessWidget {
  const DemandListContainer({
    Key? key,
    required this.index,
    required this.width,
    required this.label,
    required this.color,
  }) : super(key: key);

  final double width;
  final int index;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      margin: EdgeInsets.only(left: 10, bottom: 10),
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class DemandsContainer extends StatelessWidget {
  const DemandsContainer({
    required this.color,
    required this.label,
    required this.height,
    required this.width,
  });

  final String label;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     DemandsContainer(
//       label: 'Actions',
//       height: height,
//       width: 85,
//       color: AppColors.btnColor,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: 'Demand ID',
//       height: height,
//       width: 120,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: "Demand Generation Date",
//       height: height,
//       width: 200,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: "Due Date",
//       height: height,
//       width: 95,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: "Demand Type",
//       height: height,
//       width: 120,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: "Description",
//       height: height,
//       width: 120,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: "Amount",
//       height: height,
//       width: 120,
//     ),
//     DemandsContainer(
//       color: AppColors.btnColor,
//       label: "Paid",
//       height: height,
//       width: 120,
//     ),
//   ],
// ),
// Container(
//   margin: EdgeInsets.only(top: 20),
//   width: MediaQuery.of(context).size.height * 1.62,
//   height: 500,
//   child: ListView.builder(
//     itemCount: demoDemands.length,
//     itemBuilder: (context, index) {
//       return Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             DemandListContainer(
//               width: 85,
//               index: index,
//               label: demoDemands[index]["actions"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 120,
//               label: demoDemands[index]["demandID"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 200,
//               label: demoDemands[index]["demandGenDate"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 95,
//               label: demoDemands[index]["dueDate"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 120,
//               label: demoDemands[index]["demandType"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 120,
//               label: demoDemands[index]["description"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 120,
//               label: demoDemands[index]["amount"],
//               color: AppColors.status,
//             ),
//             DemandListContainer(
//               index: index,
//               width: 120,
//               label: demoDemands[index]["paid"],
//               color: AppColors.status,
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// )

// List demoDemands = [
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
//   {
//     "actions": "Lorem ipsum dyngs",
//     "demandID": "092382937239",
//     "demandGenDate": "01 January, 2022",
//     "dueDate": "01 February, 2022",
//     "demandType": "Complain",
//     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing",
//     "amount": "71238,9213",
//     "paid": "71238,9213",
//   },
// ];
