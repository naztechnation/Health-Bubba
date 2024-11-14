import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/view_model/book_appointment_viewmodel.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/choice_widget.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/decision_widgets.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/calender_widget.dart';

class BookAppointentPage extends StatelessWidget {
  final String patientsId;
  final bool isReBookAppointment;

  const BookAppointentPage(
      {Key? key, required this.patientsId, required this.isReBookAppointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: BookAppointent(
        patientsId: patientsId,
        isReBookAppointment: isReBookAppointment,
      ),
    );
  }
}

class BookAppointent extends StatefulWidget {
  final bool isReBookAppointment;
  final String patientsId;

  const BookAppointent(
      {super.key, required this.isReBookAppointment, required this.patientsId});

  @override
  State<BookAppointent> createState() => _BookAppointentState();
}

class _BookAppointentState extends State<BookAppointent> {
  String _selectedDay = "0.00";

  String realDay = "0.00 AM";

  void _handleDaySelected(String selectedDay) {
    setState(() {
      _selectedDay = selectedDay.replaceAll(RegExp(r' (AM|PM)$'), '');
      realDay = selectedDay;
    });
  }

  late UserCubit _userCubit;

  final _complaintController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();

    _handleDaySelected('0:00 AM');
    super.initState();
  }

  List<String> generateTimeSlots() {
    List<String> timeSlots = [];
    for (int hour = 0; hour < 24; hour++) {
      String suffix = hour < 12 ? 'AM' : 'PM';
      String formattedHour24 = hour < 10 ? '0$hour' : '$hour';

      timeSlots.add('$formattedHour24:00 $suffix');
      timeSlots.add('$formattedHour24:30 $suffix');
    }
    return timeSlots;
  }

  bool isTimeSlotInPast(String timeSlot) {
  // Get current date and time
  DateTime now = DateTime.now();

  // Parse the provided timeSlot
  DateFormat format = DateFormat('HH:mm a');
  DateTime parsedTime = format.parse(timeSlot);

  // Set the parsed time to today's date
  DateTime timeSlotDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    parsedTime.hour,
    parsedTime.minute,
  );

  // Check if the time slot is in the past
  return timeSlotDateTime.isBefore(now);
}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is CreateAppointmentLoaded) {
        if (state.createAppointment.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.successIcon),
              title: AppStrings.successTitle,
              subtitle: state.createAppointment.message ?? '');

          AppNavigator.pushAndReplacePage(context, page: const Dashboard());
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: AppStrings.errorTitle,
              subtitle: state.createAppointment.message ?? '');
        }
      } else if (state is UserApiErr || state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: AppStrings.errorTitle,
            subtitle: 'Network Error');
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.createAppointment(
                patientsId: widget.patientsId,
                date: Provider.of<BookAppointmentViewModel>(context,
                        listen: false)
                    .selectedDate
                    .toString(),
                time: _selectedDay,
                complaint: _complaintController.text.trim(),
                images: Provider.of<BookAppointmentViewModel>(context,
                        listen: false)
                    .imageUrls,
              );
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.createAppointment(
                patientsId: widget.patientsId,
                date: Provider.of<BookAppointmentViewModel>(context,
                        listen: false)
                    .selectedDate
                    .toString(),
                time: _selectedDay,
                complaint: _complaintController.text.trim(),
                images: Provider.of<BookAppointmentViewModel>(context,
                        listen: false)
                    .imageUrls,
              );
            });
      }
      return Stack(
        children: [
          Scaffold(
            body: Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(
                    widget.isReBookAppointment
                        ? 'Reschedule Appointment'
                        : 'Book a Time & Date',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                centerTitle: true,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                actions: const [
                  Text(
                    '         ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Select Date',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                height: 1.7,
                                                color: const Color(0xFF0A0D14),
                                              ),
                                            ),
                                            // GestureDetector(
                                            //   onTap: () async {
                                            //     final DateTime? picked =
                                            //         await showMonthYearPickerDialog(
                                            //       context: context,
                                            //       initialDate: DateTime.now(),
                                            //     );
                                            //     if (picked != null) {
                                            //       Provider.of<BookAppointmentViewModel>(
                                            //               context,
                                            //               listen: false)
                                            //           .setSelectedDate(picked);
                                            //     }
                                            //   },
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       border: Border.all(
                                            //           color: const Color(
                                            //               0xFFE8E8E8)),
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               100),
                                            //       color:
                                            //           const Color(0xFFFFFFFF),
                                            //       boxShadow: const [
                                            //         BoxShadow(
                                            //           color: Color(0xFFF2F2F2),
                                            //           offset: Offset(0, 1),
                                            //           blurRadius: 1,
                                            //         ),
                                            //       ],
                                            //     ),
                                            //     child: Container(
                                            //       padding:
                                            //           const EdgeInsets.fromLTRB(
                                            //               5, 3, 13.2, 3),
                                            //       child: Row(
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment.start,
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment
                                            //                 .start,
                                            //         children: [
                                            //           Container(
                                            //             margin: const EdgeInsets
                                            //                 .fromLTRB(
                                            //                 0, 0, 8.7, 0),
                                            //             child: Consumer<
                                            //                     BookAppointmentViewModel>(
                                            //                 builder: (context,
                                            //                     calendarProvider,
                                            //                     child) {
                                            //               return Text(
                                            //                 '${calendarProvider.formattedMonth}, ${calendarProvider.formattedYear}',
                                            //                 style: GoogleFonts
                                            //                     .getFont(
                                            //                   'Inter',
                                            //                   fontWeight:
                                            //                       FontWeight
                                            //                           .w400,
                                            //                   fontSize: 14,
                                            //                   color: const Color(
                                            //                       0xFF111827),
                                            //                 ),
                                            //               );
                                            //             }),
                                            //           ),
                                            //           const Padding(
                                            //             padding:
                                            //                 EdgeInsets.only(
                                            //                     top: 5.0),
                                            //             child: Icon(
                                            //               Icons
                                            //                   .arrow_forward_ios,
                                            //               size: 13,
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                       
                                      CalendarScreen(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFE5E7EB),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      16, 16, 25.8, 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 16),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Select Time Slot',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              height: 1.7,
                                              color: const Color(0xFF0A0D14),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ChoiceSelector(
                                        items: generateTimeSlots(),
                                        onSelected: _handleDaySelected,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // GestureDetector(
                        //     onTap: () {
                        //       Provider.of<BookAppointmentViewModel>(context,
                        //               listen: false)
                        //           .loadImage(context, () {});
                        //     },
                        //     child: const Text('Upload Image')),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Add Notes for Patient (Optional)',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.4,
                                      color: const Color(0xFF131316),
                                    ),
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: TextEditView(
                                  controller: _complaintController,
                                  borderColor: Colors.grey.shade200,
                                  borderWidth: 0.5,
                                  hintText: '',
                                  maxLines: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, -4),
                      blurRadius: 8.8999996185,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF093126),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x33212126),
                          offset: Offset(0, 1),
                          blurRadius: 1.5,
                        ),
                        BoxShadow(
                          color: Color(0xFF083025),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 45,
                      child: ButtonView(
                          onPressed: () {

                            if (isTimeSlotInPast(realDay)) {
                              Modals.showToast('Please select a time that is in the future', context);
                            } else {
                             Modals.showDialogModal(
                              context,
                              page: destructiveActions(
                                  context: context,
                                  message:
                                      'Are you sure you want to complete this action?',
                                  primaryText: 'Yes, continue',
                                  secondaryText: 'No, go back',
                                  primaryAction: () async {
                                    Navigator.pop(context);
                                   
                                    _userCubit.createAppointment(
                                      patientsId: widget.patientsId,
                                      date: getFormattedDate(
                                          Provider.of<BookAppointmentViewModel>(
                                                      context,
                                                      listen: false)
                                                  .selectedDate ??
                                              DateTime.now()),
                                      time: _selectedDay,
                                      complaint:
                                          (_complaintController.text.isNotEmpty)
                                              ? _complaintController.text.trim()
                                              : 'none',
                                      images:
                                          Provider.of<BookAppointmentViewModel>(
                                                  context,
                                                  listen: false)
                                              .imageUrls,
                                    );
                                  },
                                  primaryBgColor: const Color(0xFF093126),
                                  secondaryBgColor: AppColors.lightPrimary,
                                  secondaryAction: () {
                                    Navigator.pop(context);
                                  }),
                            );
                            }
                            
                          },
                          borderRadius: 100,
                          color: AppColors.lightSecondary,
                          child: Text(
                            (!widget.isReBookAppointment)
                                ? 'Book Appointment'
                                : 'Confrim Rescheduling',
                            style: const TextStyle(
                                color: AppColors.lightPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (state is CreateAppointmentLoading ||
              state is PatientDetailsLoading)
            Container(
              color: AppColors.indicatorBgColor,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.indicatorColor,
                ),
              ),
            ),
        ],
      );
    });
  }

  Future<DateTime?> showMonthYearPickerDialog({
    required BuildContext context,
    required DateTime initialDate,
  }) {
    int selectedYear = initialDate.year;
    int selectedMonth = initialDate.month;

    return showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Select Month and Year',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              DropdownButton<int>(
                value: selectedYear,
                items: List.generate(
                        100, (index) => DateTime.now().year - 50 + index)
                    .map((year) => DropdownMenuItem(
                          value: year,
                          child: Text('$year'),
                        ))
                    .toList(),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    selectedYear = newValue;
                  }
                },
              ),
              DropdownButton<int>(
                value: selectedMonth,
                items: <String>[
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                  'Sep',
                  'Oct',
                  'Nov',
                  'Dec'
                ]
                    .map((month) => DropdownMenuItem(
                          value: <String>[
                                'Jan',
                                'Feb',
                                'Mar',
                                'Apr',
                                'May',
                                'Jun',
                                'Jul',
                                'Aug',
                                'Sep',
                                'Oct',
                                'Nov',
                                'Dec'
                              ].indexOf(month) +
                              1,
                          child: Text(month),
                        ))
                    .toList(),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    selectedMonth = newValue;
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(DateTime(selectedYear, selectedMonth));
              },
              child: const Text(
                'OK',
                style: TextStyle(color: AppColors.lightSecondary),
              ),
            ),
          ],
        );
      },
    );
  }

  String getFormattedDate(DateTime date) {
    DateTime now = date;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
