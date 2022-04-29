import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String parseToDayMonthYear() => DateFormat("dd/MM/yyyy").format(this);
}
