import 'package:intl/intl.dart';

class DateFormatter {

  String formatDate(DateTime? dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime!);
  }

}