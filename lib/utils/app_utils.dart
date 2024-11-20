import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static Size deviceScreenSize(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return queryData.size;
  }

  static String convertPrice(dynamic price, {bool showCurrency = false}) {
    var amount = price is String ? double.parse(price) : price;
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    return '${showCurrency ? 'NGN' : ''} ${formatCurrency.format(amount)}';
  }

  static DateTime timeToDateTime(TimeOfDay time, [DateTime? date]) {
    final newDate = date ?? DateTime.now();
    return DateTime(
        newDate.year, newDate.month, newDate.day, time.hour, time.minute);
  }

  static String formatComplexDate({required String dateTime}) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(dateTime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('d MMM y hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  static String formatComplexDateOnly({required String dateTime}) {
    DateTime parseDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parseUtc(dateTime);
    var outputFormat = DateFormat('d MMMM');
    var outputDate = outputFormat.format(parseDate);

    return outputDate;
  }

  static String formatDateOnly({required String dateTime}) {
    try {
      DateTime parseDate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parseUtc(dateTime);
      var outputFormat = DateFormat('MMM d, yyyy');
      var outputDate = outputFormat.format(parseDate);
      return outputDate;
    } catch (e) {
      return 'Invalid date';
    }
  }

  static String formatTimeOnly({required String dateTime}) {
    final DateTime dateTimes = DateFormat("HH:mm:ss").parse(dateTime);

    final String formattedTime = DateFormat.jm().format(dateTimes);

    return formattedTime;
  }

  static String getHumanReadableDate(
    String dateTimeString,
  ) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final DateTime now = DateTime.now();

    final Duration difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return "Today";
    } else if (difference.inDays == 1) {
      return "Yesterday";
    } else if (difference.inDays == -1) {
      return "Tomorrow";
    } else if (difference.inDays > 1 && difference.inDays <= 7) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays > 7 && difference.inDays <= 14) {
      return "Last Week";
    } else if (difference.inDays > 14 && difference.inDays <= 30) {
      return "Two Weeks Ago";
    } else if (difference.inDays > 30 && difference.inDays <= 60) {
      return "Last Month";
    } else if (difference.inDays > 60 && difference.inDays <= 90) {
      return "Two Months Ago";
    } else if (difference.inDays > 90) {
      return "${difference.inDays ~/ 30} months ago";
    } else if (difference.inDays < 0 && difference.inDays >= -7) {
      return "In ${-difference.inDays} days";
    } else if (difference.inDays < -7 && difference.inDays >= -30) {
      return "Next Month";
    } else {
      return "In the future";
    }
  }

  String timeAgoSinceDate(String dateString) {
    final DateTime inputDate = DateTime.parse(dateString);
    final DateTime currentDate = DateTime.now();
    final Duration diff = currentDate.difference(inputDate);

    if (diff.inDays >= 1) {
      if (diff.inDays == 1) {
        return 'Yesterday';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} days ago';
      } else if (diff.inDays < 30) {
        return '${diff.inDays ~/ 7} weeks ago';
      } else if (diff.inDays < 365) {
        return '${diff.inDays ~/ 30} months ago';
      } else {
        return '${diff.inDays ~/ 365} years ago';
      }
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hours ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  static String getTimeDifference(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final DateTime now = DateTime.now().add(const Duration(hours: 1));

    final Duration difference = now.difference(dateTime);

    if (difference.isNegative) {
      final Duration futureDifference = dateTime.difference(now);
      return "${formatTimeDuration(futureDifference)} from now";
    } else {
      if (difference.inMinutes < 1) {
        return "just now";
      } else if (difference.inHours < 1) {
        return "${difference.inMinutes} minutes ago";
      } else {
        return "${formatTimeDuration(difference)} ago";
      }
    }
  }

  static String formatTimeDuration(Duration duration) {
    if (duration.inDays > 0) {
      int hours = duration.inHours % 24;
      return "${duration.inDays} day${duration.inDays > 1 ? 's' : ''} and $hours hour${hours != 1 ? 's' : ''}";
    } else if (duration.inHours > 0) {
      int minutes = duration.inMinutes % 60;
      return "${duration.inHours} hour${duration.inHours != 1 ? 's' : ''} and $minutes minute${minutes != 1 ? 's' : ''}";
    } else if (duration.inMinutes > 0) {
      return "${duration.inMinutes} minute${duration.inMinutes != 1 ? 's' : ''}";
    } else {
      return "${duration.inSeconds} second${duration.inSeconds != 1 ? 's' : ''}";
    }
  }

  static bool isWithinFiveMinutes(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final DateTime now = DateTime.now();

    final Duration difference = now.difference(dateTime).abs();

    return difference.inMinutes <= 5;
  }

  static String formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return "${duration.inDays} days";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} hours";
    } else if (duration.inMinutes > 0) {
      return "${duration.inMinutes} minutes";
    } else if (duration.inSeconds > 0) {
      return "${duration.inSeconds} seconds";
    } else {
      return "just now";
    }
  }

  static bool isPastDateTime(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final DateTime now = DateTime.now();

    return dateTime.isBefore(now);
  }

 static bool isInFiveMins(String timeCheck) {
    switch (timeCheck) {
      case "just now":
        return true;
      case "1 minutes ago":
        return true;
      case "1 minute ago":
        return true;
      case "2 minutes ago":
        return true;
      case "3 minutes ago":
        return true;
      case "4 minutes ago":
        return true;
      case "5 minutes ago":
        return true;

      case "1 seconds ago":
        return true;
      case "1 second ago":
        return true;
      case "2 seconds ago":
        return true;
      case "3 seconds ago":
        return true;
      case "4 seconds ago":
        return true;
      case "5 seconds ago":
        return true;
      case "6 seconds ago":
        return true;
      case "7 seconds ago":
        return true;
      case "8 seconds ago":
        return true;
      case "9 seconds ago":
        return true;
      case "10 seconds ago":
        return true;
      case "11 seconds ago":
        return true;
      case "12 seconds ago":
        return true;
      case "13 seconds ago":
        return true;
      case "14 seconds ago":
        return true;
      case "15 seconds ago":
        return true;
      case "16 seconds ago":
        return true;
      case "17 seconds ago":
        return true;
      case "18 seconds ago":
        return true;
      case "19 seconds ago":
        return true;
      case "20 seconds ago":
        return true;
      case "21 seconds ago":
        return true;
      case "22 seconds ago":
        return true;
      case "23 seconds ago":
        return true;
      case "24 seconds ago":
        return true;
      case "25 seconds ago":
        return true;
      case "26 seconds ago":
        return true;
      case "27 seconds ago":
        return true;
      case "28 seconds ago":
        return true;
      case "29 seconds ago":
        return true;
      case "30 seconds ago":
        return true;
      case "31 seconds ago":
        return true;
      case "32 seconds ago":
        return true;
      case "33 seconds ago":
        return true;
      case "34 seconds ago":
        return true;
      case "35 seconds ago":
        return true;
      case "36 seconds ago":
        return true;
      case "37 seconds ago":
        return true;
      case "38 seconds ago":
        return true;
      case "39 seconds ago":
        return true;
      case "40 seconds ago":
        return true;
      case "41 seconds ago":
        return true;
      case "42 seconds ago":
        return true;
      case "43 seconds ago":
        return true;
      case "44 seconds ago":
        return true;
      case "45 seconds ago":
        return true;
      case "46 seconds ago":
        return true;
      case "47 seconds ago":
        return true;
      case "48 seconds ago":
        return true;
      case "49 seconds ago":
        return true;
      case "50 seconds ago":
        return true;
      case "51 seconds ago":
        return true;
      case "52 seconds ago":
        return true;
      case "53 seconds ago":
        return true;
      case "54 seconds ago":
        return true;
      case "55 seconds ago":
        return true;
      case "56 seconds ago":
        return true;
      case "57 seconds ago":
        return true;
      case "58 seconds ago":
        return true;
      case "59 seconds ago":
        return true;
      case "60 seconds ago":
        return true;
      case "1 minute from now":
        return true;
      case "1 minutes from now":
        return true;
      case "2 minutes from now":
        return true;
      case "3 minutes from now":
        return true;
      case "4 minutes from now":
        return true;
      case "5 minutes from now":
        return true;
      case "1 seconds from now":
        return true;
      case "1 second from now":
        return true;
      case "2 seconds from now":
        return true;
      case "3 seconds from now":
        return true;
      case "4 seconds from now":
        return true;
      case "5 seconds from now":
        return true;
      case "6 seconds from now":
        return true;
      case "7 seconds from now":
        return true;
      case "8 seconds from now":
        return true;
      case "9 seconds from now":
        return true;
      case "10 seconds from now":
        return true;
      case "11 seconds from now":
        return true;
      case "12 seconds from now":
        return true;
      case "13 seconds from now":
        return true;
      case "14 seconds from now":
        return true;
      case "15 seconds from now":
        return true;
      case "16 seconds from now":
        return true;
      case "17 seconds from now":
        return true;
      case "18 seconds from now":
        return true;
      case "19 seconds from now":
        return true;
      case "20 seconds from now":
        return true;
      case "21 seconds from now":
        return true;
      case "22 seconds from now":
        return true;
      case "23 seconds from now":
        return true;
      case "24 seconds from now":
        return true;
      case "25 seconds from now":
        return true;
      case "26 seconds from now":
        return true;
      case "27 seconds from now":
        return true;
      case "28 seconds from now":
        return true;
      case "29 seconds from now":
        return true;
      case "30 seconds from now":
        return true;
      case "31 seconds from now":
        return true;
      case "32 seconds from now":
        return true;
      case "33 seconds from now":
        return true;
      case "34 seconds from now":
        return true;
      case "35 seconds from now":
        return true;
      case "36 seconds from now":
        return true;
      case "37 seconds from now":
        return true;
      case "38 seconds from now":
        return true;
      case "39 seconds from now":
        return true;
      case "40 seconds from now":
        return true;
      case "41 seconds from now":
        return true;
      case "42 seconds from now":
        return true;
      case "43 seconds from now":
        return true;
      case "44 seconds from now":
        return true;
      case "45 seconds from now":
        return true;
      case "46 seconds from now":
        return true;
      case "47 seconds from now":
        return true;
      case "48 seconds from now":
        return true;
      case "49 seconds from now":
        return true;
      case "50 seconds from now":
        return true;
      case "51 seconds from now":
        return true;
      case "52 seconds from now":
        return true;
      case "53 seconds from now":
        return true;
      case "54 seconds from now":
        return true;
      case "55 seconds from now":
        return true;
      case "56 seconds from now":
        return true;
      case "57 seconds from now":
        return true;
      case "58 seconds from now":
        return true;
      case "59 seconds from now":
        return true;
      case "60 seconds from now":
        return true;

      default:
        return false;
    }
  }

  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');
  static final timeFormat = DateFormat('hh:mm a');
  static final apiDateFormat = DateFormat('yyyy-MM-dd');
  static final utcTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  static final dayOfWeekFormat = DateFormat('EEEEE', 'en_US');
}
