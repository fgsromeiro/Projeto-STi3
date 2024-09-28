import 'package:intl/intl.dart';

extension ParserExtensionDouble on double {
  String formatMoney() {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(this);
  }
}
