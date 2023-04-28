import 'package:flutter/material.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/constants/constants.dart';
import 'package:unoquide/services/studentData.dart';
import 'package:unoquide/utils/common/commonItems.dart';
import 'package:unoquide/views/screens/ChangePassword/changePassword.dart';
import 'package:unoquide/views/screens/NavbarItems/Connect/connect.dart';
import 'package:unoquide/views/screens/NavbarItems/EmotionalIntelligence/EmotionalIntelligence.dart';
import 'package:unoquide/views/screens/NavbarItems/Games/games.dart';
import 'package:unoquide/views/screens/NavbarItems/Home/home.dart';
import 'package:unoquide/views/screens/NavbarItems/Profile/myProfile.dart';
import 'package:unoquide/views/screens/NavbarItems/Subject/subjectCourses.dart';
import 'package:unoquide/views/screens/authentication/category_login.dart';

import '../../../utils/routes/navigator.dart';
import '../NavbarItems/AudioVideo/AudioVideo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const EmotionalIntelligence(),
    const Home(),
    SubjectCourses(
      screenIndex: 0,
    ),
    const Games(),
    const AudioVideo(),
    const Connect(),
    const MyProfile(),
  ];
  @override
  int _selectedIndex = 1;
  String currentPage = 'Home';
  List<String> pageKeys = [
    'EQ',
    'Home',
    'SubjectCourses',
    'Games',
    'AudioVideo',
    'Connect',
    'Calender',
    'MyProfile',
  ];
  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    'EQ': GlobalKey<NavigatorState>(),
    'Home': GlobalKey<NavigatorState>(),
    'SubjectCourses': GlobalKey<NavigatorState>(),
    'Games': GlobalKey<NavigatorState>(),
    'AudioVideo': GlobalKey<NavigatorState>(),
    'Connect': GlobalKey<NavigatorState>(),
    'Calender': GlobalKey<NavigatorState>(),
    'MyProfile': GlobalKey<NavigatorState>(),
  };
  String authToken = '';
  String schoolName = '';
  String picUrl =
      'https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars-thumbnail.png';
  @override
  void initState() {
    super.initState();
    getTokenFromGlobal().then((value) => {
          if (value != null)
            {
              setStateIfMounted(() {
                authToken = value;
              }),
              getStudentData(value).then((value) => {
                    if (value != null)
                      {
                        setStateIfMounted(() {
                          schoolName = value.schoolName;
                          picUrl = value.image.location;
                        })
                      }
                  })
            }
        });
  }

  setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onWillPop();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Row(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .14,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          selectTab(1);
                        },
                        child: Image.asset(
                          'assets/Icons/sym.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _onWillPop();
                          },
                          icon: Image.asset(
                            'assets/Icons/Undo.png',
                            height: 50,
                            width: 50,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .85,
                  width: MediaQuery.of(context).size.width * .11,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(0);
                            print('EQ');
                          },
                          child: const RailIconImage(
                              label: 'EQ',
                              imgUrl: 'assets/Icons/brain.png',
                              size: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(1);
                          },
                          child: const RailIconImage(
                              label: 'Home',
                              imgUrl: 'assets/Icons/home.png',
                              size: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(2);
                          },
                          child: const RailIconImage(
                              label: 'Course',
                              imgUrl: 'assets/Icons/book.png',
                              size: 25),
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(3);
                          },
                          child: const RailIconImage(
                              label: 'AR & Games',
                              imgUrl: 'assets/Icons/games.png',
                              size: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(4);
                          },
                          child: const RailIconImage(
                              label: 'Audio Visual\nContent',
                              imgUrl: 'assets/Icons/video.png',
                              size: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(5);
                          },
                          child: const RailIconImage(
                              label: 'Connect',
                              imgUrl: 'assets/Icons/exam.png',
                              size: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(6);
                          },
                          child: const RailIconImage(
                              label: 'Calender',
                              imgUrl: 'assets/Icons/calender.png',
                              size: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            selectTab(7);
                          },
                          child: const RailIconImage(
                              label: 'My Profile',
                              imgUrl: 'assets/Icons/profile.png',
                              size: 30),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Stack(
              children: <Widget>[
                _buildOffstageNavigator('EQ'),
                _buildOffstageNavigator('Home'),
                _buildOffstageNavigator('SubjectCourses'),
                _buildOffstageNavigator('Games'),
                _buildOffstageNavigator('AudioVideo'),
                _buildOffstageNavigator('Connect'),
                _buildOffstageNavigator('Calender'),
                _buildOffstageNavigator('MyProfile'),
                Container(
                  // width: MediaQuery.of(context).size.width * .85,
                  height: MediaQuery.of(context).size.height * .15,
                  color: backgroundColor,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChangePassword()));
                              },
                              child: Container(
                                  height: 40,
                                  width: 150,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFffdb9c),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Change Password',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Raleway',
                                        fontWeight: bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Dialog(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              height: 100,
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Are you sure you want to logout?',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Raleway',
                                                      fontWeight: bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                            height: 40,
                                                            width: 120,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFffdb9c),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Cancel',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Raleway',
                                                                  fontWeight:
                                                                      bold,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          logout(context);
                                                        },
                                                        child: Container(
                                                            height: 40,
                                                            width: 120,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFffdb9c),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Logout',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Raleway',
                                                                  fontWeight:
                                                                      bold,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                                // logout(context);
                              },
                              child: Container(
                                  height: 40,
                                  width: 120,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFffdb9c),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Raleway',
                                        fontWeight: bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(picUrl ??
                                    'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String navigatorKey) {
    return Offstage(
      offstage: currentPage != navigatorKey,
      child: TabNavigator(
        navigatorKey: navigatorKeys[navigatorKey]!,
        tabItem: navigatorKey,
      ),
    );
  }

  void selectTab(int index) {
    if (index == _selectedIndex) {
      navigatorKeys[pageKeys[index]]!
          .currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setStateIfMounted(() {
        _selectedIndex = index;

        currentPage = pageKeys[index];
      });
    }
  }

  logout(context) {
    removeTokenFromGlobal();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CategoryLoginScreen()));
  }

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentPage]!.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (currentPage != 'Home') {
        selectTab(1);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }
}
