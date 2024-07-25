import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:provider/provider.dart';

import '../../../blocs/users/users.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_images.dart';
import '../../../utils/navigator/page_navigator.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/loading_screen.dart';
import 'widgets/cancelled.dart';
import 'widgets/completed_appointnment.dart';
import 'widgets/search_page.dart';
import 'widgets/upcoming_appointments.dart';

class AppointmentTabView extends StatelessWidget {
  const AppointmentTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: const AppointmentTabViewScreen(),
    );
  }
}

class AppointmentTabViewScreen extends StatefulWidget {
  const AppointmentTabViewScreen({super.key});

  @override
  State<AppointmentTabViewScreen> createState() =>
      _AppointmentTabViewScreenState();
}

class _AppointmentTabViewScreenState extends State<AppointmentTabViewScreen> {
  bool upComing = true;
  bool completed = false;
  bool cancelled = false;

  late UserCubit _userCubit;
  List<AppointmentListsData> upcomingAppointment = [];
  List<AppointmentListsData> completedAppointment = [];
  List<AppointmentListsData> cancelledAppointment = [];

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    _userCubit.getAppointmentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Text(
          ' ',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: const Color(0xFF0A0D14),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Appointments',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: const Color(0xFF0A0D14),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AppNavigator.pushAndStackPage(context,
                  page: SearchPage(
                    appointment: (upComing)
                        ? upcomingAppointment
                        : (completed)
                            ? completedAppointment
                            : (cancelled)
                                ? cancelledAppointment
                                : upcomingAppointment, isSchedule: (upComing)
                        ? true
                        : (completed)
                            ? false
                            : (cancelled)
                                ? false
                                : false,
                  ));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 4.5, 20, 4.5),
              width: 22,
              height: 22,
              child: const SizedBox(
                width: 18,
                height: 18,
                child: ImageView.svg(
                  AppImages.searchIcon,
                  scale: 4,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
        if (state is AppointmentListLoaded) {
          if (state.appointmentLists.ok ?? false) {
            upcomingAppointment =
                _userCubit.viewModel.upcomingAppointments.reversed.toList();
            completedAppointment =
                _userCubit.viewModel.completedAppointments.reversed.toList();
            cancelledAppointment =
                _userCubit.viewModel.cancelledAppointments.reversed.toList();
          } else {
            ToastService().showToast(context,
                leadingIcon: const ImageView.svg(AppImages.error),
                title: 'Error!!!',
                subtitle: state.appointmentLists.message?.message ?? '');
          }
        } else if (state is UserApiErr || state is UserNetworkErr) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: "Network Error");
        }
      }, builder: (context, state) {
        if (state is UserApiErr) {
          return ErrorPage(
              statusCode: state.message ?? '',
              onTap: () {
                _userCubit.getAppointmentList();
              });
        } else if (state is UserNetworkErr) {
          return ErrorPage(
              statusCode: state.message ?? '',
              onTap: () {
                _userCubit.getAppointmentList();
              });
        }
        return (state is AppointmentListLoading)
            ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFEFF1F5),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                upComing = true;
                                cancelled = false;
                                completed = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: upComing
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    )
                                  : null,
                              child: Text('Upcoming',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: upComing
                                          ? Colors.black
                                          : Colors.grey)),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFFA09CAB),
                                borderRadius: BorderRadius.circular(11)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                upComing = false;
                                cancelled = false;
                                completed = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: completed
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    )
                                  : null,
                              child: Text('Completed',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: completed
                                          ? Colors.black
                                          : Colors.grey)),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 1,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xFFA09CAB),
                                borderRadius: BorderRadius.circular(11)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                upComing = false;
                                cancelled = true;
                                completed = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: cancelled
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    )
                                  : null,
                              child: Text('Cancelled',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: cancelled
                                          ? Colors.black
                                          : Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (upComing)
                            UpcomingPage(
                              upcomingAppointment: upcomingAppointment,
                            )
                          else if (completed)
                            CompletedPage(
                              completedAppointment: completedAppointment,
                            )
                          else if (cancelled)
                            CancelledPage(
                              cancelledAppointment: cancelledAppointment,
                            )
                        ],
                      ),
                    ),
                  )
                ],
              );
      }),
    );
  }
}
