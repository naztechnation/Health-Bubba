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
  DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parseUtc(dateTime);
  var outputFormat = DateFormat('d MMMM');
  var outputDate = outputFormat.format(parseDate);

  return outputDate;
}

 static String formatDateOnly({required String dateTime}) {
    try {
      DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parseUtc(dateTime);
      var outputFormat = DateFormat('MMM d, yyyy');
      var outputDate = outputFormat.format(parseDate);
      return outputDate;
    } catch (e) {
      // Handle the error gracefully, e.g., return an empty string or a default value
      return 'Invalid date';
    }
  }

 

static String formatTimeOnly({required String dateTime}) {
   
  final DateTime dateTimes = DateFormat("HH:mm:ss.SSSSSS").parse(dateTime);

   
  final String formattedTime = DateFormat.jm().format(dateTimes);
  
  return formattedTime;
}

static String getHumanReadableDate(String dateTimeString,) {
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
   print(dateTimeString);
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

  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');
  static final timeFormat = DateFormat('hh:mm a');
  static final apiDateFormat = DateFormat('yyyy-MM-dd');
  static final utcTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  static final dayOfWeekFormat = DateFormat('EEEEE', 'en_US');
}
