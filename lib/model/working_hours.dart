import 'package:flutter/material.dart';

class DaySchedule {
  final String day;
  final bool isOpen;
  final List<Map<String, TimeOfDay>> timeSlots;

  DaySchedule({
    required this.day,
    required this.isOpen,
    required this.timeSlots,
  });
}


