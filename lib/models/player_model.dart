enum PlayerHangingStage {
  notHanging,
  head,
  torso,
  leftLeg,
  rightLeg,
  leftArm,
  rightArm,
}

class PlayerModel {
  PlayerHangingStage currentHangingStage;
  int lives;

  PlayerModel(
      [this.currentHangingStage = PlayerHangingStage.notHanging,
      this.lives = 3]);

  void decreaseLives() {
    lives -= 1;
  }

  void updateHangingStage() {
    if (_shouldGoToNextHangingStage()) {
      currentHangingStage = _getNextStage();
    }
  }

  bool _shouldGoToNextHangingStage() {
    return currentHangingStage.index < PlayerHangingStage.values.length - 1;
  }

  PlayerHangingStage _getNextStage() {
    return PlayerHangingStage.values[currentHangingStage.index + 1];
  }
}
