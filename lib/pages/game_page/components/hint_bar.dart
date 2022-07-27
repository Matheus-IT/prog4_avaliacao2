import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class HintBar extends StatelessWidget {
  const HintBar({
    Key? key,
    required this.hintBar,
  }) : super(key: key);

  final double hintBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 18,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(5)),
            width: 175,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
              child: LinearProgressIndicator(
                backgroundColor: kWhite,
                valueColor: const AlwaysStoppedAnimation(kWordsColor),
                minHeight: 15,
                value: hintBar,
              ),
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWordsColor,
          child: Text(
            '?',
            style: TextStyle(
                color: kWhite, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
