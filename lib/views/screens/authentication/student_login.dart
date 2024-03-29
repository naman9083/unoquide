import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/services/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config/color_palette.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  String? authToken;
  bool isVisible = false;
  studentLogin() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      putEmailToGlobal(email: _emailController.text);
      setState(() {
        isLoading = true;
      });
      student_login(_emailController.text, _passwordController.text)
          .then((value) {
        print(value.token);
        if (value.message == "Logged in successfully") {
          setState(() {
            isLoading = false;
            authToken = value.token?.split(' ')[1];
            putTokenToGlobal(token: authToken);
          });
          Fluttertoast.showToast(
              msg: 'Login Successful',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else {
          setState(() {
            isLoading = false;
            _emailController.clear();
            _passwordController.clear();
          });

          Fluttertoast.showToast(
              msg: value.message as String,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    } else {
      Fluttertoast.showToast(
          msg: "Please fill all the fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppTheme().backgroundColor,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/Images/Authentication/student_login.png'))),
            child: Center(
              child: SizedBox(
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
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(100, 217, 217, 217),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          margin: const EdgeInsets.only(top: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 217, 217, 217),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          //last two characters are .in//
                                          if (value.substring(
                                                      value.length - 2) ==
                                                  'in' ||
                                              value.substring(
                                                      value.length - 3) ==
                                                  "com") {
                                            FocusScope.of(context).unfocus();
                                          }
                                        },
                                        decoration: InputDecoration(
                                            errorMaxLines: 2,
                                            contentPadding:
                                                const EdgeInsets.only(
                                              top: 2,
                                              left: 25,
                                            ),
                                            hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20,
                                            ),
                                            hintText: 'Student Email',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 217, 217, 217),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: TextFormField(
                                        obscureText: isVisible,
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: isVisible
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                              onPressed: () {
                                                setState(() {
                                                  isVisible = !isVisible;
                                                });
                                              },
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 2, left: 25),
                                            hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20,
                                            ),
                                            hintText: 'Password',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  studentLogin();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 48, 38, 38),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const AutoSizeText(
                                    'Login',
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
        ),
        Visibility(
          visible: isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
