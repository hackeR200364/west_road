import 'package:flutter/material.dart';
import 'package:west_road/values.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    return Column(
      children: [
        Container(
          height: 30,
          margin: EdgeInsets.only(
            bottom: 5,
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
                  'Open Ticket',
                ),
              ),
              Tab(
                child: Text(
                  'Close Ticket',
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
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                      thumbColor: MaterialStateProperty.all(AppColors.btnColor),
                    ),
                  ),
                  child: Scrollbar(
                    radius: Radius.circular(6),
                    isAlwaysShown: true,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.status,
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                cardSubContainer(
                                  label1: 'Ticket ID',
                                  label2: 'ID',
                                ),
                                cardSubContainer(
                                  label1: 'Created Date',
                                  label2: 'Date',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                cardSubContainer(
                                  label1: 'Category',
                                  label2: '....',
                                ),
                                cardSubContainer(
                                  label1: 'Sub Category',
                                  label2: '....',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: cardSubContainer(
                                label1: 'Description',
                                label2: 'This is a description.',
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                cardSubContainer(
                                  label1: 'Ticket ID',
                                  label2: 'ID',
                                ),
                                cardSubContainer(
                                  label1: 'Last Update',
                                  label2: 'Date',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    scrollbarTheme: ScrollbarThemeData(
                      thumbColor: MaterialStateProperty.all(AppColors.btnColor),
                    ),
                  ),
                  child: Scrollbar(
                    radius: Radius.circular(6),
                    isAlwaysShown: true,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.status,
                        ),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                cardSubContainer(
                                  label1: 'Ticket ID',
                                  label2: 'ID',
                                ),
                                cardSubContainer(
                                  label1: 'Created Date',
                                  label2: 'Date',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                cardSubContainer(
                                  label1: 'Category',
                                  label2: '....',
                                ),
                                cardSubContainer(
                                  label1: 'Sub Category',
                                  label2: '....',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: cardSubContainer(
                                label1: 'Description',
                                label2: 'This is a description.',
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                cardSubContainer(
                                  label1: 'Ticket ID',
                                  label2: 'ID',
                                ),
                                cardSubContainer(
                                  label1: 'Last Update',
                                  label2: 'Date',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class cardSubContainer extends StatelessWidget {
  cardSubContainer({
    required this.label1,
    required this.label2,
  });

  String label1;
  String label2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label1),
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label2),
        ),
      ],
    );
  }
}
