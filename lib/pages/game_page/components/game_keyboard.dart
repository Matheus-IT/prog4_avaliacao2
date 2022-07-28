import 'package:flutter/material.dart';
import 'package:prog4_avaliacao2/consts/colors.dart';
import 'package:prog4_avaliacao2/models/letter_model.dart';

class GameKeyboard extends StatelessWidget {
  final List _gameKeyboard = [
    [
      LetterModel('A'),
      LetterModel('B'),
      LetterModel('C'),
      LetterModel('D'),
      LetterModel('E'),
      LetterModel('F'),
      LetterModel('G')
    ],
    [
      LetterModel('H'),
      LetterModel('I'),
      LetterModel('J'),
      LetterModel('K'),
      LetterModel('L'),
      LetterModel('M'),
      LetterModel('N')
    ],
    [
      LetterModel('O'),
      LetterModel('P'),
      LetterModel('Q'),
      LetterModel('R'),
      LetterModel('S'),
      LetterModel('T'),
      LetterModel('U')
    ],
    [
      LetterModel('V'),
      LetterModel('W'),
      LetterModel('X'),
      LetterModel('Y'),
      LetterModel('Z')
    ],
  ];
  final void Function(LetterModel) handleLetterPressed;

  GameKeyboard(this.handleLetterPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kKeyboardFrameColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          for (final List row in _gameKeyboard)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final LetterModel letter in row)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromRadius(16),
                      padding: const EdgeInsets.all(8),
                      primary: kWordsColor,
                    ),
                    onPressed: () => handleLetterPressed(letter),
                    child: Text(
                      letter.value,
                      style: const TextStyle(
                        fontSize: 18,
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
