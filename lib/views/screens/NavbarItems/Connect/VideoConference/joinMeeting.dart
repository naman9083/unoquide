import 'package:dyte_client/dyte.dart';
import 'package:dyte_client/dyteMeeting.dart';
import 'package:dyte_client/dyteParticipant.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../models/dyte_meeting.dart';
import '../../../../../services/dyte_api.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({Key? key}) : super(key: key);

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  final TextEditingController _meetingName = TextEditingController();
  final TextEditingController _meetingId = TextEditingController();
  // int meetingCount = 0;
  // List<Meeting> meetings = [];
  // List<Meeting> filteredMeetings = [];
  //
  bool isLoading = true;
  bool isErroredState = false;
  bool isSearching = false;
  //
  String participantName = "";
  //
  //
  // void _initializePage() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     meetings = await DyteAPI.getMeetings();
  //     meetingCount = meetings.length;
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } on APIFailureException {
  //     setState(() {
  //       isLoading = false;
  //       isErroredState = true;
  //     });
  //   }
  // }
  //
  // void _handleSearchChange() {
  //   var searchTerm = _searchController.text.trim();
  //   if (searchTerm == "") {
  //     setState(() {
  //       isSearching = false;
  //     });
  //   } else {
  //     setState(() {
  //       isSearching = true;
  //       filteredMeetings = [];
  //     });
  //     for (var i = 0; i < meetings.length; i++) {
  //       var meeting = meetings[i];
  //       if (meeting.title!.toLowerCase().contains(searchTerm.toLowerCase())) {
  //         filteredMeetings.add(meeting);
  //       }
  //     }
  //     setState(() {});
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _initializePage();
  //   _nameController.addListener(() {
  //     participantName = _nameController.text.trim();
  //   });
  //   _searchController.addListener(_handleSearchChange);
  // }
  //
  // Future<void> _joinRoom(
  //     Meeting meeting, bool isHost, Function setState) async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     //Note usage of mode here
  //     var authToken = await DyteAPI.createParticipant(meeting, isHost,
  //         widget.mode == Mode.webinar ? true : false, participantName);
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => DyteMeetingPage(
  //                 roomName: meeting.roomName!,
  //                 authToken: authToken,
  //                 mode: widget.mode,
  //               )),
  //     );
  //   } on APIFailureException {
  //     setState(() {
  //       isErroredState = true;
  //     });
  //   }
  // }
  //
  // Future<void> _showMeetingDialog(Meeting meeting) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return SimpleDialog(
  //             title: Text('Join ${meeting.roomName} as'),
  //             children: !isErroredState
  //                 ? !isLoading
  //                     ? <Widget>[
  //                         Container(
  //                           margin: const EdgeInsets.symmetric(
  //                               horizontal: 10.0, vertical: 6.0),
  //                           child: TextField(
  //                             controller: _nameController,
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               hintText: 'Enter your name',
  //                             ),
  //                           ),
  //                         ),
  //                         SimpleDialogOption(
  //                           /* child: const Text('Host'), */
  //                           child: TextButton(
  //                             style: TextButton.styleFrom(
  //                               primary: Colors.blue,
  //                               textStyle: const TextStyle(
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                             onPressed: () {
  //                               _joinRoom(meeting, true, setState);
  //                             },
  //                             child: const Text(
  //                               'Host',
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                           ),
  //                           onPressed: () {},
  //                         ),
  //                         SimpleDialogOption(
  //                           /* child: const Text('Participant'), */
  //                           child: TextButton(
  //                             style: TextButton.styleFrom(
  //                               primary: Colors.blue,
  //                               textStyle: const TextStyle(
  //                                 color: Colors.black,
  //                               ),
  //                             ),
  //                             onPressed: () {
  //                               _joinRoom(meeting, false, setState);
  //                             },
  //                             child: const Text(
  //                               'Participant',
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                           ),
  //                           onPressed: () {},
  //                         ),
  //                       ]
  //                     : <Widget>[
  //                         const Center(
  //                           child: CircularProgressIndicator(),
  //                         ),
  //                       ]
  //                 : <Widget>[
  //                     const Center(
  //                       child: Text('An error occurred!'),
  //                     ),
  //                   ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Join Meeting',
          style: TextStyle(
            fontSize: 30,
            fontWeight: bold,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: height * .15,
          width: width * .6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: _meetingId,
            decoration: const InputDecoration(
              hintText: 'Enter Meeting ID',
              hintStyle: TextStyle(
                fontSize: 20,
                // fontFamily: 'Raleway',
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: height * .15,
          width: width * .6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: _meetingName,
            decoration: const InputDecoration(
              hintText: 'Enter Meeting Name',
              hintStyle: TextStyle(
                fontSize: 20,
                // fontFamily: 'Raleway',
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFed6c02),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: SizedBox(
            height: height * .07,
            width: width * .2,
            child: const Center(
              child: Text(
                'Join Meeting',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DyteMeetingPage extends StatefulWidget {
  final String roomName;
  final String authToken;
  final Mode mode;

  const DyteMeetingPage({
    Key? key,
    @required required this.roomName,
    @required required this.authToken,
    @required required this.mode,
  }) : super(key: key);

  @override
  _DyteMeetingPageState createState() => _DyteMeetingPageState();
}

//Quickstart on usage of SDK: https://docs.dyte.io/flutter/quickstart
class _DyteMeetingPageState extends State<DyteMeetingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Row(
        children: <Widget>[
          SizedBox(
            width: width,
            height: height,
            child: DyteMeeting(
              roomName: widget.roomName,
              authToken: widget.authToken,
              onInit: (DyteMeetingHandler meeting) async {
                if (widget.mode == Mode.customControls) {
                  //Here we are trying to change meeting's UI check this page for detailed documentation: https://docs.dyte.io/flutter/customize-meeting-ui and https://docs.dyte.io/flutter/advanced-usage
                  /* meeting.updateUIConfig({'controlBar': false}); */
                }

                //Event callbacks, refer: https://docs.dyte.io/flutter/events/
                meeting.events.on('meetingConnected', this, (ev, cont) {
                  print("Meeting Connected");
                });

                meeting.events.on('meetingJoin', this, (ev, cont) {
                  print("Meeting Join");
                });

                meeting.events.on('meetingDisconnected', this, (ev, cont) {
                  print("Meeting Disconnected");
                });

                meeting.events.on('meetingEnd', this, (ev, cont) {
                  Navigator.of(context).pop();
                  print("Meeting ended");
                });

                meeting.events.on('participantJoin', this, (ev, cont) {
                  DyteParticipant p = ev.eventData as DyteParticipant;
                  print("Participant ${p.name} joined");
                });
                meeting.events.on('participantLeave', this, (ev, cont) {
                  DyteParticipant p = ev.eventData as DyteParticipant;
                  print("Participant ${p.name} left");
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
