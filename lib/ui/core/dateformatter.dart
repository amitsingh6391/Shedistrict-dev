import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  String getVerboseDateTimeRepresentation(Timestamp dateString) {
    DateTime dateTime = DateTime.parse(dateString.toDate().toString());
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return "Just Now";
    }

    String roughTimeString = DateFormat('jm').format(dateTime);

    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return "Today, " + DateFormat('hh:mm a').format(dateTime);
    }

    DateTime yesterday = now.subtract(Duration(days: 1));

    if (localDateTime.day == yesterday.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return "Yesterday, " + DateFormat('hh:mm a').format(dateTime);
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
  }
}