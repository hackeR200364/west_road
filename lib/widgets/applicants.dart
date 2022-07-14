import 'package:flutter/material.dart';
import 'package:west_road/values.dart';
import 'package:west_road/widgets/bttmSocio.dart';

class ApplicantsAbout extends StatelessWidget {
  const ApplicantsAbout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Applicant ID',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.field,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      border: InputBorder.none,
                      hintText: 'WRA-1',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Applicant Type',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.field,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      border: InputBorder.none,
                      hintText: 'First Applicant',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Salutation',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.field,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        border: InputBorder.none,
                        hintText: 'Mr.',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.field,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        border: InputBorder.none,
                        hintText: 'Shek',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Middle Name',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.field,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      border: InputBorder.none,
                      hintText: 'Amir',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last Name',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: AppColors.field,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                      border: InputBorder.none,
                      hintText: 'Khan ',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spouse Name',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.field,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        border: InputBorder.none,
                        hintText: '5201',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Father's Name",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColors.field,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2),
                        border: InputBorder.none,
                        hintText: '5201',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ApplicatsAll extends StatelessWidget {
  List demoApplicants = [
    {
      'Name': 'Mr.Pranay Mukharji',
      'Post': 'Applicant',
      'Photo': 'images/demoPerson.jpg',
    },
    {
      'Name': 'Joyanta',
      'Post': 'Co Applicant 1',
      'Photo': 'images/demoPerson.jpg',
    },
    {
      'Name': 'Rupak Pal',
      'Post': 'Co Applicant 2',
      'Photo': 'images/demoPerson.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: GridView.builder(
        itemCount: demoApplicants.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => InkWell(
          onTap: (() {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              context: context,
              builder: (context) => SingleChildScrollView(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                      ),
                      color: AppColors.btnColor,
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Applicants',
                          style: TextStyle(
                            color: AppColors.btnColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Application ID'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('WRA-1'),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Application Type'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('First Applicant'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Saluation'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('Mr.'),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('First Name'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text('Pronoy'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Middle Name'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('Mukharji'),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Last Name'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('Khan'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Spouse Name'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('5201'),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Father's Name"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text('5201'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const socioContainer(),
                  ],
                ),
              ),
            );
          }),
          child: Container(
            padding: EdgeInsets.only(left: 8, right: 5),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.btmSocial,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 80,
                          width: 90,
                          child: Image.asset(
                            demoApplicants[index]['Photo'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          demoApplicants[index]['Post'],
                          style: const TextStyle(
                            color: AppColors.btnColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Center(
                        child: Text(
                          demoApplicants[index]['Name'],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
