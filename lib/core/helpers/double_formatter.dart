import 'package:money_formatter/money_formatter.dart';

extension DoubleFormatter on double {
  String currencyFormatted() =>
      MoneyFormatter(amount: this).output.symbolOnLeft;
}
