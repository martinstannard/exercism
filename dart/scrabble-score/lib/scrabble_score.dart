int score(String word) {
  int count = word.split('').fold(0, (t, e) => t + letterScore(e));
  return count;
}

int letterScore(letter) {
  switch (letter.toLowerCase()) {
    case 'd':
      return 2;
    case 'g':
      return 2;
    case 'b':
      return 3;
    case 'c':
      return 3;
    case 'm':
      return 3;
    case 'p':
      return 3;
    case 'f':
      return 4;
    case 'h':
      return 4;
    case 'v':
      return 4;
    case 'w':
      return 4;
    case 'y':
      return 4;
    case 'k':
      return 5;
    case 'j':
      return 8;
    case 'x':
      return 8;
    case 'q':
      return 10;
    case 'z':
      return 10;
    default:
      return 1;
  }
}
