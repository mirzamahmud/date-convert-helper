import 'package:date_convert_helper/date_convert_helper.dart';
import 'package:intl/intl.dart';

/// [DateConvertHelper] class works like a helper to convert any types of date time data, such as [DateTime] and [APIs] data,
/// this helper class contains such methods those will help us to format date as our desire date format.
class DateConvertHelper{

  /// this method is used to format date time from [String] type data.
  /// [formatDateTimeFromString] method has three params.
  /// [dateTimeValue] param is used for store data which will come from [APIs] or other sources. It is [String] type data
  /// [formatPattern] param is optional. It is [String] and representing desire pattern that is used for formatting [dateTimeValue].
  /// example of the [formatPattern] - "yyyy-mm-dd", "dd MMMM, yyyy", and etc...
  static String formatDateTimeFromString({
    required String dateTimeValue,
    String? formatPattern,
  }){
    DateTime parsedDate = DateTime.parse(dateTimeValue);
    return DateFormat(formatPattern).format(parsedDate);
  }

  /// this method is used to format date time from [DateTime] type data.
  /// [formatDateFromDatetime] method has three params.
  /// [dateTimeValue] param is used for store data which will come from [DateTime].
  /// [formatPattern] param is optional. It is [String] and representing desire pattern that is used for formatting [dateTimeValue].
  /// example of the [formatPattern] - "yyyy-mm-dd", "dd MMMM, yyyy", and etc...
  static String formatDateFromDatetime({
    required DateTime dateTimeValue,
    String? formatPattern,
  }) {
    return DateFormat(formatPattern).format(dateTimeValue);
  }

  /// this method is used to format local date time from [IsoString].
  /// [formatIsoStringToLocalDatetime] method has one param.
  /// [dateTimeValue] is [String] type required param and used to store data which will come from [APIs] or other sources as iso date time format.
  static DateTime formatIsoStringToLocalDatetime({
    required String dateTimeValue,
  }) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTimeValue, true).toLocal();
  }

  /// this method is used to format local date only from [IsoString].
  /// [isoStringToLocalTimeOnly] method has three params.
  /// [dateTimeValue] is [String] type required param and used to store data which will come from [APIs] or other sources as iso date time format.
  /// [formatDatePattern] param is optional. It is [String] and representing desire pattern that is used for formatting [dateTimeValue].
  /// example of the [formatDatePattern] - "yyyy/mm/dd", "yyyy-mm-dd", "dd MMMM, yyyy", and etc...
  static String isoStringToLocalDateOnly({
    required String dateTimeValue,
    String? formatDatePattern,
  }) {
    return DateFormat(formatDatePattern).format(formatIsoStringToLocalDatetime(dateTimeValue: dateTimeValue));
  }

  /// this method is used to format local time only from [IsoString].
  /// [isoStringToLocalTimeOnly] method has three params.
  /// [dateTimeValue] is [String] type required param and used to store data which will come from [APIs] or other sources as iso date time format.
  /// [formatTimePattern] param is optional. It is [String] and representing desire pattern that is used for formatting [dateTimeValue].
  /// example of the [formatTimePattern] - "hh:mm:ss", "hh:mm aa", and etc...
  static String isoStringToLocalTimeOnly({
    required String dateTimeValue,
    String? formatTimePattern,
  }) {
    return DateFormat(formatTimePattern).format(formatIsoStringToLocalDatetime(dateTimeValue: dateTimeValue));
  }

  /// this method is used just to convert time to time
  /// [convertTimeToTime] method has two params.
  /// [dateTimeValue] is [String] type required param and used to store data which will come from [APIs] or other sources as iso date time format.
  /// the returning result of this method like - [08:59 PM]
  static String convertTimeToTime({
    required String dateTimeValue,
  }) {
    return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(dateTimeValue));
  }

  /// this method is used to format weekday from [DateTime]
  /// [formatWeekdayFromDatetime] method has three params.
  /// [dateTimeValue] param is required and used for store data which will come from [DateTime].
  /// [dayOfWeekEnum] param is required and represent a [Enum]. It is used for weekday name as short form and full form.
  /// More specifically if [DayOfWeekEnum.short] weekday name will be "Thu" and [DayOfWeekEnum.full] weekday will be "Thursday"
  static String formatWeekdayFromDatetime({
    required DateTime dateTimeValue,
    required DayOfWeekEnum dayOfWeekEnum
  }){
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(dateTimeValue);
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(dateTimeValue);
      default:
        return DateFormat("EEEEE").format(dateTimeValue);
    }
  }

  /// this method is used to format weekday from [String]
  /// [formatWeekdayFromString] method has three params.
  /// [dateTimeValue] is [String] type required param and used for store data which will come from [APIs] or other sources.
  /// [dayOfWeekEnum] param is required and represent a [Enum]. It is used for weekday name as short form and full form.
  /// More specifically if [DayOfWeekEnum.short] weekday name will be "Thu" and [DayOfWeekEnum.full] weekday will be "Thursday"
  static String formatWeekdayFromString({
    required String dateTimeValue,
    required DayOfWeekEnum dayOfWeekEnum,
  }){
    DateTime parseTime = DateTime.parse(dateTimeValue);
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(parseTime);
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(parseTime);
      default:
        return DateFormat("EEEEE").format(parseTime);
    }
  }

  /// this method is used to format weekday from [IsoString]
  /// [formatWeekdayFromIsoString] method has three params.
  /// [dateTimeValue] is [String] type required param and used for store data which will come from [APIs] or other sources as iso date time format.
  /// [dayOfWeekEnum] param is required and represent a [Enum]. It is used for weekday name as short form and full form.
  /// More specifically if [DayOfWeekEnum.short] weekday name will be "Thu" and [DayOfWeekEnum.full] weekday will be "Thursday"
  static String formatWeekdayFromIsoString({
    required String dateTimeValue,
    required DayOfWeekEnum dayOfWeekEnum,
    String? locale
  }){
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(formatIsoStringToLocalDatetime(dateTimeValue: dateTimeValue));
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(formatIsoStringToLocalDatetime(dateTimeValue: dateTimeValue));
      default:
        return DateFormat("EEEEE").format(formatIsoStringToLocalDatetime(dateTimeValue: dateTimeValue));
    }
  }

  /// this method is used to format date time from Utc to Local
  /// [formatDateTimeFromUtcToLocal] method has three params
  /// [dateTimeValue] is [String] type required param and used to store data which will come from [APIs] or other sources as Utc format.
  /// [formatPattern] param is optional. It is [String] and representing desire pattern that is used for formatting [dateTimeValue].
  /// example of the [formatPattern] - "yyyy-mm-dd", "hh:mm:ss", "hh:mm aa", and etc...
  static String formatDateTimeFromUtcToLocal({
    required String dateTimeValue,
    String? formatPattern,
  }) {
    try{
      DateTime dateTimeUtc = DateTime.parse(dateTimeValue);
      DateTime dateTimeLocal = dateTimeUtc.toLocal();
      String formattedDate = DateFormat(formatPattern).format(dateTimeLocal);
      return formattedDate;
    }catch(e){
      return "---";
    }
  }
}