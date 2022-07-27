import 'package:flutter/material.dart';
import '../../models/word_model.dart';
import '../../pages/game_page/components/gallow.dart';
import '../../consts/colors.dart';
import 'components/game_keyboard.dart';
import 'components/hidden_letter.dart';
import 'components/hint_bar.dart';
import 'components/letter.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int lives = 3;
  double hintBar = 0.0;
  final word = WordModel('flutter');

  void handleLetterPressed(String letterChar) {
    if (word.contains(letterChar)) {
      revealAllOccurrencesOf(letterChar);
      increaseHintBar();
    } else {
      decreaseLives();
    }
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

  void increaseHintBar() {
    setState(() {
      hintBar += 1 / word.length;
    });
  }

  void decreaseLives() {
    setState(() {
      lives -= 1;
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
              '$lives',
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
            HintBar(hintBar: hintBar),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
            ),
            const Gallow(imageSource: 'assets/image/player_stages/0.png'),
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
