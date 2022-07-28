import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class Hint extends StatelessWidget {
  const Hint({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kActionAreaColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 40,
              spreadRadius: -15,
              color: Colors.black54),
        ],
      ),
      child: Text(
        hint,
        style: const TextStyle(
          fontSize: 18,
          color: kWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
