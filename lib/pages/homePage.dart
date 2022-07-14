import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/avatar.dart';
import 'package:west_road/widgets/bttmSocio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List urlImages = [
      'images/homePageImages/h1.png',
      'images/homePageImages/h2.png',
      'images/homePageImages/h3.png',
      'images/homePageImages/h4.png',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.status,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Welcome Mr. Ajay Kumar\nWestRoadHeights Flat WH-4-F',
              style: TextStyle(
                color: AppColors.btnColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    enableInfiniteScroll: false,
                    // viewportFraction: 1,
                    height: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // InkWell(
                    //   onTap: (() {}),
                    //   child: Container(
                    //     height: 40,
                    //     width: 40,
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey.withOpacity(0.5),
                    //     ),
                    //     child: const Icon(
                    //       Icons.arrow_back_ios_new,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: urlImages.length,
                      effect: const SlideEffect(
                        activeDotColor: AppColors.btnColor,
                        dotWidth: 10,
                        dotHeight: 10,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: (() {
                    //     controller.nextPage();
                    //   }),
                    //   child: Container(
                    //     height: 40,
                    //     width: 40,
                    //     decoration: BoxDecoration(
                    //       color: Colors.grey.withOpacity(0.5),
                    //     ),
                    //     child: const Icon(
                    //       Icons.arrow_forward_ios,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.currency_rupee),
                          SizedBox(
                            width: 3,
                          ),
                          Text('1.46 Lakhs'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Unpaid'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            '14',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Total'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.currency_rupee),
                          SizedBox(
                            width: 3,
                          ),
                          Text('1.46 Lakhs'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Unpaid'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            '14',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Total'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.btmSocial,
            ),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 150,
                    width: double.infinity,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 1.3,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.status,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Catagory'),
                                    Text('Date'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'This is the notification',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 15, left: 20, right: 20),
                    child: RaisedButton(
                      elevation: 5,
                      onPressed: (() {}),
                      color: AppColors.btnColor,
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AppColors.btmSocial,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text(
                    'Tickets',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      elevation: 5,
                      onPressed: (() {}),
                      color: AppColors.btnColor,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Open',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      elevation: 5,
                      onPressed: (() {}),
                      color: AppColors.btnColor,
                      child: const Text(
                        'Create new',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const socioContainer(),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        color: Colors.grey,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
