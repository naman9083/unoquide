import 'package:flutter/material.dart';
import 'package:unoquide/config/shared-services.dart';
import 'package:unoquide/constants/constants.dart';

import '../../../../models/studentModel.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notify>? notifications;
  @override
  void initState() {
    getStudentFromGlobal().then((value) {
      setState(() {
        notifications = value.notifications;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          const Text(
            "Notifications",
            style: TextStyle(
                color: blackColor,
                fontSize: 40,
                fontWeight: bold2,
                fontFamily: 'Raleway'),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: notifications?.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                        leading: const Icon(
                          Icons.notifications,
                          color: Colors.greenAccent,
                        ),
                        title: Text(
                          notifications![index].title ?? "No Title",
                          style: const TextStyle(
                              color: blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                        ),
                        subtitle: Text(
                          notifications![index].text == null
                              ? "No Text"
                              : notifications![index].text!,
                          style: const TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontFamily: 'Raleway'),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                        )),
                  ),
                ),
              );
            },
          ))
        ]);
  }
}
