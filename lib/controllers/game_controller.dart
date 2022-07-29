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
  final Function(String) snackBarFeedback;
  final Function(String) revealAllOccurrencesOf;
  final Function() increaseHintBar;
  final Function() goToResultPage;

  GameController(
    this.word,
    this.hint,
    this.player,
    this.snackBarFeedback,
    this.revealAllOccurrencesOf,
    this.increaseHintBar,
    this.goToResultPage(),
  );

  void handleLetterPressed(LetterModel letter) {
    /// This is the controller to handle when a letter is pressed
    letter.chooseThisLetter();

    if (word.contains(letter.value)) {
      revealAllOccurrencesOf(letter.value);
      letter.markAsHit();
      snackBarFeedback('Acertou!');
      if (word.allLettersWereRevealed()) {
        goToResultPage();
      }
    } else {
      player.decreaseLivesIfCan();
      if (player.lives == 0) {
        goToResultPage();
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
