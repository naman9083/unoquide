import 'package:flutter/material.dart';
import 'package:unoquide/views/screens/NavbarItems/EmotionalIntelligence.dart';
import 'package:unoquide/views/screens/NavbarItems/subjectCourses.dart';

import '../../views/screens/NavbarItems/AudioVideo.dart';
import '../../views/screens/NavbarItems/home.dart';
import '../../views/screens/NavbarItems/myProfile.dart';
import '../../views/screens/NavbarItems/statistics&Report.dart';

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
      child = const SubjectCourses();
    } else if (tabItem == 'AudioVideo') {
      child = const AudioVideo();
    } else if (tabItem == 'StatisticsReports') {
      child = const StatisticsReports();
    } else if (tabItem == 'MyProfile') {
      child = const MyProfile();
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
