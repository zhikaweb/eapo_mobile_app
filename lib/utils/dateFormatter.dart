import 'package:intl/intl.dart';

class DateFormatter {

  String formatDate(DateTime? dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime!);
  }

}