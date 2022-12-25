import 'package:flutter/material.dart';

class RailIconImage extends StatelessWidget {
  RailIconImage(
      {Key? key, required this.label, required this.imgUrl, required this.size})
      : super(key: key);
  String imgUrl;
  double size;
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgUrl,
          height: size,
          width: size,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 8),
        ),
      ],
    );
  }
}
