import 'package:flutter/material.dart';

import '../../models/player_model.dart';
import '../../models/word_model.dart';
import '../../pages/game_page/components/gallow.dart';
import '../../consts/colors.dart';

import 'components/game_keyboard.dart';
import 'components/hidden_letter.dart';
import 'components/hint.dart';
import 'components/hint_bar.dart';
import 'components/letter.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double hintBar = 0.0;
  String hint = 'framework mobile';
  bool hintVisible = false;
  final word = WordModel('flutter');
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

  void handleLetterPressed(String letterChar) {
    setState(() {
      if (word.contains(letterChar)) {
        revealAllOccurrencesOf(letterChar);
      } else {
        player.decreaseLives();
        player.updateHangingStage();
        increaseHintBar();
        if (shouldShowHint()) {
          showHint();
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
    print('hintBar antes: $hintBar');
    hintBar += 1 / player.lives;
    print('hintBar depois: $hintBar');
  }

  bool shouldShowHint() {
    return hintBar >= 1;
  }

  void showHint() {
    setState(() {
      hintVisible = true;
    });
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
            const SizedBox(
              height: 10,
            ),
            hintVisible ? Hint(hint: hint) : HintBar(hintBar: hintBar),
            Gallow(
              imageSource: playerHangingAssets[player.currentHangingStage]!,
            ),
            Container(
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
            ),
            const Spacer(),
            GameKeyboard(handleLetterPressed),
          ],
        ),
      ),
    );
  }
}
