import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Key? key, required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: ScheduleWidgetPage(isEdit: isEdit,),
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

   getAvailability() async {
    _accountCubit = context.read<AccountCubit>();
    final existingSchedule = Provider.of<OnboardViewModel>(context, listen: false).schedule;

    if (existingSchedule != null) {
      setState(() {
        for (var daySchedule in existingSchedule) {
          _daySwitchState[daySchedule.day] = daySchedule.isOpen;
          _dayTimeSlots[daySchedule.day] = daySchedule.timeSlots.map((slot) {
            return {
              'start': TimeOfDay(hour: slot['start_time']!.hour, minute: slot['start_time']!.minute),
              'end': TimeOfDay(hour: slot['end_time']!.hour, minute: slot['end_time']!.minute),
            };
          }).toList();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
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

  void _addTimeSlot(String day) {
    TimeOfDay now = TimeOfDay.now();
    TimeOfDay end = TimeOfDay(hour: (now.hour + 4) % 24, minute: now.minute);

    setState(() {
      _dayTimeSlots[day]?.add({
        'start': now,
        'end': end,
      });
    });
  }

  bool _hasTimeSlots() {
    return _dayTimeSlots.values.any((slots) => slots.isNotEmpty);
  }

  void _removeTimeSlot(String day, int index) {
    setState(() {
      _dayTimeSlots[day]?.removeAt(index);
    });
  }

  Future<void> _selectTime(
      BuildContext context, String day, int index, bool isStart) async {
    TimeOfDay initialTime = isStart
        ? _dayTimeSlots[day]![index]['start']!
        : _dayTimeSlots[day]![index]['end']!;
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isStart) {
          _dayTimeSlots[day]![index]['start'] = pickedTime;
        } else {
          _dayTimeSlots[day]![index]['end'] = pickedTime;
        }
      });
    }
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

    Provider.of<OnboardViewModel>(context, listen: false).updateSchedule(newSchedule);
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

    Provider.of<OnboardViewModel>(context, listen: false).updateSchedule(emptySchedule);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
          listener: (context, state) {
            if (state is UpdateAvailabilitysLoaded) {
              if (state.availability.ok!) {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(AppImages.tick),
                  title: AppStrings.successTitle,
                  subtitle: state.availability.message ?? '',
                );
        
                AppNavigator.pushAndReplacePage(context,
                    page:   WorkInformation(isEdit: widget.isEdit,));
              } else {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(AppImages.error),
                  title: AppStrings.errorTitle,
                  subtitle: state.availability.message ?? '',
                );
              }
            } else if (state is AccountApiErr) {
              ToastService().showToast(
                context,
                leadingIcon: const ImageView.svg(AppImages.error),
                title: AppStrings.errorTitle,
                subtitle: state.message ?? '',
              );
            } else if (state is AccountNetworkErr) {
              if (state.message != null) {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(AppImages.error),
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
              :  Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Working Hours / Availability',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                            page:   WorkInformation(isEdit: widget.isEdit));
                      },
                      primaryBgColor: const Color(0xFFF70000),
                        
              secondaryBgColor: AppColors.lightPrimary,
                      secondaryAction: () {
                        _saveSchedule();
                        AppNavigator.pushAndReplacePage(context,
                            page:   WorkInformation(isEdit: widget.isEdit));
                      },
                    ),
                  );
                } else {
                  AppNavigator.pushAndReplacePage(context,
                      page:   WorkInformation(isEdit: widget.isEdit));
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
                        schedule:
                            Provider.of<OnboardViewModel>(context, listen: false)
                                .schedule);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          ),
          body: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        const Divider(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(day,
                                            style: const TextStyle(
                                                fontSize: 14,
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
                                                if (!value) {
                                                  _dayTimeSlots[day]?.clear();
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _daySwitchState[day]!
                                      ? _buildOpenDayContent(day)
                                      : _buildClosedDayContent(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
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

 Widget _buildOpenDayContent(String day) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (_dayTimeSlots[day]!.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Text('Opened for the day',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w400)),
          ),
        
        Column(
          children: _dayTimeSlots[day]!.asMap().entries.map((entry) {
            int idx = entry.key;
            TimeOfDay startTime = entry.value['start']!;
            TimeOfDay endTime = entry.value['end']!;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _selectTime(context, day, idx, true),
                  child: Row(
                    children: [
                      Text('${_formatTime(startTime)} ',
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0A0D14))),
                    ],
                  ),
                ),
                const Text(' - ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0A0D14))),
                GestureDetector(
                  onTap: () => _selectTime(context, day, idx, false),
                  child: Row(
                    children: [
                      Text(' ${_formatTime(endTime)}',
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0A0D14))),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 18,
                  ),
                  onPressed: () => _removeTimeSlot(day, idx),
                ),
              ],
            );
          }).toList(),
        ),
        
        if (_dayTimeSlots[day]!.length < 2) const SizedBox(height: 10),
        if (_dayTimeSlots[day]!.length < 2)
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => _addTimeSlot(day),
                child: const Icon(
                  Icons.add,
                  color: Color(
                    0xFF40B93C,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _addTimeSlot(day),
                child: const Text('Add a set of hours',
                    style: TextStyle(
                        color: Color(
                          0xFF40B93C,
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
      ],
    ),
  );
}


   
}
