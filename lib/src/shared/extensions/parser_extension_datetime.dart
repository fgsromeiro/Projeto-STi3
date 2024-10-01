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

  String calculateAge() {
    DateTime dataAtual = DateTime.now();

    int idade = dataAtual.year - year;

    if (dataAtual.month < month ||
        (dataAtual.month == month && dataAtual.day < day)) {
      idade--;
    }

    if (idade <= 20) {
      return 'Até 20 anos';
    } else if (idade <= 30) {
      return '20-30 anos';
    } else {
      return 'Acima de 30 anos';
    }
  }
}
