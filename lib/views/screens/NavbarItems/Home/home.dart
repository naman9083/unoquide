import 'package:flutter/material.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/constants/constants.dart';
import 'package:unoquide/models/studentModel.dart';
import 'package:unoquide/utils/common/commonItems.dart';
import 'package:unoquide/views/screens/NavbarItems/Profile/notifications.dart';
import 'package:unoquide/views/screens/NavbarItems/Profile/statistics.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/subjectCourses.dart';

import '../../../../services/studentData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = 'Arnavi';
  String classs = '3A';
  String admissionNo = '3288';
  String picUrl = 'https://picsum.photos/250?image=9';
  String schoolName = 'School Name';
  List<Notifis> notifications = [];
  setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void initState() {
    super.initState();
    getTokenFromGlobal().then((value) {
      if (value != null) {
        getStudentData(value).then((value) {
          setStateIfMounted(() {
            name = value.firstName;
            classs = "${value.studentClass.grade}${value.studentClass.div}";
            admissionNo = value.admNo;
            picUrl = value.image.location;
            schoolName = value.schoolName;
            notifications = value.notifications;
          });
          putStudentToGlobal(student: value);

          // print(value);
        });
      }
    });
    getStudentFromGlobal().then((value) {
      setStateIfMounted(() {
        name = value.firstName;
        classs = "${value.studentClass.grade}${value.studentClass.div}";
        admissionNo = value.admNo;
        picUrl = value.image.location;
        schoolName = value.schoolName;

        notifications = value.notifications;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1;
    var height = MediaQuery.of(context).size.height / 1.25;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            schoolName,
            style: const TextStyle(
              color: blackColor,
              fontFamily: 'Raleway',
              fontWeight: bold,
              fontSize: 40,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Hello $name !",
                  style: const TextStyle(
                    color: blackColor,
                    fontFamily: 'Raleway',
                    fontWeight: bold,
                    fontSize: 40,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 230,
                    height: 70,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5CF),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Class: $classs\nAdmission No: $admissionNo",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: blackColor,
                          fontFamily: 'Raleway',
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: height * .3,
                width: width * .3,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F866),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Score 100',
                    style: TextStyle(
                      color: blackColor,
                      fontFamily: 'Raleway',
                      fontWeight: bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  picUrl,
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: const StatisticsContainer(
                  activity: 'Activites\nCompleted',
                  subject1: 'English',
                  subject2: 'Mathematics',
                  percentage1: 70,
                  percentage2: 80,
                ),
              ),
              Column(
                children: [
                  Container(
                    width: width * .30,
                    height: height * .14,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5CF),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Top Subjects',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: blackColor,
                            fontFamily: 'Raleway',
                            fontWeight: bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubjectCourses(
                                        screenIndex: 0,
                                      )));
                        },
                        child: Container(
                          height: height * .2,
                          width: width * .2,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9B5DE5),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'English',
                              style: TextStyle(
                                color: blackColor,
                                fontFamily: 'GTN',
                                fontWeight: bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubjectCourses(
                                        screenIndex: 0,
                                      )));
                        },
                        child: Container(
                          height: height * .2,
                          width: width * .2,
                          decoration: BoxDecoration(
                            color: const Color(0xff2f53bb),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'Mathematics',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: blackColor,
                                  fontFamily: 'GTN',
                                  fontWeight: bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ),
                  );
                },
                child: Container(
                  height: height * .4,
                  width: width * .25,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    color: const Color(0xff2f53bb),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFF4D01),
                        Color(0xFFD9D9D9),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Notifications',
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: 'GTN',
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: notifications.length,
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              return Text(
                                notifications[index].text,
                                style: TextStyle(
                                  color: blackColor,
                                  fontFamily: 'GTN',
                                  fontWeight: bold,
                                  fontSize: 12,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .8,
                child: Column(
                  children: [
                    const Text(
                      'Progression Graph',
                      style: TextStyle(
                        color: blackColor,
                        fontFamily: 'GTN',
                        fontWeight: bold,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Statistics(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/Icons/Line chart.png',
                        width: width * .5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
