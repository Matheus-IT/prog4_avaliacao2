import 'package:flutter/material.dart';

class HiddenLetter extends StatelessWidget {
  const HiddenLetter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
