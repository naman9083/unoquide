import 'package:flutter/material.dart';
import 'package:unoquide/constants/constants.dart';
import 'package:unoquide/utils/common/commonItems.dart';
import 'package:unoquide/views/screens/NavbarItems/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const [
    Home(),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
    Center(child: Text('Settings')),
    Center(child: Text('Settings')),
    Center(child: Text('Settings')),
    Center(child: Text('Settings')),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .14,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/sym.png',
                      height: 50,
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () {},
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
                width: MediaQuery.of(context).size.width * .12,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(bottom: 1, top: 3),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      child: RailIconImage(
                          label: 'Emotional\nIntelligence',
                          imgUrl: 'assets/Icons/brain.png',
                          size: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      child: RailIconImage(
                          label: 'Home',
                          imgUrl: 'assets/Icons/home.png',
                          size: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: RailIconImage(
                          label: 'Syllabus/Courses',
                          imgUrl: 'assets/Icons/book.png',
                          size: 25),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      child: RailIconImage(
                          label: 'Games/\nInteractive Courses',
                          imgUrl: 'assets/Icons/games.png',
                          size: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      child: RailIconImage(
                          label: 'Audio Visual\nContent',
                          imgUrl: 'assets/Icons/video.png',
                          size: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 4;
                        });
                      },
                      child: RailIconImage(
                          label: 'Statistics/\nReportCard',
                          imgUrl: 'assets/Icons/exam.png',
                          size: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 5;
                        });
                      },
                      child: RailIconImage(
                          label: 'Calender',
                          imgUrl: 'assets/Icons/calender.png',
                          size: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 6;
                        });
                      },
                      child: RailIconImage(
                          label: 'My Profile',
                          imgUrl: 'assets/Icons/profile.png',
                          size: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
