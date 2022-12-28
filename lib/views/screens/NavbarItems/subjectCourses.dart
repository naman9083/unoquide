import 'package:flutter/material.dart';
import 'package:unoquide/utils/common/commonItems.dart';
import 'package:unoquide/views/screens/NavbarItems/test.dart';

import '../../../constants/constants.dart';

class SubjectCourses extends StatefulWidget {
  const SubjectCourses({Key? key}) : super(key: key);

  @override
  State<SubjectCourses> createState() => _SubjectCoursesState();
}

class _SubjectCoursesState extends State<SubjectCourses> {
  Function onTap = (String subjectName, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Test(subjectName: subjectName),
      ),
    );
  };
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageTextClickableContainer(
                width: width * .3,
                height: height * .4,
                imgUrl: 'assets/Images/Courses/english.png',
                text: "English",
                onTap: () {
                  onTap("English", context);
                }),
            ImageTextClickableContainer(
                width: width * .3,
                height: height * .4,
                imgUrl: 'assets/Images/Courses/hindi.png',
                text: "Hindi",
                onTap: () {
                  onTap('Hindi', context);
                }),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageTextClickableContainer(
                width: width * .3,
                height: height * .4,
                imgUrl: 'assets/Images/Courses/maths.png',
                text: "Maths",
                onTap: () {
                  onTap('Maths', context);
                }),
            ImageTextClickableContainer(
                width: width * .3,
                height: height * .4,
                imgUrl: 'assets/Images/Courses/evs.png',
                text: "Environmental\nStudies",
                onTap: () {
                  onTap('Environmental Studies', context);
                }),
          ],
        ),
      ]),
    );
  }
}
