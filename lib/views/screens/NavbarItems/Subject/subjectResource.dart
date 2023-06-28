import 'package:flutter/material.dart';
import 'package:unoquide/models/studentModel.dart';
import 'package:unoquide/utils/common/commonItems.dart';
import 'package:unoquide/views/screens/NavbarItems/Games/games.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/Activities.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/Notes.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/Q&As.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/RecordedClasses.dart';

import '../../../../config/shared-services.dart';
import '../../../../constants/constants.dart';
import 'AnimatedVideos.dart';
import 'Game.dart';

class SubjectR extends StatefulWidget {
  const SubjectR({Key? key, required this.subjectData}) : super(key: key);

  final Subject subjectData;

  @override
  State<SubjectR> createState() => _SubjectRState(subjectData);
}

class _SubjectRState extends State<SubjectR> {
  Subject subjectData;
  _SubjectRState(this.subjectData);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Center(
          child: Text(
            subjectData.subject.name!,
            style: const TextStyle(
                color: blackColor,
                fontSize: 40,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),

        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Notes(
                      notes: subjectData.subject.notes!,
                      subjectName: subjectData.subject.name!,
                    )));
          },
          child: const Text(
            '✯ Notes',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuesAns(
                      QA: subjectData.subject.qa!,
                      subjectName: subjectData.subject.name!,
                    )));
          },
          child: const Text(
            '✯ Q&As',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),
        //Activites
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Activites(
                      notes: subjectData.subject.activity!,
                      subjectName: subjectData.subject.name!,
                    )));
          },
          child: const Text(
            '✯ Activities',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),
        //Game
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GamesA(
                      notes: subjectData.subject.game!,
                      subjectName: subjectData.subject.name!,
                    )));
          },
          child: const Text(
            '✯ Games',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),
        //Recrded Lectures
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RecLectures(
                      notes: subjectData.subject.recClass!,
                      subjectName: subjectData.subject.name!,
                    )));
          },
          child: const Text(
            '✯ Recorded Lectures',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),
        // Animated Videos
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AnimatedVideos(
                      notes: subjectData.subject.animatedVideo!,
                      subjectName: subjectData.subject.name!,
                    )));
          },
          child: const Text(
            '✯ Animated Videos',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        ),
        const InkWell(
          child: Text(
            '✯ Assignments',
            style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: bold,
                fontFamily: 'Raleway'),
          ),
        )
      ],
    );
  }
}
