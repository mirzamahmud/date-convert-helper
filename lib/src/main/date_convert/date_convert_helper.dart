import 'package:date_convert_helper/date_convert_helper.dart';
import 'package:intl/intl.dart';

/// [DateConvertHelper] class works like a helper to convert any types of date time data, such as [DateTime], [TimeStamp], and [APIs] data,
/// this helper class contains such methods those will help us to format date as our desire date format.
class DateConvertHelper{

  /// [formatDateOnly], this method is used to format [API] date time data to String
  /// this method has two params
  /// [dateTime] which is a [String] type data come from the server and another is
  /// [datePatternEnum], it is an enum that representing which pattern the date will be formatted
  static String formatDateOnly(String dateTime, DatePatternEnum datePatternEnum){
    DateTime parsedDate = DateTime.parse(dateTime);
    switch(datePatternEnum){
      case DatePatternEnum.withDash:
        return DateFormat("dd-mm-yyyy").format(parsedDate);
      case DatePatternEnum.withSlash:
        return DateFormat("dd/mm/yyyy").format(parsedDate);
      default:
        return DateFormat("dd MM, yyyy").format(parsedDate);
    }
  }

  /// [formatTimeOnly], this method is used to format [API] date time data to String,
  /// [dateTime] which is a [String] type data come from the server and another is
  static String formatTimeOnly(String dateTime){
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat("hh:mm").format(parsedDate);
  }

  /// [formatTimeWithSecond], this method is used to format [API] date time data to String,
  /// [dateTime] which is a [String] type data come from the server and another is
  static String formatTimeWithSecond(String dateTime){
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat("hh:mm:ss").format(parsedDate);
  }

  /// [formatDateOnly], this method is used to format [API] date time data to String
  /// this method has two params
  /// [dateTime] which is a [String] type data come from the server and another is
  /// [datePatternEnum], it is an enum that representing which pattern the date will be formatted
  static String formatDateAndTime(String dateTime, DatePatternEnum datePatternEnum){
    DateTime parsedDate = DateTime.parse(dateTime);
    switch(datePatternEnum){
      case DatePatternEnum.withDash:
        return DateFormat("dd-mm-yyyy hh:mm:ss").format(parsedDate);
      case DatePatternEnum.withSlash:
        return DateFormat("dd/mm/yyyy hh:mm:ss").format(parsedDate);
      default:
        return DateFormat("dd MM, yyyy hh:mm:ss").format(parsedDate);
    }
  }

  /// [formatDateWithDash], this method is used to format DateTime data to String and separate between dash,
  /// this method contains two params,
  /// [DateTime] param passes date time data and
  /// [DateFormatEnum] param represents how formatted data looks like
  static String formatDateWithDash(DateTime dateTime, DateFormatEnum dateFormatEnum){
    switch(dateFormatEnum){
      case DateFormatEnum.startWithYear:
        return DateFormat("yyyy-mm-dd").format(dateTime); /// return date in [Year-Month-Day] format
      case DateFormatEnum.startWithMonth:
        return DateFormat('mm-dd-yyyy').format(dateTime); /// return date in [Month-Day-Year] format
      case DateFormatEnum.startWithDay:
        return DateFormat('dd-mm-yyyy').format(dateTime); /// return date in [Day-Month-Year] format
      default:
        return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    }
  }

  /// [formatDateWithDash], this method is used to format DateTime data to String and separate between dash,
  /// this method contains two params,
  /// [DateTime] param passes date time data and
  /// [DateFormatEnum] param represents how formatted data looks like
  static String formatDateAndTimeWithDash(DateTime dateTime, DateFormatEnum dateFormatEnum){
    switch(dateFormatEnum){
      case DateFormatEnum.startWithYear:
        return DateFormat("yyyy-mm-dd hh:mm").format(dateTime); /// return date in [Year-Month-Day] format
      case DateFormatEnum.startWithMonth:
        return DateFormat('mm-dd-yyyy hh:mm').format(dateTime); /// return date in [Month-Day-Year] format
      case DateFormatEnum.startWithDay:
        return DateFormat('dd-mm-yyyy hh:mm').format(dateTime); /// return date in [Day-Month-Year] format
      default:
        return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    }
  }

  /// [formatDateWithSlash], this method is used to format DateTime data to String and separate between slash,
  /// this method contains two params,
  /// [DateTime] param passes date time data and
  /// [DateFormatEnum] param represents how formatted data looks like
  static String formatDateWithSlash(DateTime dateTime, DateFormatEnum dateFormatEnum){
    switch(dateFormatEnum){
      case DateFormatEnum.startWithYear:
        return DateFormat("yyyy/mm/dd").format(dateTime); /// return date in [Year-Month-Day] format
      case DateFormatEnum.startWithMonth:
        return DateFormat('mm/dd/yyyy').format(dateTime); /// return date in [Month-Day-Year] format
      case DateFormatEnum.startWithDay:
        return DateFormat('dd/mm/yyyy').format(dateTime); /// return date in [Day-Month-Year] format
      default:
        return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    }
  }

