import 'package:flutter/material.dart';

import '../../models/letter_model.dart';
import '../../models/hint_model.dart';
import '../../models/player_model.dart';
import '../../models/word_model.dart';
import '../../pages/game_page/components/gallow.dart';
import '../../consts/colors.dart';

import 'components/game_keyboard.dart';
import 'components/hint.dart';
import 'components/hint_bar.dart';
import 'components/word_to_guess.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double hintBarSize = 0.0;
  final word = WordModel('flutter');
  final hint = HintModel('framework mobile');
  final player = PlayerModel();

  final playerHangingAssets = {
    PlayerHangingStage.notHanging: 'assets/image/player_stages/0.png',
    PlayerHangingStage.head: 'assets/image/player_stages/1.png',
    PlayerHangingStage.torso: 'assets/image/player_stages/2.png',
    PlayerHangingStage.leftLeg: 'assets/image/player_stages/3.png',
    PlayerHangingStage.rightLeg: 'assets/image/player_stages/4.png',
    PlayerHangingStage.leftArm: 'assets/image/player_stages/5.png',
    PlayerHangingStage.rightArm: 'assets/image/player_stages/6.png',
  };

  void handleLetterPressed(LetterModel letter) {
    /// This is the controller to handle when a letter is pressed
    letter.chooseThisLetter();
    setState(() {
      if (word.contains(letter.value)) {
        revealAllOccurrencesOf(letter.value);
        letter.markAsHit();
      } else {
        player.decreaseLivesIfCan();
        player.updateHangingStage();
        increaseHintBar();
        if (hint.shouldRevealHint(hintBarSize)) {
          hint.revealHint();
        }
      }
    });
  }

  void revealAllOccurrencesOf(String letterChar) {
    for (final letterModel in word.letters) {
      if (letterModel.value == letterChar) {
        letterModel.revealLetter();
      }
    }
  }

  void increaseHintBar() {
    hintBarSize += 1 / player.lives;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kButtonColor,
        backgroundColor: kForegroundColor,
        leading: const Icon(Icons.star),
        actions: [
          const Icon(Icons.favorite),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 10, top: 16),
            child: Text(
              '${player.lives}',
              style: const TextStyle(fontSize: 18, color: kWhite),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: hint.isHintVisible
                  ? Hint(hintValue: hint.value)
                  : HintBar(hintBar: hintBarSize),
            ),
            Gallow(
              imageSource: playerHangingAssets[player.currentHangingStage]!,
            ),
            WordToGuess(word: word),
            const Spacer(),
            GameKeyboard(handleLetterPressed),
          ],
        ),
      ),
    );
  }
}
