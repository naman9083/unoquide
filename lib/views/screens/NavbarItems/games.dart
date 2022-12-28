import 'dart:html';

import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  final IFrameElement _iframeElement = IFrameElement()
    ..src = 'https://ug.uno-quide.com/games';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
