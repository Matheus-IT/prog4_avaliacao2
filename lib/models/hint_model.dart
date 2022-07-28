class HintModel {
  final String value;
  bool isHintVisible;

  HintModel(this.value, [this.isHintVisible = false]);

  bool shouldRevealHint(double hintBarSize) {
    return hintBarSize >= 1;
  }

  void revealHint() {
    isHintVisible = true;
  }
}
