import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class Gallow extends StatelessWidget {
  final String imageSource;

  const Gallow({
    Key? key,
    required this.imageSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: kActionAreaColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 40,
              spreadRadius: -15,
              color: Colors.black54),
        ],
      ),
      child: Image.asset(imageSource, width: 300, height: 205),
    );
  }
}
