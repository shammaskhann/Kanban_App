import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHelper {
  // Constant format for date storage/display
  static const String dateFormat = 'yyyy-MM-dd';
  static final DateFormat _dateFormatter = DateFormat(dateFormat);

  // ==========================================
  // DATE FORMATTING (YYYY-MM-DD)
  // ==========================================

  /// Convert DateTime to String ("2016-09-04")
  static String formatDate(DateTime date) {
    return _dateFormatter.format(date);
  }

  /// Convert String ("2016-09-04") to DateTime
  /// Returns null if the string format is invalid.
  static DateTime? parseDate(String dateString) {
    try {
      return _dateFormatter.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  // ==========================================
  // TIME <-> SECONDS (Integer)
  // ==========================================

  /// Converts TimeOfDay to total seconds (Int)
  /// Example: TimeOfDay(hour: 1, minute: 30) -> 5400
  static int timeToSeconds(TimeOfDay time) {
    return time.hour * 3600 + time.minute * 60;
  }

  /// Converts total seconds (Int) to TimeOfDay
  /// Example: 5400 -> TimeOfDay(hour: 1, minute: 30)
  static TimeOfDay secondsToTimeOfDay(int seconds) {
    final hour = (seconds / 3600).floor();
    final minute = ((seconds % 3600) / 60).floor();
    return TimeOfDay(hour: hour, minute: minute);
  }

  // ==========================================
  // TIME STRING <-> SECONDS (HH:MM:SS)
  // ==========================================

  /// Converts Seconds (Int) to String (HH:MM:SS)
  /// Example: 3661 -> "01:01:01"
  static String secondsToTimeString(int seconds) {
    int hours = (seconds / 3600).floor();
    int minutes = ((seconds % 3600) / 60).floor();
    int secs = seconds % 60;

    // Pad with leading zeros
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secsStr = secs.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secsStr';
  }

  // if under 60 seconds show only 05s , if in minutes then show only MM:SS
  static String secondsToShortTimeString(int seconds) {
    try {
      if (seconds < 60) {
        return '${seconds}s';
      } else if (seconds < 3600) {
        int minutes = (seconds / 60).floor();
        int secs = seconds % 60;
        String minutesStr = minutes.toString().padLeft(2, '0');
        String secsStr = secs.toString().padLeft(2, '0');
        return '$minutesStr:$secsStr';
      } else {
        return secondsToTimeString(seconds);
      }
    } catch (e) {
      return '0s';
    }
  }

  /// Converts String (HH:MM:SS) to Seconds (Int)
  /// Example: "01:01:01" -> 3661
  static int timeStringToSeconds(String timeString) {
    try {
      final parts = timeString.split(':');
      if (parts.length != 3) return 0;

      int hours = int.parse(parts[0]);
      int minutes = int.parse(parts[1]);
      int seconds = int.parse(parts[2]);

      return (hours * 3600) + (minutes * 60) + seconds;
    } catch (e) {
      return 0;
    }
  }
}
