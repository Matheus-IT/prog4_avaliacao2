class LetterModel {
  String value;
  bool isHidden = true;
  bool wasChosen = false;

  LetterModel(this.value);

  void revealLetter() {
    isHidden = false;
  }

  void chooseThisLetter() {
    wasChosen = true;
  }
}
