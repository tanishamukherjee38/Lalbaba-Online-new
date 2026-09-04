// Date and time formatting helpers.
// Why: Keep date/time formatting consistent across the application.
// Date utility helpers.
// Why: Provides reusable date and time formatting functions
// throughout the application.

class DateUtilsHelper {
  DateUtilsHelper._();

  /// Formats a DateTime as: 04 Sep 2026
  static String formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day.toString().padLeft(2, '0')} '
        '${months[date.month - 1]} '
        '${date.year}';
  }

  /// Formats a DateTime as: 04/09/2026
  static String formatDateShort(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  /// Formats a DateTime as: 02:30 PM
  static String formatTime(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';

    return '$hour:$minute $period';
  }

  /// Formats a DateTime as: 04 Sep 2026, 02:30 PM
  static String formatDateTime(DateTime date) {
    return '${formatDate(date)}, ${formatTime(date)}';
  }

  /// Returns today's date without time information.
  static DateTime today() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day);
  }

  /// Checks whether the given date is today.
  static bool isToday(DateTime date) {
    final now = DateTime.now();

    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Checks whether the given date is in the past.
  static bool isPast(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  /// Checks whether the given date is in the future.
  static bool isFuture(DateTime date) {
    return date.isAfter(DateTime.now());
  }
}
