import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TimeStampDateHelper{

  static String formatTimestampDateTime({
    String? locale,
    String? formatPattern,
    required Timestamp time
  }){
    return DateFormat(formatPattern, locale).format(time.toDate());
  }
}