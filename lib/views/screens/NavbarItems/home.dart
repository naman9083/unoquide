import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1;
    var height = MediaQuery.of(context).size.height / 1.25;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(children: [
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                const Text(
                  'Hello Arnavi !',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
                Container(
                  width: 230,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5CF),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Class: 3A\nAdmission No: 3288',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: height * .3,
              width: width * .3,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F866),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Score 100',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/Icons/userpng.png',
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                )),
          ]),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                height: height * .33,
                width: width * .25,
                margin: const EdgeInsets.fromLTRB(10, 40, 20, 0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F866),
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF236BCA),
                      const Color(0xFF0009D900),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Activites\nCompleted',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GTN',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '70%',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'GTN',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/Icons/piechart.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'English',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GTN',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '70%',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'GTN',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/Icons/piechart.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Mathematics',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GTN',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    width: width * .30,
                    height: height * .14,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5CF),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Top Subjects',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: height * .2,
                        width: width * .2,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9B5DE5),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'English',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'GTN',
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: height * .2,
                        width: width * .2,
                        decoration: BoxDecoration(
                          color: const Color(0xff2f53bb),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Mathematics',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'GTN',
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: height * .4,
                width: width * .25,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  color: const Color(0xff2f53bb),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFF4D01),
                      Color(0xFFD9D9D9),
                    ],
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'GTN',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        '\u2022     Lorem ipsum dolor sit ame. \n'
                        '\u2022     Sed nisi, adipiscing semper scelerisque\n'
                        '\u2022     Ac imperdiet vulputate massa in morbi. ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GTN',
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: height * .8,
                child: Column(
                  children: [
                    Text(
                      'Progression Graph',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'GTN',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'assets/Icons/Line chart.png',
                      width: width * .5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
