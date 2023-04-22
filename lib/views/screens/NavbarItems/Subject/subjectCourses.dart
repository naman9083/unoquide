import 'package:flutter/material.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/models/studentModel.dart';

import 'package:unoquide/views/screens/NavbarItems/AudioVideo/Recorded.dart';
import 'package:unoquide/views/screens/NavbarItems/AudioVideo/visuals.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/subjectResource.dart';

import '../../../../constants/constants.dart';

class SubjectCourses extends StatefulWidget {
  SubjectCourses({Key? key, required this.screenIndex}) : super(key: key);
  int screenIndex = 0;
  @override
  State<SubjectCourses> createState() => _SubjectCoursesState(screenIndex);
}

//
class _SubjectCoursesState extends State<SubjectCourses> {
  int screenIndex;
  _SubjectCoursesState(this.screenIndex);
  List<Subject> listSubject = [];
  Function onTap = (Subject subjectName, BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SubjectR(
                subjectData: subjectName,
              )));
    } else if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Visuals(
                subjectName: "Hindi",
              )));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Recorded()));
    }
  };
  String SchoolName = "School Name";
  @override
  void initState() {
    getStudentFromGlobal().then((value) => setState(() {
          listSubject = value.subjects;
          SchoolName = value.schoolName;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisSpacing: 1.0,

        mainAxisSpacing: 0.0,
        crossAxisCount: 2,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(listSubject.length, (index) {
          return InkWell(
            onTap: () => onTap(listSubject[index], context, 0),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        listSubject[index].subject.image.location,
                        height: height * 0.5,
                        width: width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(listSubject[index].subject.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: bold,
                          fontFamily: 'Raleway',
                          fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
