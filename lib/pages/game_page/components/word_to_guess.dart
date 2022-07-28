import 'package:flutter/material.dart';

import '../../../models/word_model.dart';
import 'hidden_letter.dart';
import 'letter.dart';

class WordToGuess extends StatelessWidget {
  const WordToGuess({
    Key? key,
    required this.word,
  }) : super(key: key);

  final WordModel word;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: word.letters.map((letter) {
          return letter.isHidden
              ? const HiddenLetter()
              : Letter(textValue: letter.value);
        }).toList(),
      ),
    );
  }
}
