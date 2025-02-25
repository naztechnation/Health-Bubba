import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../model/working_hours.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/app_strings.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/image_view.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/modals.dart';
import 'work_information.dart';

class ScheduleWidget extends StatelessWidget {
  final bool isEdit;

  const ScheduleWidget({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: ScheduleWidgetPage(
        isEdit: isEdit,
      ),
    );
  }
}

class ScheduleWidgetPage extends StatefulWidget {
  final bool isEdit;

  const ScheduleWidgetPage({super.key, required this.isEdit});

  @override
  _ScheduleWidgetPageState createState() => _ScheduleWidgetPageState();
}

class _ScheduleWidgetPageState extends State<ScheduleWidgetPage> {
  late AccountCubit _accountCubit;

  bool isAgreed = false;
  Map<String, bool> _checkedDays = {};

  getAvailability() async {
    _accountCubit = context.read<AccountCubit>();
    final existingSchedule =
        Provider.of<OnboardViewModel>(context, listen: false).schedule;

    if (existingSchedule != null) {
      setState(() {
        for (var day in _daySwitchState.keys) {
          var daySchedule = existingSchedule.firstWhere(
            (schedule) => schedule.day == day,
            orElse: () => DaySchedule(day: day, isOpen: false, timeSlots: []),
          );

          _daySwitchState[day] = daySchedule.isOpen;

           
          _dayTimeSlots[day] = daySchedule.timeSlots.map((slot) {
            return {
              'start': TimeOfDay(
                  hour: slot['start_time']?.hour ?? 0,
                  minute: slot['start_time']?.minute ?? 0),
              'end': TimeOfDay(
                  hour: slot['end_time']?.hour ?? 0,
                  minute: slot['end_time']?.minute ?? 0),
            };
          }).toList();

           
          bool isFullDay = _dayTimeSlots[day]!.any((slot) {
            return slot['start']!.hour == 0 &&
                slot['start']!.minute == 0 &&
                slot['end']!.hour == 23 &&
                slot['end']!.minute == 59;
          });

          _checkedDays[day] = isFullDay;

          if (daySchedule.isOpen) {
            newSchedule.add(daySchedule);
          } else {
            _checkedDays[day] = true;
             
          }
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _accountCubit = context.read<AccountCubit>();
    getAvailability();
  }

  final Map<String, bool> _daySwitchState = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  final Map<String, List<Map<String, TimeOfDay>>> _dayTimeSlots = {
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
    'Saturday': [],
    'Sunday': [],
  };

  bool _hasTimeSlots() {
    return _dayTimeSlots.values.any((slots) => slots.isNotEmpty);
  }

  void _removeTimeSlot(String day, int index) {
    setState(() {
      _dayTimeSlots[day]?.removeAt(index);
    });
  }

  Future<void> _showTimePickerModal(BuildContext context, String day) async {
    TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      day,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? pickedStart = await showTimePicker(
                              context: context,
                              initialTime: startTime,
                            );
                            if (pickedStart != null) {
                              setModalState(() {
                                startTime = pickedStart;
                              });
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Start Time:',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.access_alarm),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    _formatTime(startTime),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? pickedEnd = await showTimePicker(
                              context: context,
                              initialTime: endTime,
                            );
                            if (pickedEnd != null) {
                              if (_isEndTimeValid(startTime, pickedEnd)) {
                                setModalState(() {
                                  endTime = pickedEnd;
                                });
                              } else {
                                _showInvalidTimeDialog(context);
                              }
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'End Time:',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.access_alarm),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '${_formatTime(endTime)} ',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightSecondary),
                      onPressed: _isEndTimeValid(startTime, endTime)
                          ? () {
                              if (_isTimeSlotAvailable(
                                  day, startTime, endTime)) {
                                Navigator.pop(context);
                                _addTimeSlot(day, startTime, endTime);
                              } else {
                                _showInvalidTimeDialog1(context);
                              }
                            }
                          : null,
                      child: const Text(
                        'Enter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

// Helper function to compare start and end time
  bool _isEndTimeValid(TimeOfDay start, TimeOfDay end) {
    if (end.hour < start.hour) {
      return false;
    } else if (end.hour == start.hour && end.minute <= start.minute) {
      return false;
    }
    return true;
  }

  bool _isTimeSlotAvailable(String day, TimeOfDay newStart, TimeOfDay newEnd) {
    List<Map<String, TimeOfDay>> existingSlots = _dayTimeSlots[day] ?? [];

    for (var slot in existingSlots) {
      TimeOfDay existingStart = slot['start']!;
      TimeOfDay existingEnd = slot['end']!;

      if (!(newEnd.hour < existingStart.hour ||
          (newEnd.hour == existingStart.hour &&
              newEnd.minute <= existingStart.minute) ||
          (newStart.hour > existingEnd.hour ||
              (newStart.hour == existingEnd.hour &&
                  newStart.minute >= existingEnd.minute)))) {
        return false;
      }
    }

    return true;
  }

  void _showInvalidTimeDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Invalid Time Selection',
            style: GoogleFonts.inter(fontSize: 16)),
        content: Text(
          'Selected time slot interfers with an already existing one please select a different time slot',
          style: GoogleFonts.inter(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showInvalidTimeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Invalid Time Selection',
            style: GoogleFonts.inter(fontSize: 16)),
        content: Text(
          'End time cannot be before or the same as the start time.',
          style: GoogleFonts.inter(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _addTimeSlot(String day, TimeOfDay start, TimeOfDay end) {
    setState(() {
      _dayTimeSlots[day]?.add({'start': start, 'end': end});

      DaySchedule daySchedule = newSchedule.firstWhere(
        (schedule) => schedule.day == day,
        orElse: () => DaySchedule(day: day, isOpen: true, timeSlots: []),
      );

      daySchedule.timeSlots.add({'start': start, 'end': end});
    });
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat.Hm();
    return format.format(dt);
  }

  List<DaySchedule> newSchedule = [];

  void _saveSchedule() {
    newSchedule = _daySwitchState.keys.map((day) {
      return DaySchedule(
        day: day,
        isOpen: _daySwitchState[day]!,
        timeSlots: _dayTimeSlots[day]!,
      );
    }).toList();

    Provider.of<OnboardViewModel>(context, listen: false)
        .updateSchedule(newSchedule);
  }

  void _clearSchedule() {
    setState(() {
      _daySwitchState.updateAll((key, value) => false);
      _dayTimeSlots.updateAll((key, value) => []);
    });

    List<DaySchedule> emptySchedule = _daySwitchState.keys.map((day) {
      return DaySchedule(
        day: day,
        isOpen: false,
        timeSlots: [],
      );
    }).toList();

    Provider.of<OnboardViewModel>(context, listen: false)
        .updateSchedule(emptySchedule);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {
        if (state is UpdateAvailabilitysLoaded) {
          if (state.availability.ok!) {
            ToastService().showToast(
              context,
              leadingIcon: const ImageView.svg(
                AppImages.tick,
                height: 25,
              ),
              title: AppStrings.successTitle,
              subtitle: state.availability.message ?? '',
            );

            AppNavigator.pushAndReplacePage(context,
                page: WorkInformation(
                  isEdit: widget.isEdit,
                ));
          } else {
            ToastService().showToast(
              context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: AppStrings.errorTitle,
              subtitle: state.availability.message ?? '',
            );
          }
        } else if (state is AccountApiErr) {
          ToastService().showToast(
            context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: AppStrings.errorTitle,
            subtitle: state.message ?? '',
          );
        } else if (state is AccountNetworkErr) {
          if (state.message != null) {
            ToastService().showToast(
              context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: AppStrings.errorTitle,
              subtitle: state.message ?? '',
            );
          }
        }
      },
      builder: (context, state) => (state is UpdateAvailabilitysLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              backgroundColor: AppColors.lightPrimary,
              appBar: AppBar(
                title: const Text(
                  'Add Working Hours / Availability',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                centerTitle: false,
                leading: GestureDetector(
                  onTap: () {
                    if (_hasTimeSlots()) {
                      Modals.showDialogModal(
                        context,
                        page: destructiveActions(
                          context: context,
                          message:
                              'Are you sure you want to discard this selected Info?.',
                          primaryText: 'Discard',
                          secondaryText: 'Save',
                          primaryAction: () {
                            _clearSchedule();
                            AppNavigator.pushAndReplacePage(context,
                                page: WorkInformation(isEdit: widget.isEdit));
                          },
                          primaryBgColor: const Color(0xFFF70000),
                          secondaryBgColor: AppColors.lightPrimary,
                          secondaryAction: () {
                            _saveSchedule();
                            AppNavigator.pushAndReplacePage(context,
                                page: WorkInformation(isEdit: widget.isEdit));
                          },
                        ),
                      );
                    } else {
                      AppNavigator.pushAndReplacePage(context,
                          page: WorkInformation(isEdit: widget.isEdit));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 19, bottom: 19),
                    child: SizedBox(
                      width: 15,
                      height: 15,
                      child: ImageView.svg(
                        AppImages.backBtn,
                        height: 15,
                      ),
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                      onTap: () {
                        _saveSchedule();
                        
                        _accountCubit.updateAvailability(
                            context: context,
                            schedule: Provider.of<OnboardViewModel>(context,
                                    listen: false)
                                .schedule);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      )),
                ],
              ),
              body: Column(
                children: [
                  const Divider(
                    height: 0.9,
                    color: Color(
                      0xFF40B93C,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  
Expanded(
  child: ListView(
    shrinkWrap: true,
    children: _daySwitchState.keys.map((day) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(day,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0A0D14),
                        fontWeight: FontWeight.w500)),
                Transform.scale(
                  transformHitTests: false,
                  scale: .7,
                  child: CupertinoSwitch(
                    value: _daySwitchState[day]!,
                    onChanged: (bool value) {
                      setState(() {
                        _daySwitchState[day] = value;
                        if (value) {
                           
                          _checkedDays[day] = true;
                          _addTimeSlot(
                              day,
                              const TimeOfDay(hour: 0, minute: 0),
                              const TimeOfDay(hour: 23, minute: 59));
                        } else {
                          newSchedule.removeWhere(
                              (schedule) => schedule.day == day);
                          _dayTimeSlots[day]?.clear();
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_daySwitchState[day]!)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
               
                
                if (!_checkedDays[day]!) ...[
                  if (_dayTimeSlots[day]!.length < 2)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showTimePickerModal(context, day);
                        });
                      },
                      child: const Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Color(0xFF40B93C),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add a set of hours',
                            style: TextStyle(
                              color: Color(0xFF40B93C),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ..._dayTimeSlots[day]!.asMap().entries.map((entry) {
                    int idx = entry.key;
                    TimeOfDay start = entry.value['start']!;
                    TimeOfDay end = entry.value['end']!;

                    return ListTile(
                      dense: true,
                      isThreeLine: false,
                      title: Text(
                        '${_formatTime(start)} - ${_formatTime(end)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A0D14),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _dayTimeSlots[day]?.removeAt(idx);
                          });
                        },
                      ),
                    );
                  }),
                  
                ],
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: SizedBox(
                        width: 15,
                        child: Checkbox(
                          value: _checkedDays[day],
                          onChanged: (bool? value) {
                            setState(() {
                              _checkedDays[day] = value!;
                              if (value) {
                               
                                _dayTimeSlots[day]?.clear();
                                _addTimeSlot(
                                    day,
                                    const TimeOfDay(hour: 0, minute: 0),
                                    const TimeOfDay(hour: 23, minute: 59));
                              } else {
                                 
                                _dayTimeSlots[day]?.removeWhere((timeSlot) {
                                  return timeSlot['start']!.hour == 0 &&
                                      timeSlot['start']!.minute == 0 &&
                                      timeSlot['end']!.hour == 23 &&
                                      timeSlot['end']!.minute == 59;
                                });
                              }
                            });
                          },
                          activeColor: const Color(0xFF40B93C),  
                          checkColor: Colors.white,  
                          side: const BorderSide(
                            color: Color(0xFF40B93C),  
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      '24hours (Open for the day)',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (!_daySwitchState[day]!) _buildClosedDayContent(),
          const SizedBox(height: 10),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 5),
        ],
      );
    }).toList(),
  ),
),
                ],
              ),
            ),
    );
  }

  Widget _buildClosedDayContent() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text('Closed',
          style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w400)),
    );
  }
}
