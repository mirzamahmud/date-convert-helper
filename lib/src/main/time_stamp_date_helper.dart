import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class TimeStampDateHelper{
  static String formatTimestampDateOnly(String formatPattern, Timestamp time){
    return DateFormat(formatPattern).format(time.toDate());
  }
}