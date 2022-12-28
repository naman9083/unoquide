import 'package:flutter/material.dart';
import 'package:unoquide/utils/common/commonItems.dart';
import 'package:unoquide/views/screens/NavbarItems/personalInfo.dart';
import 'package:unoquide/views/screens/NavbarItems/statistics&Report.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: "assets/Images/personal.png",
              text: "Personal Info",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonalInfo()),
                );
              }),
          ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: "assets/Images/subject.png",
              text: "Subject Info",
              onTap: () {}),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: "assets/Images/documents.png",
              text: "My Documents",
              onTap: () {}),
          ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: "assets/Images/report.png",
              text: "Statistics &\nReport Card",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StatisticsReports()),
                );
              }),
        ]),
      ],
    );
  }
}
