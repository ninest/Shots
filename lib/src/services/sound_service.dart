import 'dart:math';

class SoundService {
  // no of primary and secondary sounds available
  static int noPrimaryPop = 2;
  static int noSecondaryPop = 3;

  static primaryPop() {
    final random = new Random();
    int randomNumber = random.nextInt(noPrimaryPop);
    print(randomNumber);
  }

  static secondaryPop() {
    final random = new Random();
  }
}