  /// [formatDateWithSlash], this method is used to format DateTime data to String and separate between slash,
  /// this method contains two params,
  /// [DateTime] param passes date time data and
  /// [DateFormatEnum] param represents how formatted data looks like
  static String formatDateAndTimeWithSlash(DateTime dateTime, DateFormatEnum dateFormatEnum){
    switch(dateFormatEnum){
      case DateFormatEnum.startWithYear:
        return DateFormat("yyyy/mm/dd hh:mm").format(dateTime); /// return date in [Year-Month-Day] format
      case DateFormatEnum.startWithMonth:
        return DateFormat('mm/dd/yyyy hh:mm').format(dateTime); /// return date in [Month-Day-Year] format
      case DateFormatEnum.startWithDay:
        return DateFormat('dd/mm/yyyy hh:mm').format(dateTime); /// return date in [Day-Month-Year] format
      default:
        return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
    }
  }

  /// ---- this method is used to convert [DateTime] to estimated date ----
  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MM, yyyy').format(dateTime);
  }

  /// ---- this method is used to convert [DateTime] to estimated date and time ----
  static String estimatedDateTime(DateTime dateTime) {
    return DateFormat('dd MMM, yyyy  hh:mm a').format(dateTime);
  }

  /// ---- this method is used to convert [DateTime] to estimated time only ----
  static String estimatedTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  /// ---- this method is used to convert [String] time to [DateTime] ----
  static DateTime convertStringToDateTime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm").parse(dateTime);
  }

  /// ---- this method is used to convert iso to [String] ----
  static String convertIsoToString(String dateTime){
    DateTime time = convertStringToDateTime(dateTime);
    String result = DateFormat('dd MMM yyyy hh:mm aa',).format(time);
    return result;
  }

  /// ---- this method is used to convert [isoString] to local date ----
  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }

  /// ---- this method is used to convert [isoString] to local time only ----
  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm aa').format(isoStringToLocalDate(dateTime));
  }

  /// ---- this method is used to convert [isoString] to local AM or PM only ----
  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  /// ---- this method is used to convert [isoString] to local date only ----
  static String isoStringToLocalDateOnly(String dateTime) {
    try{
      return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
    }catch(v){
      return "--";
    }
  }
  static String isoStringToLocalFormattedDateOnly(String dateTime) {
    try{
      return DateFormat('dd MMM, yyyy').format(isoStringToLocalDate(dateTime));
    }catch(v){
      return "---";
    }
  }

  /// ---- this method is used for converting one time to another time ----
  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(time));
  }

  /// ---- this method is used to format [DateTime] to day of the week
  static String dayOfTheWeek(DateTime dateTime, DayOfWeekEnum dayOfWeekEnum){
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(dateTime);
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(dateTime);
      default:
        return DateFormat("EEEEE").format(dateTime);
    }
  }

  /// ---- this method is used to format [String] to day of the week
  static String dayOfTheWeekFromString(String dateTime, DayOfWeekEnum dayOfWeekEnum){
    DateTime parseTime = DateTime.parse(dateTime);
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(parseTime);
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(parseTime);
      default:
        return DateFormat("EEEEE").format(parseTime);
    }
  }

  /// ---- this method is used to format [isoStringTime] to day of the week
  static String dayOfTheWeekFromIsoString(String dateTime, DayOfWeekEnum dayOfWeekEnum){
    switch(dayOfWeekEnum){
      case DayOfWeekEnum.short:
        return DateFormat("E").format(isoStringToLocalDate(dateTime));
      case DayOfWeekEnum.full:
        return DateFormat("EEEE").format(isoStringToLocalDate(dateTime));
      default:
        return DateFormat("EEEEE").format(isoStringToLocalDate(dateTime));
    }
  }

  /// ---- this method is used to convert [DateTimeUtc] to local date
  String formatDateFromUtcToLocal(String value) {
    DateTime dateTimeUtc = DateTime.parse(value);
    DateTime dateTimeLocal = dateTimeUtc.toLocal();
    String formattedDate = DateFormat('dd MM, yyyy').format(dateTimeLocal);
    return formattedDate;
  }

  /// ---- this method is used to convert [DateTimeUtc] to local time
  String formatTimeFromUtcToLocal(String value) {
    DateTime dateTimeUtc = DateTime.parse(value);
    DateTime dateTimeLocal = dateTimeUtc.toLocal();
    String formattedDate = DateFormat('hh:mm a').format(dateTimeLocal);
    return formattedDate;
  }
}