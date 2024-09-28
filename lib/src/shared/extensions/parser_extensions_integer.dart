extension IntExtension on int {
  toFiveDigits() {
    return toString().padLeft(5, '0');
  }
}
