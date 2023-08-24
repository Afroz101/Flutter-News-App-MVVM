import 'package:intl/intl.dart';

abstract class DataFormat {
  static String formatDate(String inputDate) {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    final outputFormat = DateFormat("MMMM d, yyyy");

    try {
      final date = inputFormat.parse(inputDate);
      return outputFormat.format(date);
    } catch (e) {}

    return "";
  }
}
