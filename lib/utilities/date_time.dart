class ConvertDateTime {
  static DateTime parseDateTime(String dateTimeString) {
    DateTime date = DateTime.parse(dateTimeString);
    DateTime utcDate = DateTime.utc(
        date.year, date.month, date.day, date.hour, date.minute, date.second);
    return utcDate.toLocal();
  }

  static String returnMonthName(int monthNumber) {
    switch (monthNumber) {
      case 1:
        {
          return 'January';
        }
        break;

      case 2:
        {
          return 'February';
        }
        break;
      case 3:
        {
          return 'March';
        }
        break;
      case 4:
        {
          return 'April';
        }
        break;
      case 5:
        {
          return 'May';
        }
        break;
      case 6:
        {
          return 'June';
        }
        break;
      case 7:
        {
          return 'July';
        }
        break;
      case 8:
        {
          return 'August';
        }
        break;
      case 9:
        {
          return 'September';
        }
        break;
      case 10:
        {
          return 'October';
        }
        break;
      case 11:
        {
          return 'November';
        }
        break;
      case 12:
        {
          return 'December';
        }
        break;
      default:
        {
          return '';
        }
    }
  }

  static String durationFromEvent(DateTime dateTime) {
    int _dateYearDifference = _getNumberOfYears(dateTime);
    int _dateMonthDifference = _getNumberOfMonths(dateTime);
    int _dateDaysDifference = DateTime.now().difference(dateTime).inDays;
    if (_dateYearDifference <= 0 &&
        _dateMonthDifference <= 0 &&
        _dateDaysDifference < 1) {
      return 'Today';
    } else if (_dateYearDifference <= 0 &&
        _dateMonthDifference <= 0 &&
        _dateDaysDifference == 1) {
      return 'Yesterday';
    } else {
      return '${ConvertDateTime.returnMonthName(dateTime.month)} ${dateTime.day} ';
    }
  }

  static int _getNumberOfMonths(DateTime d1) {
    int _daysDifference = DateTime.now().difference(d1).inDays;
    return _daysDifference ~/ 30;
  }

  static int _getNumberOfYears(DateTime d1) {
    int _daysDifference = DateTime.now().difference(d1).inDays;
    return _daysDifference ~/ 365;
  }
}
