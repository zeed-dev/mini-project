import 'package:intl/intl.dart';

class DateHelper {
  static String? changeFormatIdToDateTimeFormat({DateTime? date}) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date);
    }
    return null;
  }

  static String? changeFormatIdToYear(DateTime? date) {
    if (date != null) {
      return DateFormat('yyyy').format(date);
    }
    return null;
  }

  static String changeFormatIdToMonth(DateTime date) {
    return DateFormat('MMMM').format(date);
  }

  static String? changeFormatYYYYMM({DateTime? date}) {
    if (date != null) {
      return DateFormat('yyyy/MM').format(date);
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
