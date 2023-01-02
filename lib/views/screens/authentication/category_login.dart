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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/category_login_background.png')
          )
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.2,
                  height: MediaQuery.of(context).size.height*0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Icons/logo.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Are you a...?',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.6,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 217, 217, 217),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: EdgeInsets.only(top: 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Element('School'),
                          Element('Teacher'),
                          Element('Student'),
                          Element('Parent'),
                          GestureDetector(
                            onTap: () {
                              /// TODO: Implement Tap
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width*0.20,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 48, 38, 38),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: AutoSizeText(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
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

  Widget Element(String category){
    return GestureDetector(
      onTap: () {
        /// TODO: Implement Tap
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.30,
        height: 25,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 217, 217, 217),
            borderRadius: BorderRadius.circular(30)
        ),
        child: AutoSizeText(
          category,
          style: TextStyle(
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
