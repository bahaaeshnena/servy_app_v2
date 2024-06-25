import 'package:intl/intl.dart';

class MyDateTime {
  static DateTime _parseTime(String time) {
    try {
      // Attempt to parse as Unix timestamp (milliseconds since epoch)
      return DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    } catch (e) {
      // Attempt to parse as datetime string
      try {
        return DateTime.parse(time);
      } catch (e) {
        // Handle invalid format
        throw FormatException("Invalid input for date formatting: $time");
      }
    }
  }

  static DateTime dateFormat(String time) {
    DateTime dt = _parseTime(time);
    return DateTime(dt.year, dt.month, dt.day);
  }

  static String timeDate(String time) {
    DateTime dt = _parseTime(time);
    return DateFormat('jm').format(dt).toString();
  }

  static String dateAndTime(String time) {
    DateTime dt = _parseTime(time);
    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    final t = DateTime(today.year, today.month, today.day);
    final y = DateTime(yesterday.year, yesterday.month, yesterday.day);
    final d = DateTime(dt.year, dt.month, dt.day);

    if (d == t) {
      return 'Today';
    } else if (d == y) {
      return 'Yesterday';
    } else if (dt.year == today.year) {
      return DateFormat.MMMd().format(dt).toString();
    } else {
      return DateFormat.MMMd().format(dt).toString();
    }
  }
}
