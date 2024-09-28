import 'package:intl/intl.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_integer.dart';

extension ParserExtensionDatetime on DateTime {
  String formatDateCapitalize() {
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'pt_BR').format(this);

    String capitalizedDate =
        "${formattedDate[0].toUpperCase()}${formattedDate.substring(1)}";

    return capitalizedDate;
  }

  String formatShortDate() {
    String capitalizedDate = "$day/${month.toTwoDigits()}/$year";

    return capitalizedDate;
  }
}
