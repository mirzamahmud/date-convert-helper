class TimeOfDayHelper{

  static String formatTimeOfDayFromInt({required int dateTimeValue}){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dateTimeValue * 1000);
    int hour = dateTime.hour;
    if(hour >= 5 && hour < 12){
      return "Morning";
    }else if(hour >= 12 && hour < 15){
      return "Noon";
    }else if(hour >= 15 && hour < 18){
      return "Afternoon";
    }else if(hour >= 18 && hour < 21){
      return "Evening";
    }else{
      return "Night";
    }
  }

  static String formatTimeOfDayFromString({required String dateTimeValue}){
    DateTime dateTime = DateTime.parse(dateTimeValue);
    int hour = dateTime.hour;
    if(hour >= 5 && hour < 12){
      return "Morning";
    }else if(hour >= 12 && hour < 15){
      return "Noon";
    }else if(hour >= 15 && hour < 18){
      return "Afternoon";
    }else if(hour >= 18 && hour < 21){
      return "Evening";
    }else{
      return "Night";
    }
  }
}