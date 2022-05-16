import 'package:intl/intl.dart';

class DateHelper {
  static String? changeFormatIdToDateTimeFormat({DateTime? date}) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date);
    }
    return null;
  }

  static DateTime? convertStringToDateTime(String? date) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').parse(date);
    }
    return null;
  }
}
