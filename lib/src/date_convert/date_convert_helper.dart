import 'package:date_convert_helper/date_convert_helper.dart';
import 'package:intl/intl.dart';

/// [DateConvertHelper] class works like a helper to convert any types of date time data, such as [DateTime], [TimeStamp], and [APIs] data,
/// this helper class contains such methods those will help us to format date as our desire date format.
class DateConvertHelper{

  static String formatDateTimeFromString({required String dateTimeValue, String? formatPattern, String? locale}){
    DateTime parsedDate = DateTime.parse(dateTimeValue);
    return DateFormat(formatPattern, locale).format(parsedDate);
  }

  /// ---- this method is used to convert [DateTime] to estimated date ----
  static String formatDateFromDatetime({required DateTime dateTimeValue, String? formatPattern, String? locale}) {
    return DateFormat(formatPattern, locale).format(dateTimeValue);
  }

  /// ---- this method is used to convert [isoString] to local date ----
  static DateTime isoStringToLocalDate({required String dateTimeValue}) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTimeValue, true).toLocal();
  }

  /// ---- this method is used to convert [isoString] to local time only ----
  static String isoStringToLocalTimeOnly({required String dateTimeValue, String? formatPattern, String? locale}) {
    return DateFormat(formatPattern, locale).format(isoStringToLocalDate(dateTimeValue: dateTimeValue));
  }

  /// ---- this method is used for converting one time to another time ----
  static String convertTimeToTime({required String dateTimeValue, String? locale}) {
    return DateFormat('hh:mm a', locale).format(DateFormat('hh:mm:ss').parse(dateTimeValue));
  }

  /// ---- this method is used to format [String] to day of the week
  static String formatWeekdayFromDatetime({required DateTime dateTimeValue, required DayOfWeekEnum dayOfWeekEnum}){
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(dateTimeValue);
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(dateTimeValue);
      default:
        return DateFormat("EEEEE").format(dateTimeValue);
    }
  }

  /// ---- this method is used to format [String] to day of the week
  static String formatWeekdayFromString({
    required String dateTimeValue,
    required DayOfWeekEnum dayOfWeekEnum,
    String? locale
  }){
    DateTime parseTime = DateTime.parse(dateTimeValue);
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E", locale).format(parseTime);
      case DayOfWeekEnum.full:
        return DateFormat("EEEE", locale).format(parseTime);
      default:
        return DateFormat("EEEEE", locale).format(parseTime);
    }
  }

  /// ---- this method is used to format [isoStringTime] to day of the week
  static String formatWeekdayFromIsoString({
    required String dateTimeValue,
    required DayOfWeekEnum dayOfWeekEnum,
    String? locale
  }){
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E", locale).format(isoStringToLocalDate(dateTimeValue: dateTimeValue));
      case DayOfWeekEnum.full:
        return DateFormat("EEEE", locale).format(isoStringToLocalDate(dateTimeValue: dateTimeValue));
      default:
        return DateFormat("EEEEE", locale).format(isoStringToLocalDate(dateTimeValue: dateTimeValue));
    }
  }

  /// ---- this method is used to convert [DateTimeUtc] to local date
  String formatDateTimeFromUtcToLocal({
    required String dateTimeValue,
    String? formatPattern,
    String? locale
  }) {
    DateTime dateTimeUtc = DateTime.parse(dateTimeValue);
    DateTime dateTimeLocal = dateTimeUtc.toLocal();
    String formattedDate = DateFormat(formatPattern, locale).format(dateTimeLocal);
    return formattedDate;
  }
}