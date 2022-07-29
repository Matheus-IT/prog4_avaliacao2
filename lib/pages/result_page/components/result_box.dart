import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class ResultBox extends StatelessWidget {
  final String title;
  final String values;

  const ResultBox({Key? key, required this.values, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        textStyle: const TextStyle(
          fontSize: 16,
          color: kDarkText,
          fontWeight: FontWeight.w500,
        ),
        child: Column(
          children: [
            Text(title),
            Text(values),
          ],
        ));
  }
}
