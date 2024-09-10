import 'package:intl/intl.dart';

/// [ActivityTimeHelper] class represents online activity of a user
/// [ActivityTimeHelper] basically need to build a chat application where we must to implement the online activity time of the users
class ActivityTimeHelper{

  /// [userOnlineActivity], by using this method, we can track how many times ago user was active in online
  static String userOnlineActivity(String time){
    final date = DateTime.now();
    final isoDate = DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(time, true).toLocal();
    final difference = date.difference(isoDate);

    if ((difference.inDays / 365).floor() >= 1) {
      int year = (difference.inDays/365).floor();
      return '$year year ago';
    }else if((difference.inDays / 30).floor() >= 1){
      int month = (difference.inDays/30).floor();
      return '$month month ago';
    }
    else if((difference.inDays / 7).floor() >= 1){
      int week = (difference.inDays/7).floor();
      return '$week week ago';
    }
    else if (difference.inDays >= 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    }  else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    }  else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Active Now';
    }
  }
}