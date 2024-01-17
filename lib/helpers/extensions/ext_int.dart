extension strParsing on String {
  int get getAngka {
    try {
      return int.parse((this).replaceAll(new RegExp(r'[^0-9]'), ''));
    } catch (e) {
      return 0;
    }
  }
}
