class HintModel {
  final String value;
  bool isHintVisible = false;
  double hintBarSize = 0.0;

  HintModel(this.value);

  bool shouldRevealHint() {
    return hintBarSize >= 1;
  }

  void revealHint() {
    isHintVisible = true;
  }
}
