import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    int length = number.length;
    BigInt actual = BigInt.parse(number);
    BigInt calculated = score(number, length);
    print("**************");
    print(actual);
    print(calculated);
    return (calculated == actual);
  }

  BigInt score(String number, int length) {
    BigInt s = number.split('').fold(BigInt.from(0), (t, e) => t + digitScore(e, length));
    return s;
  }

  BigInt digitScore(String digit, int length) {
    return BigInt.from(pow(int.parse(digit), length));
  }
}
