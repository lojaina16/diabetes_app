
extension FormatTime on DateTime {
  String get formatDate => '$day/$month/$year';
  String get formatTime {
    int hours = hour;
    if (hour > 12) {
      hours -= 12;
    } else if (hour == 0) {
      hours = 12;
    }

    return '${hours.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String get period {
    String period = "AM";
    if (hour >= 12) {
      period = "PM";
    }
    return period;
  }

 

  String get chatFormat => "$formatTime $period";
  bool isSame(DateTime dateTime) {
    return dateTime.year == year &&
        dateTime.month == month &&
        dateTime.day == day;
  }
}