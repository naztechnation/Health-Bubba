import 'package:intl/intl.dart';

import '../../res/enum.dart';
import 'base_viewmodel.dart';

class BookAppointmentViewModel extends BaseViewModel {
 
  late DateTime? _selectedDate;
  late String _formattedMonth;
  late String _formattedYear;
  late int? _selectedDay;
  
  BookAppointmentViewModel() {
    _selectedDate = null;
    _formattedMonth = _formatMonth(DateTime.now());
    _formattedYear = _formatYear(DateTime.now()); 
     _selectedDay = null;
  }
 
  void setSelectedDate(DateTime? date) {  
    if (date != null) {
      _selectedDate = date;
      _formattedMonth = _formatMonth(date);
      _formattedYear = _formatYear(date);
      _selectedDay = date.day;
    }
    setViewState(ViewState.success);
  }

  String _formatMonth(DateTime date) {
    return DateFormat('MMM').format(date);
  }

  String _formatYear(DateTime date) {
    return DateFormat('yyyy').format(date);
  }

  DateTime? get selectedDate => _selectedDate; 
  
  String get formattedMonth => _formattedMonth;

  String get formattedYear => _formattedYear;

  int get selectedDay => _selectedDay ?? 0;
}
