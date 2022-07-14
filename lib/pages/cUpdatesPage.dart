import 'package:flutter/material.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/constructionHead.dart';

class CUpdatesPage extends StatefulWidget {
  const CUpdatesPage({Key? key}) : super(key: key);

  @override
  State<CUpdatesPage> createState() => _CUpdatesPageState();
}

class _CUpdatesPageState extends State<CUpdatesPage>
    with TickerProviderStateMixin {
  final ScrollController _gridContainerController = ScrollController();
  final ScrollController _scrollController = ScrollController();
  List milestone = [
    {
      "photo": "images/milestone/M1.png",
      "title": "Compartment",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      "photo": "images/milestone/M2.png",
      "title": "Basement",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      "photo": "images/milestone/M3.png",
      "title": "Lobby",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
    {
      "photo": "images/milestone/M4.png",
      "title": "Garage",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    },
  ];

  @override
  void init() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _gridContainerController.debugLabel;
    _scrollController.debugLabel;
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Column(
      children: [
        const ConstructionHeading(),
        Container(
          height: 30,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
            bottom: 5,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.btnColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
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
                  'Milestone Photo',
                ),
              ),
              Tab(
                child: Text(
                  'Flat/Unit Photo',
                ),
              ),
              Tab(
                child: Text(
                  'Project',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          width: MediaQuery.of(context).size.width,
          height: 260,
          child: TabBarView(
            controller: _tabController,
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(AppColors.status),
                  ),
                ),
                child: Scrollbar(
                  controller: _scrollController,
                  child: GridView.builder(
                    itemCount: milestone.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.width / 2,
                      width: 100,
                      child: Scrollbar(
                        controller: _gridContainerController,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.field,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Image.asset(
                                      milestone[index]["photo"],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 7, bottom: 5, left: 15),
                                child: Text(
                                  milestone[index]['title'],
                                  style: TextStyle(
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, left: 15),
                                child: Text(
                                  milestone[index]['description'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(AppColors.status),
                  ),
                ),
                child: Scrollbar(
                  controller: _scrollController,
                  child: GridView.builder(
                    itemCount: milestone.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.width / 2,
                      width: 100,
                      child: Scrollbar(
                        controller: _gridContainerController,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.field,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Image.asset(
                                      milestone[index]["photo"],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 7, bottom: 5, left: 15),
                                child: Text(
                                  milestone[index]['title'],
                                  style: TextStyle(
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, left: 15),
                                child: Text(
                                  milestone[index]['description'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(AppColors.status),
                  ),
                ),
                child: Scrollbar(
                  controller: _scrollController,
                  child: GridView.builder(
                    itemCount: milestone.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.width / 2,
                      width: 100,
                      child: Scrollbar(
                        controller: _gridContainerController,
                        isAlwaysShown: true,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.field,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Image.asset(
                                      milestone[index]["photo"],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 7, bottom: 5, left: 15),
                                child: Text(
                                  milestone[index]['title'],
                                  style: TextStyle(
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10, left: 15),
                                child: Text(
                                  milestone[index]['description'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
