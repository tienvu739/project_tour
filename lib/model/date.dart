import 'package:intl/intl.dart';

extension DateExtension on DateTime
{
  String get getStarDate {
    DateFormat transactionDateForm = DateFormat('dd MMM');
    return transactionDateForm.format(this);
  }
  String get getEndDate {
    DateFormat transactionDateForm = DateFormat('dd MMM yyyy');
    return transactionDateForm.format(this);
  }
}