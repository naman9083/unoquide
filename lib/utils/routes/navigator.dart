import 'package:flutter/material.dart';
import 'package:unoquide/views/screens/NavbarItems/Connect/connect.dart';
import 'package:unoquide/views/screens/NavbarItems/EmotionalIntelligence/EmotionalIntelligence.dart';
import 'package:unoquide/views/screens/NavbarItems/Games/games.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/subjectCourses.dart';
import 'package:unoquide/views/screens/NavbarItems/calendar/calendar.dart';

import '../../views/screens/NavbarItems/AudioVideo/AudioVideo.dart';
import '../../views/screens/NavbarItems/Home/home.dart';
import '../../views/screens/NavbarItems/Profile/myProfile.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == 'EQ') {
      child = const EmotionalIntelligence();
    } else if (tabItem == 'Home') {
      child = const Home();
    } else if (tabItem == 'SubjectCourses') {
      child = SubjectCourses(
        screenIndex: 0,
      );
    } else if (tabItem == 'AudioVideo') {
      child = const AudioVideo();
    } else if (tabItem == 'Connect') {
      child = const Connect();
    } else if (tabItem == 'Calender') {
      child = const CalendarApp();
    } else if (tabItem == 'MyProfile') {
      child = const MyProfile();
    } else if (tabItem == 'Games') {
      child = SubjectCourses(screenIndex: 2);
    } else {
      child = const Center(child: Text('Settings'));
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}
