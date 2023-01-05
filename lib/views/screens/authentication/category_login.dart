import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../config/color_palette.dart';

class CategoryLoginScreen extends StatefulWidget {
  const CategoryLoginScreen({Key? key}) : super(key: key);

  @override
  State<CategoryLoginScreen> createState() => _CategoryLoginScreenState();
}

class _CategoryLoginScreenState extends State<CategoryLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().backgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/Images/Authentication/category_login_background.png'))),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Icons/logo.png'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AutoSizeText(
                      'Are you a...?',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 217, 217, 217),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: const EdgeInsets.only(top: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Element(
                            category: 'School',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/schoolLoginScreen');
                            },
                          ),
                          Element(
                            category: 'Teacher',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/teacherLoginScreen');
                            },
                          ),
                          Element(
                            category: 'Student',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/studentLoginScreen');
                            },
                          ),
                          Element(
                            category: 'Parent',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/parentLoginScreen');
                            },
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     /// TODO: Implement Tap
                          //   },
                          //   child: Container(
                          //     margin: const EdgeInsets.only(top: 15),
                          //     width: MediaQuery.of(context).size.width * 0.20,
                          //     height: 25,
                          //     decoration: BoxDecoration(
                          //         color: const Color.fromARGB(255, 48, 38, 38),
                          //         borderRadius: BorderRadius.circular(30)),
                          //     child: const AutoSizeText(
                          //       'Register',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontFamily: 'Inter',
                          //         fontWeight: FontWeight.w900,
                          //         fontSize: 20,
                          //       ),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Element extends StatelessWidget {
  const Element({Key? key, required this.onTap, required this.category})
      : super(key: key);
  final String category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.30,
        height: 25,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 217, 217, 217),
            borderRadius: BorderRadius.circular(30)),
        child: AutoSizeText(
          category,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
