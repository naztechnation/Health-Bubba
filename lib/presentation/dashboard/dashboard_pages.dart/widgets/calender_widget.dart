

import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';

import '../../../../model/view_model/book_appointment_viewmodel.dart';
import '../../../../res/app_colors.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
   

  @override
  Widget build(BuildContext context) {
    return Consumer<BookAppointmentViewModel>(
      builder: (context, calendarProvider, child) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300,width: 1), borderRadius: BorderRadius.circular(8)),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
          
            headerVisible: false,
          
            calendarStyle: CalendarStyle(
              defaultTextStyle: const TextStyle(color: AppColors.lightSecondary, fontSize: 13, fontWeight: FontWeight.w500), 
              weekendTextStyle: const TextStyle(color: AppColors.lightSecondary, fontSize: 13, fontWeight: FontWeight.w500), 
              todayTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),  
              todayDecoration:     BoxDecoration(
                color: const Color(0xFF40A758),
                shape: BoxShape.rectangle,
                
                borderRadius: BorderRadius.circular(8)
              ),
              selectedTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ), 
              selectedDecoration:     BoxDecoration(
                color: const Color(0xFF40A758),
                shape: BoxShape.rectangle,
                
                borderRadius: BorderRadius.circular(8)
              ),
          
              outsideTextStyle: const TextStyle(color: Colors.grey),  
              disabledTextStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),  
              holidayTextStyle: const TextStyle(color: Colors.orange),  
              markerDecoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
              ),
            ),
            daysOfWeekHeight: 50.0,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13),  
              weekendStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13),  
            ),
            focusedDay: calendarProvider.selectedDate ?? DateTime.now(),
           selectedDayPredicate: (day) {
          
              return calendarProvider.selectedDate != null &&
                  isSameDay(calendarProvider.selectedDate!, day);  
            },
            onDaySelected: (selectedDay, focusedDay) {
              calendarProvider.setSelectedDate(selectedDay);
              
            },
            onPageChanged: (focusedDay) {
              calendarProvider.setSelectedDate(focusedDay);
            },
          ),
        );
      }
    );
  }
}