import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../../models/letter_model.dart';

class GameKeyboard extends StatelessWidget {
  final List<List<LetterModel>> gameKeyboardData;
  final void Function(LetterModel) handleLetterPressed;

  const GameKeyboard(
    this.handleLetterPressed, {
    required this.gameKeyboardData,
    Key? key,
  }) : super(key: key);

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
          for (final List row in gameKeyboardData)
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
                    onPressed: !letter.wasChosen
                        ? () => handleLetterPressed(letter)
                        : null,
                    child: Text(
                      letter.value,
                      style: TextStyle(
                        fontSize: 18,
                        color: letter.wasHit
                            ? const Color.fromARGB(255, 17, 255, 25)
                            : kWhite,
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
