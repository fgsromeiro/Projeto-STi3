extension ParserExtensionInt on int {
  toFiveDigits() {
    return toString().padLeft(5, '0');
  }
  toTwoDigits() {
    return toString().padLeft(2, '0');
  }
}
