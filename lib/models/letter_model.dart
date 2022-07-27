class LetterModel {
  String value;
  bool isHidden = true;

  LetterModel(this.value);

  void revealLetter() {
    isHidden = false;
  }
}
