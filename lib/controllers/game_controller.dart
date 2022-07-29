import 'dart:async';

import '../models/hint_model.dart';
import '../models/player_model.dart';
import '../models/word_model.dart';
import '../models/letter_model.dart';

class GameController {
  final List<List<LetterModel>> keyboardData = [
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
  final WordModel word;
  final HintModel hint;
  final PlayerModel player;
  final void Function(String) snackBarFeedback;
  final void Function(String) revealAllOccurrencesOf;
  final void Function() increaseHintBar;
  final void Function({
    required bool playerWon,
    required String guessedWord,
    required String hint,
  }) goToResultPage;

  GameController(
    this.word,
    this.hint,
    this.player,
    this.snackBarFeedback,
    this.revealAllOccurrencesOf,
    this.increaseHintBar,
    this.goToResultPage,
  );

  void handleLetterPressed(LetterModel letter) {
    /// This is the controller to handle when a letter is pressed
    letter.chooseThisLetter();

    if (word.contains(letter.value)) {
      revealAllOccurrencesOf(letter.value);
      letter.markAsHit();
      snackBarFeedback('Acertou!');
      if (word.allLettersWereRevealed()) {
        Timer(const Duration(milliseconds: 1100), () {
          goToResultPage(
            playerWon: true,
            guessedWord: word.value,
            hint: hint.value,
          );
        });
      }
    } else {
      player.decreaseLivesIfCan();
      if (player.lives == 0) {
        Timer(const Duration(milliseconds: 1100), () {
          goToResultPage(
            playerWon: false,
            guessedWord: word.value,
            hint: hint.value,
          );
        });
      }
      player.updateHangingStage();
      increaseHintBar();
      if (hint.shouldRevealHint()) {
        hint.revealHint();
      }
      snackBarFeedback('Errou!');
    }
  }
}
