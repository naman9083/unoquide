import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/services/Chat.dart';
import 'package:unoquide/views/screens/NavbarItems/Connect/VideoConference/videoConference.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/common/commonItems.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final imgUrlList = [
    'assets/Images/Connect/videocon.png',
    'assets/Images/Connect/messenger.png',
    'assets/Images/Connect/examination.png'
  ];
  bool loading = true;
  final jsonEncoder = JsonEncoder();
  InAppWebViewController? _webViewController;
  _launchURLApp(URL) async {
    Uri url = Uri.parse(URL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * .16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: 'assets/Images/Connect/videocon.png',
              text: "Video Conferencing",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VideoConference()));
              },
            ),
            ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: 'assets/Images/Connect/messenger.png',
              text: "Messenger",
              onTap: () {
                getEmailFromGlobal()
                    .then((value) => chatResponse(value).then((value1) {
                          // print(value);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InAppWebView(
                                    initialUrlRequest: URLRequest(
                                      url: Uri.parse(
                                          "https://unoguide.in/chat-homepage/"),
                                    ),
                                    onWebViewCreated: (controller) {
                                      _webViewController = controller;
                                      // controller.webStorage.localStorage.setItem(
                                      //     key: "userInfo", value: "1234567");
                                      // controller.webStorage.localStorage
                                      //     .getItem(key: 'userInfo')
                                      //     .then((value) {
                                      //   print(value);
                                      // });
                                    },
                                    onLoadStart: (controller, url) {
                                      // _webViewController
                                      //     ?.webStorage.localStorage
                                      //     .setItem(
                                      //         key: "userInfo",
                                      //         value: jsonEncoder
                                      //             .convert(value1.toJson()));
                                      // _webViewController
                                      //     ?.webStorage.localStorage
                                      //     .getItem(key: 'userInfo')
                                      //     .then((value) {
                                      //   print(value);
                                      // });

                                      _webViewController!.evaluateJavascript(
                                          source:
                                              """"window.localStorage.setItem("userInfo", '${jsonEncoder.convert(value1.toJson())}')""");
                                      _webViewController!.evaluateJavascript(
                                          source:
                                              """window.localStorage.getItem("userInfo")""").then(
                                          (value) => print(value));
                                    },
                                  )));
                        }));
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageTextClickableContainer(
              width: width * .3,
              height: height * .4,
              imgUrl: 'assets/Images/Connect/examination.png',
              text: "Examination",
              onTap: () {
                launchUrl(Uri.parse("https://assessment.eklavvya.com/"),
                    mode: LaunchMode.externalApplication);
              },
            ),
            SizedBox(
              width: width * .3,
              height: height * .4,
            ),
          ],
        ),
      ],
    );
  }
}
