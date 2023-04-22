import 'package:flutter/material.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/constants/constants.dart';
import 'package:unoquide/utils/common/personalItem.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  String name = "User Name";
  String admissionNumber = "Admission Number";
  String dob = "01 January 2000";
  String fatherName = "Father's Name";
  String motherName = "Mother's Name";
  String bloodGroup = "Blood Group";
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getStudentFromGlobal().then((value) {
      setState(() {
        name = "${value.firstName} ${value.lastName}";
        admissionNumber = value.admNo;
        dob = getDOB(value.dob);
        print(dob);
        fatherName = value.parents.isNotEmpty
            ? "${value.parents[0].firstName} ${value.parents[0].lastName}"
            : "Father's Name";

        bloodGroup = value.bloodGroup;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Container(
            decoration: const BoxDecoration(color: backgroundColor),
            margin: const EdgeInsets.fromLTRB(0, 0, 80, 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 40,
                      fontWeight: bold2,
                      fontFamily: 'Raleway'),
                ),
                const SizedBox(
                  height: 34,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: 2,
                    color: blackColor,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: InfoItem(
                    textHeading: 'NAME',
                    textDesc: name,
                  ),
                ),
                InfoItem(
                  textHeading: 'Admission Number',
                  textDesc: admissionNumber,
                ),
                InfoItem(
                  textHeading: 'D.O.B',
                  textDesc: dob,
                ),
                InfoItem(
                  textHeading: 'FATHER\'S NAME',
                  textDesc: fatherName,
                ),
                InfoItem(
                  textHeading: 'MOTHER\'S NAME',
                  textDesc: motherName,
                ),
                InfoItem(
                  textHeading: 'BLOOD GROUP',
                  textDesc: bloodGroup,
                ),
              ],
            ),
          );
  }

  getDOB(DateTime date) {
    // month to name of month
    switch (date.month) {
      case 1:
        return '${date.day} January ${date.year}';
      case 2:
        return '${date.day} February ${date.year}';
      case 3:
        return '${date.day} March ${date.year}';
      case 4:
        return '${date.day} April ${date.year}';
      case 5:
        return '${date.day} May ${date.year}';
      case 6:
        return '${date.day} June ${date.year}';
      case 7:
        return '${date.day} July ${date.year}';
      case 8:
        return '${date.day} August ${date.year}';
      case 9:
        return '${date.day} September ${date.year}';
      case 10:
        return '${date.day} October ${date.year}';
      case 11:
        return '${date.day} November ${date.year}';
      case 12:
        return '${date.day} December ${date.year}';
    }
  }
}
