import 'package:flutter/material.dart';
import 'package:unoquide/utils/common/commonItems.dart';

import '../../../constants/constants.dart';

class AudioVideo extends StatefulWidget {
  const AudioVideo({Key? key}) : super(key: key);

  @override
  State<AudioVideo> createState() => _AudioVideoState();
}

class _AudioVideoState extends State<AudioVideo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const SizedBox(
          height: 125,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageTextClickableContainer(
                width: width * .3,
                height: height * .4,
                imgUrl: 'assets/Images/AudioVisuals/av.png',
                text: "Audio Visual",
                onTap: () {}),
            ImageTextClickableContainer(
                width: width * .3,
                height: height * .4,
                imgUrl: 'assets/Images/AudioVisuals/recorded.png',
                text: "Recorded\nSessions",
                onTap: () {}),
          ],
        ),
      ]),
    );
  }
}