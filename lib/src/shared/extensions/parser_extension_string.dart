extension ParserExtensionString on String {
  DateTime toDate() {
    return DateTime.parse(this);
  }
}
