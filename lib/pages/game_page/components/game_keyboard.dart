import 'package:flutter/material.dart';
import 'package:prog4_avaliacao2/consts/colors.dart';

class GameKeyboard extends StatelessWidget {
  final List _gameKeyboard = const [
    ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
    ['H', 'I', 'J', 'K', 'L', 'M', 'N'],
    ['O', 'P', 'Q', 'R', 'S', 'T', 'U'],
    ['V', 'W', 'X', 'Y', 'Z'],
  ];

  final void Function(String) handleLetterPressed;

  const GameKeyboard(this.handleLetterPressed, {Key? key}) : super(key: key);

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
          for (final row in _gameKeyboard)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final letter in row)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromRadius(16),
                      padding: const EdgeInsets.all(8),
                      primary: kWordsColor,
                    ),
                    onPressed: () => handleLetterPressed(letter),
                    child: Text(
                      '$letter',
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
