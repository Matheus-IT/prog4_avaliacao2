import 'package:prog4_avaliacao2/models/letter_model.dart';

class WordModel {
  late List<LetterModel> _letters;

  WordModel(String word) {
    _letters = _createLetters(word);
  }

  List<LetterModel> get letters => [..._letters];

  List<LetterModel> _createLetters(String word) {
    return word
        .split('')
        .map<LetterModel>((letter) => LetterModel(letter.toUpperCase()))
        .toList();
  }

  bool contains(String letter) {
    return _letters.any((letterModel) => letterModel.value == letter);
  }

  int get length => _letters.length;

  bool allLettersWereRevealed() {
    return _letters.every((letterModel) => letterModel.isHidden == false);
  }
}
