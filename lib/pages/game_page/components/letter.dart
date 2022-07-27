import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  final String textValue;

  const Letter({
    Key? key,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Text(
        textValue,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
