import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:west_road/pages/demandPage.dart';
import 'package:west_road/pages/myProfilePage.dart';
import 'package:west_road/pages/supportPage.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/ConsiderationPageWidgets.dart';
import 'package:west_road/widgets/Profile.dart';
import 'package:west_road/widgets/applicants.dart';
import 'package:west_road/widgets/applicationIdSec.dart';
import 'package:west_road/widgets/avatar.dart';
import 'package:west_road/widgets/bttmSocio.dart';
import 'package:west_road/widgets/docsHeading.dart';
import 'package:west_road/widgets/mapContainer.dart';
import 'package:west_road/widgets/supportMyTicketWidget.dart';
import 'package:west_road/widgets/tabbars.dart';
import 'package:west_road/widgets/uploadedFile.dart';

import '../widgets/UploadedFileWidget.dart';
import '../widgets/application_details.dart';
import 'cUpdatesPage.dart';

class ApplicationFormPage extends StatefulWidget {
  ApplicationFormPage({required this.index});

  int index;

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  String? value;
  String? issue;
  String? pay;
  TextEditingController _date = TextEditingController();
  int funded = 0;
  bool isSelectedDetails = false;
  bool isSelectedConsideration = false;
  bool isSelectedApplicants = false;
  bool isSelectedPayment = false;
  bool isSelectedDocuments = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
              color: Colors.grey,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 30,
                ),
                topProfile(),
                SizedBox(
                  height: 21,
                ),
                if (widget.index == 1) MyProfilePage(),
                if (widget.index == 2)
                  Column(
                    children: [
                      ApplicationIDSec(),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.status,
                        child: const Center(
                          child: Text(
                            'Status: Booking Initiated',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 35,
                            ),

                            // DETAILS SECTION
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  isSelectedDetails = !isSelectedDetails;
                                  isSelectedConsideration = false;
                                  isSelectedApplicants = false;
                                  isSelectedDocuments = false;
                                  isSelectedPayment = false;
                                });
                              }),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(24.5),
                                    right: Radius.circular(24.5),
                                  ),
                                  color: (isSelectedDetails == false)
                                      ? AppColors.field
                                      : AppColors.btnColor,
                                ),
                                child: applicationItem(
                                  icon: (isSelectedDetails == false)
                                      ? Icons.arrow_forward
                                      : Icons.arrow_back_outlined,
                                  label: 'Details',
                                  labelColor: (isSelectedDetails == false)
                                      ? Colors.black
                                      : Colors.white,
                                  iconColor: (isSelectedDetails == false)
                                      ? AppColors.btnColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isSelectedDetails,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 25,
                                  bottom: 15,
                                ),
                                child: const ApplicationDetails(),
                              ),
                            ),

                            // CONSIDER SECTION
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  isSelectedConsideration =
                                      !isSelectedConsideration;
                                  isSelectedDetails = false;
                                  isSelectedApplicants = false;
                                  isSelectedDocuments = false;
                                  isSelectedPayment = false;
                                });
                              }),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(24.5),
                                    right: Radius.circular(24.5),
                                  ),
                                  color: (isSelectedConsideration == false)
                                      ? AppColors.field
                                      : AppColors.btnColor,
                                ),
                                child: applicationItem(
                                  icon: (isSelectedConsideration == false)
                                      ? Icons.arrow_forward
                                      : Icons.arrow_back_outlined,
                                  label: 'Consideration',
                                  labelColor: (isSelectedConsideration == false)
                                      ? Colors.black
                                      : Colors.white,
                                  iconColor: (isSelectedConsideration == false)
                                      ? AppColors.btnColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isSelectedConsideration,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ConsiderFirstContainer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.directions_car,
                                              color: AppColors.btnColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Car Parking Cost',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.btnColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Card(
                                          elevation: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              left: 15,
                                              right: 15,
                                              bottom: 15,
                                            ),
                                            child: Column(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Car Parking Type',
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      child: DropdownButton(
                                                        value: value,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            this.value = value
                                                                .toString();
                                                          });
                                                        },
                                                        items: [
                                                          DropdownMenuItem(
                                                            child: Text(
                                                                'Car Parking Type'),
                                                            value:
                                                                "Car Parking Type",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Gross Price',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .field,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.6,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            2),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    '5201₹',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'GST',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .field,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.6,
                                                            child:
                                                                TextFormField(
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            2),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    '5201₹',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Car Parking Total',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              '28,287,9817₹',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const ConsiderOtherCharges(),
                                    const ConsiderOtherContainer(),
                                  ],
                                ),
                              ),
                            ),

                            // APPLICANTS SECTION
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  isSelectedApplicants = !isSelectedApplicants;
                                  isSelectedDetails = false;
                                  isSelectedConsideration = false;
                                  isSelectedDocuments = false;
                                  isSelectedPayment = false;
                                });
                              }),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(24.5),
                                    right: Radius.circular(24.5),
                                  ),
                                  color: (isSelectedApplicants == false)
                                      ? AppColors.field
                                      : AppColors.btnColor,
                                ),
                                child: applicationItem(
                                  icon: (isSelectedApplicants == false)
                                      ? Icons.arrow_forward
                                      : Icons.arrow_back_outlined,
                                  label: 'Applicants',
                                  labelColor: (isSelectedApplicants == false)
                                      ? Colors.black
                                      : Colors.white,
                                  iconColor: (isSelectedApplicants == false)
                                      ? AppColors.btnColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isSelectedApplicants,
                              child: ApplicatsAll(),
                            ),

                            // BOOKING PAYMENT SECTION
                            GestureDetector(
                              onTap: (() {
                                setState(() {
                                  isSelectedPayment = !isSelectedPayment;
                                  isSelectedDetails = false;
                                  isSelectedConsideration = false;
                                  isSelectedDocuments = false;
                                  isSelectedApplicants = false;
                                });
                              }),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(24.5),
                                    right: Radius.circular(24.5),
                                  ),
                                  color: (isSelectedPayment == false)
                                      ? AppColors.field
                                      : AppColors.btnColor,
                                ),
                                child: applicationItem(
                                  icon: (isSelectedPayment == false)
                                      ? Icons.arrow_forward
                                      : Icons.arrow_back_outlined,
                                  label: 'Booking Payment',
                                  labelColor: (isSelectedPayment == false)
                                      ? Colors.black
                                      : Colors.white,
                                  iconColor: (isSelectedPayment == false)
                                      ? AppColors.btnColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isSelectedPayment,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee_rounded,
                                                color: AppColors.btnColor,
                                              ),
                                              Text(
                                                'Payment Mode',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: AppColors.btnColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 5),
                                              child: DropdownButton<String>(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                value: pay,
                                                items: const [
                                                  DropdownMenuItem(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    value: "Cheque",
                                                    child: Text(
                                                      'Cheque',
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    value: "Demand Draft",
                                                    child: Text(
                                                      'Demand Draft',
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    value: "Cash",
                                                    child: Text(
                                                      'Cash',
                                                    ),
                                                  ),
                                                  DropdownMenuItem(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    value: "NEFT",
                                                    child: Text(
                                                      'NEFT',
                                                    ),
                                                  ),
                                                ],
                                                onChanged: ((payment) {
                                                  setState(() {
                                                    this.pay =
                                                        payment.toString();
                                                  });
                                                }),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (pay == 'Cheque')
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Cheque No.:',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'WRA-1',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Bank Name :',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'First Applicant',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Cheque Account No.:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              '98173981273',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      25,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Cheque Date :',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        onTap: (() async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(3000),
                                                          );
                                                          if (pickedDate !=
                                                              null) {
                                                            setState(() {
                                                              _date
                                                                  .text = DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        }),
                                                        controller: _date,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: '11/01/22',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Middle Name',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'Amir',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Last Name',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'Khan ',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Spouse Name',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: '5201',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Father's Name",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: '5201',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Funded By:'),
                                              Row(
                                                children: [
                                                  Radio(
                                                    activeColor:
                                                        AppColors.btnColor,
                                                    value: 0,
                                                    groupValue: funded,
                                                    onChanged: (fund) {
                                                      setState(() {
                                                        funded = fund as int;
                                                      });
                                                    },
                                                  ),
                                                  Text('Self'),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Radio(
                                                    activeColor:
                                                        AppColors.btnColor,
                                                    value: 1,
                                                    groupValue: funded,
                                                    onChanged: (fund) {
                                                      setState(() {
                                                        funded = fund as int;
                                                      });
                                                    },
                                                  ),
                                                  Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    if (pay == 'Demand Draft')
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Cheque No.:',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'WRA-1',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Bank Name :',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'First Applicant',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Cheque Account No.:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              '98173981273',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      25,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Cheque Date :',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        onTap: (() async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(3000),
                                                          );
                                                          if (pickedDate !=
                                                              null) {
                                                            setState(() {
                                                              _date
                                                                  .text = DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        }),
                                                        controller: _date,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: '11/01/22',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Amount',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '73462₹',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Issued By',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'Khan ',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Funded By:'),
                                              Row(
                                                children: [
                                                  Radio(
                                                    activeColor:
                                                        AppColors.btnColor,
                                                    value: 0,
                                                    groupValue: funded,
                                                    onChanged: (fund) {
                                                      setState(() {
                                                        funded = fund as int;
                                                      });
                                                    },
                                                  ),
                                                  Text('Self'),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Radio(
                                                    activeColor:
                                                        AppColors.btnColor,
                                                    value: 1,
                                                    groupValue: funded,
                                                    onChanged: (fund) {
                                                      setState(() {
                                                        funded = fund as int;
                                                      });
                                                    },
                                                  ),
                                                  Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    if (pay == 'Cash')
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Received Date:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        onTap: (() async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(3000),
                                                          );
                                                          if (pickedDate !=
                                                              null) {
                                                            setState(() {
                                                              _date
                                                                  .text = DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        }),
                                                        controller: _date,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: '11/01/22',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Received By :',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Mr. Dhoni',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Amount',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '73462₹',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('Funded By:'),
                                                Row(
                                                  children: [
                                                    Radio(
                                                      activeColor:
                                                          AppColors.btnColor,
                                                      value: 0,
                                                      groupValue: funded,
                                                      onChanged: (fund) {
                                                        setState(() {
                                                          funded = fund as int;
                                                        });
                                                      },
                                                    ),
                                                    Text('Self'),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Radio(
                                                      activeColor:
                                                          AppColors.btnColor,
                                                      value: 1,
                                                      groupValue: funded,
                                                      onChanged: (fund) {
                                                        setState(() {
                                                          funded = fund as int;
                                                        });
                                                      },
                                                    ),
                                                    Text('Other'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (pay == 'NEFT')
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Transaction Date:',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        onTap: (() async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(3000),
                                                          );
                                                          if (pickedDate !=
                                                              null) {
                                                            setState(() {
                                                              _date
                                                                  .text = DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        }),
                                                        controller: _date,
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: '11/01/22',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bank Name :',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.field,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2),
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'SBI',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Transaction\nAccount No.:',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.field,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                        child: TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2),
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                '1238712 128371',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Comments\n(NEFT/IMPS)',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              AppColors.field,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                        child: TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2),
                                                            border: InputBorder
                                                                .none,
                                                            hintText:
                                                                'First Applicant',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Amount',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.field,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    child: TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2),
                                                        border:
                                                            InputBorder.none,
                                                        hintText: '73462₹',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text('Funded By:'),
                                                Row(
                                                  children: [
                                                    Radio(
                                                      activeColor:
                                                          AppColors.btnColor,
                                                      value: 0,
                                                      groupValue: funded,
                                                      onChanged: (fund) {
                                                        setState(() {
                                                          funded = fund as int;
                                                        });
                                                      },
                                                    ),
                                                    Text('Self'),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Radio(
                                                      activeColor:
                                                          AppColors.btnColor,
                                                      value: 1,
                                                      groupValue: funded,
                                                      onChanged: (fund) {
                                                        setState(() {
                                                          funded = fund as int;
                                                        });
                                                      },
                                                    ),
                                                    Text('Other'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),

                            // DOCUMENTS SECTION
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (() {
                                    setState(() {
                                      isSelectedDocuments =
                                          !isSelectedDocuments;
                                      isSelectedPayment = !isSelectedPayment;
                                      isSelectedDetails = false;
                                      isSelectedConsideration = false;
                                      isSelectedPayment = false;
                                      isSelectedApplicants = false;
                                    });
                                  }),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(24.5),
                                        right: Radius.circular(24.5),
                                      ),
                                      color: (isSelectedDocuments == false)
                                          ? AppColors.field
                                          : AppColors.btnColor,
                                    ),
                                    child: applicationItem(
                                      icon: (isSelectedDocuments == false)
                                          ? Icons.arrow_forward
                                          : Icons.arrow_back_outlined,
                                      label: 'Documents',
                                      labelColor: (isSelectedDocuments == false)
                                          ? Colors.black
                                          : Colors.white,
                                      iconColor: (isSelectedDocuments == false)
                                          ? AppColors.btnColor
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: isSelectedDocuments,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: DocumentsHead(),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            AppFormNotGranted(),
                                            Text(
                                              'Provitional allotment letter',
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: ProvisionalAllotment(),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceAround,
                                              //   children: [
                                              //     DottedBorder(
                                              //       borderType:
                                              //           BorderType.RRect,
                                              //       child: ClipRRect(
                                              //         child: Container(
                                              //           decoration:
                                              //               BoxDecoration(
                                              //             color: AppColors
                                              //                 .field,
                                              //           ),
                                              //           height: 100,
                                              //           width: 100,
                                              //           child: Column(
                                              //             mainAxisAlignment:
                                              //                 MainAxisAlignment
                                              //                     .center,
                                              //             children: [
                                              //               Icon(
                                              //                 Icons
                                              //                     .add_photo_alternate,
                                              //                 size: 50,
                                              //                 color: AppColors
                                              //                     .btnColor,
                                              //               ),
                                              //               Text(
                                              //                   'Choose File'),
                                              //             ],
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //     Column(
                                              //       children: [
                                              //         Text(
                                              //             'Sales Agreement\nAppointment Date'),
                                              //         Container(
                                              //           margin: EdgeInsets
                                              //               .symmetric(
                                              //                   vertical:
                                              //                       15),
                                              //           padding: EdgeInsets
                                              //               .symmetric(
                                              //                   horizontal:
                                              //                       5),
                                              //           decoration:
                                              //               BoxDecoration(
                                              //             color: AppColors
                                              //                 .field,
                                              //             borderRadius:
                                              //                 BorderRadius
                                              //                     .circular(
                                              //                         6),
                                              //           ),
                                              //           width: MediaQuery.of(
                                              //                       context)
                                              //                   .size
                                              //                   .width /
                                              //               2.5,
                                              //           child:
                                              //               TextFormField(
                                              //             onTap: (() async {
                                              //               DateTime?
                                              //                   pickedDate =
                                              //                   await showDatePicker(
                                              //                 context:
                                              //                     context,
                                              //                 initialDate:
                                              //                     DateTime
                                              //                         .now(),
                                              //                 firstDate:
                                              //                     DateTime(
                                              //                         2000),
                                              //                 lastDate:
                                              //                     DateTime(
                                              //                         3000),
                                              //               );
                                              //               if (pickedDate !=
                                              //                   null) {
                                              //                 setState(() {
                                              //                   _date.text =
                                              //                       DateFormat(
                                              //                     'dd-MM-yyyy',
                                              //                   ).format(
                                              //                     pickedDate,
                                              //                   );
                                              //                 });
                                              //               }
                                              //             }),
                                              //             controller: _date,
                                              //             decoration:
                                              //                 InputDecoration(
                                              //               suffixIcon:
                                              //                   Icon(Icons
                                              //                       .calendar_month),
                                              //               border:
                                              //                   InputBorder
                                              //                       .none,
                                              //               hintText:
                                              //                   '11/01/22',
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ],
                                              //     )
                                              //   ],
                                              // ),
                                            ),
                                            CustomerAdhar(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                if (widget.index == 7)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),

                        // RAISE TICKET SECTION
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              isSelectedDetails = !isSelectedDetails;
                            });
                          }),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(24.5),
                                right: Radius.circular(24.5),
                              ),
                              color: (isSelectedDetails == false)
                                  ? AppColors.field
                                  : AppColors.btnColor,
                            ),
                            child: applicationItem(
                              icon: (isSelectedDetails == false)
                                  ? Icons.arrow_forward
                                  : Icons.arrow_back_outlined,
                              label: 'Raise Ticket',
                              labelColor: (isSelectedDetails == false)
                                  ? Colors.black
                                  : Colors.white,
                              iconColor: (isSelectedDetails == false)
                                  ? AppColors.btnColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isSelectedDetails,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Customer Name',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: AppColors.field,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 2),
                                            border: InputBorder.none,
                                            hintText: '5201',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ticket Type',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                          color: AppColors.field,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: DropdownButton(
                                          value: issue,
                                          onChanged: (value) {
                                            setState(() {
                                              this.issue = value.toString();
                                            });
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              child: Text('Issue'),
                                              value: "Issue",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Subject'),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 2),
                                          border: InputBorder.none,
                                          hintText: '5201',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Details'),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: TextFormField(
                                        maxLength: 5,
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          hintText: '5201',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Category',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          DottedBorder(
                                            borderType: BorderType.RRect,
                                            child: ClipRRect(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.field,
                                                ),
                                                height: 100,
                                                width: 150,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.add_photo_alternate,
                                                      size: 40,
                                                      color: AppColors.btnColor,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        'Upload an image from your phone'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child: Text(
                                        'Uploaded File',
                                        style: TextStyle(
                                          color: AppColors.btnColor,
                                        ),
                                      ),
                                    ),
                                    RaiseTicketUploadedFile(),
                                    RaisedButton(
                                      color: AppColors.btnColor,
                                      onPressed: (() {}),
                                      child: Center(
                                        child: Text(
                                          'Submit Ticket',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              isSelectedConsideration =
                                  !isSelectedConsideration;
                            });
                          }),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(24.5),
                                right: Radius.circular(24.5),
                              ),
                              color: (isSelectedConsideration == false)
                                  ? AppColors.field
                                  : AppColors.btnColor,
                            ),
                            child: applicationItem(
                              icon: (isSelectedConsideration == false)
                                  ? Icons.arrow_forward
                                  : Icons.arrow_back_outlined,
                              label: 'My Ticket',
                              labelColor: (isSelectedConsideration == false)
                                  ? Colors.black
                                  : Colors.white,
                              iconColor: (isSelectedConsideration == false)
                                  ? AppColors.btnColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                        SupportMyTicket(
                            isSelectedConsideration: isSelectedConsideration),

                        // CONTACT US SECTION
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              isSelectedApplicants = !isSelectedApplicants;
                            });
                          }),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(24.5),
                                right: Radius.circular(24.5),
                              ),
                              color: (isSelectedApplicants == false)
                                  ? AppColors.field
                                  : AppColors.btnColor,
                            ),
                            child: applicationItem(
                              label: 'Contact Us',
                              labelColor: (isSelectedApplicants == false)
                                  ? Colors.black
                                  : Colors.white,
                              iconColor: (isSelectedApplicants == false)
                                  ? AppColors.btnColor
                                  : Colors.white,
                              icon: (isSelectedApplicants == false)
                                  ? Icons.arrow_forward
                                  : Icons.arrow_back_outlined,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isSelectedApplicants,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MapContainer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.index == 6) CUpdatesPage(),
                if (widget.index == 3) DemandPage(),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 2.5,
            ),
            const socioContainer(),
          ],
        ),
      ),
    );
  }
}

class applicationItem extends StatelessWidget {
  const applicationItem(
      {required this.label,
      this.labelColor,
      this.iconColor,
      required this.icon});

  final String label;
  final Color? labelColor;
  final Color? iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: iconColor,
              ),
              SizedBox(
                width: 31,
              ),
              Text(
                label,
                style: TextStyle(
                  color: labelColor,
                ),
              ),
            ],
          ),
          Icon(
            icon,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
