import 'package:intl/intl.dart';

class CurrencyUtility {
  static NumberFormat getFormatter() {
    return NumberFormat.currency(
      locale: 'eu',
      customPattern: '#,### \u00a4',
      symbol: "€",
      decimalDigits: 0,
    );
  }
}
