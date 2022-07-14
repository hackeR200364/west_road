import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values.dart';

class RaiseTicketTabbar extends StatefulWidget {
  const RaiseTicketTabbar({Key? key}) : super(key: key);

  @override
  State<RaiseTicketTabbar> createState() => _RaiseTicketTabbarState();
}

class _RaiseTicketTabbarState extends State<RaiseTicketTabbar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabController = TabController(length: 2, vsync: this);
    final TextEditingController _commentController = TextEditingController();

    return Column(
      children: [
        Container(
          height: 30,
          margin: EdgeInsets.only(
            bottom: 15,
            top: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.btnColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.btnColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.btnColor,
            ),
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(
                child: Text(
                  'Details',
                ),
              ),
              Tab(
                child: Text(
                  'Comment',
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'Ticket Type'),
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'Ticket Date'),
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(labelText: 'Category'),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'Sub category'),
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: TextField(
                            decoration:
                                InputDecoration(labelText: 'Assignee Name'),
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Status'),
                          ),
                          width: MediaQuery.of(context).size.width / 2.5,
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.field,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            'Photo',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1,
                          height: 150,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: AppColors.field,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Image.asset(
                                  'images/avatar.png',
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('Upload'),
                                decoration: BoxDecoration(
                                  color: AppColors.btnColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.field,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _commentController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Add comment',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          color: AppColors.btnColor,
                          onPressed: (() {
                            _commentController.clear();
                          }),
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: AppColors.status,
                            ),
                          ),
                        ),
                        RaisedButton(
                          color: AppColors.btnColor,
                          onPressed: (() {}),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: AppColors.status,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.btmSocial,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          scrollbarTheme: ScrollbarThemeData(
                            thumbColor:
                                MaterialStateProperty.all(AppColors.btnColor),
                          ),
                        ),
                        child: Scrollbar(
                          radius: Radius.circular(6),
                          isAlwaysShown: true,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Date'),
                                        Text('Commented by'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text('It\'s a comment!'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
