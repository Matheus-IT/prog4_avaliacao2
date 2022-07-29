import 'package:flutter/material.dart';

import '../../controllers/game_controller.dart';
import '../../core/app_routes.dart';
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
  final word = WordModel('flutter');
  final hint = HintModel('framework mobile');
  final player = PlayerModel();
  late GameController gameController;
  final playerHangingAssets = {
    PlayerHangingStage.notHanging: 'assets/image/player_stages/0.png',
    PlayerHangingStage.head: 'assets/image/player_stages/1.png',
    PlayerHangingStage.torso: 'assets/image/player_stages/2.png',
    PlayerHangingStage.leftLeg: 'assets/image/player_stages/3.png',
    PlayerHangingStage.rightLeg: 'assets/image/player_stages/4.png',
    PlayerHangingStage.leftArm: 'assets/image/player_stages/5.png',
    PlayerHangingStage.rightArm: 'assets/image/player_stages/6.png',
  };

  _GamePageState() {
    gameController = GameController(
      word,
      hint,
      player,
      snackBarFeedback,
      revealAllOccurrencesOf,
      increaseHintBar,
      goToResultPage,
    );
  }

  void revealAllOccurrencesOf(String letterChar) {
    setState(() {
      for (final letterModel in word.letters) {
        if (letterModel.value == letterChar) {
          letterModel.revealLetter();
        }
      }
    });
  }

  void snackBarFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: kWordsColor,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void increaseHintBar() {
    setState(() {
      hint.hintBarSize += 1 / player.lives;
    });
  }

  void goToResultPage() {
    Navigator.of(context).pushNamed(AppRoutes.resultPage);
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
                  : HintBar(hintBar: hint.hintBarSize),
            ),
            Gallow(
              imageSource: playerHangingAssets[player.currentHangingStage]!,
            ),
            WordToGuess(word: word),
            const Spacer(),
            GameKeyboard(
              gameController.handleLetterPressed,
              gameKeyboardData: gameController.keyboardData,
            ),
          ],
        ),
      ),
    );
  }
}
