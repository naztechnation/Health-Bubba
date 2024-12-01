import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:provider/provider.dart';

import '../../blocs/users/users.dart';
import '../../model/user/notifications_data.dart';
import '../../model/view_model/user_view_model.dart';
import '../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/error_page.dart';
import '../../widgets/loading_screen.dart';

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
        create: (BuildContext context) => UserCubit(
              userRepository: UserRepositoryImpl(),
              viewModel: Provider.of<UserViewModel>(context, listen: false),
            ),
        child: NotificationsPage());
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late UserCubit _userCubit;

  NotificationsData? notificationsData;

  List<NotifyData> todayFilter = [];
  List<NotifyData> yesterdayFilter = [];
  List<NotifyData> pastDaysFilter = [];
  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    _userCubit.getNotificationsData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is NotificationsLoaded) {
        if (state.notificationsData.ok ?? false) {
          notificationsData = state.notificationsData;
          pastDaysFilter = _userCubit.viewModel.pastDaysFilter?.reversed.toList() ?? [];
          todayFilter = _userCubit.viewModel.todayFilter?.reversed.toList() ?? [];
          yesterdayFilter = _userCubit.viewModel.yesterdayFilter?.reversed.toList() ?? [];
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error,
                                                        height: 25,
              
              ),
              title: 'Error!!!',
              subtitle: state.notificationsData.message ?? '');
        }
      } else if (state is UserApiErr || state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error,
                                                        height: 25,
            
            ),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getNotificationsData();
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getNotificationsData();
            });
      }
      return (state is NotificationsLoading)
          ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
          : Scaffold(
             backgroundColor: const Color(0xFFFFFFFF),
              appBar: AppBar(
                elevation: 1,
                centerTitle: true,
                title: Text(
                  'Notifications',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.5,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                 (notificationsData?.data?.isEmpty ?? false) ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                       SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: 80,),
                    const Align(
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: ImageView.svg(AppImages.noData)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      alignment: Alignment.center,
                      child: Text(
                        'No Notifications Data Yet. ',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.7,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                    ),
                     
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ):   ListView.builder(
                      itemCount: todayFilter.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  16, 8, 17.6, 7),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                    child: SizedBox(
                                                      child: Text(
                                                        'Today',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16,
                                                          height: 1.3,
                                                          color:
                                                              const Color(0xFF0A0D14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Mark all as read',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(0xFF40B93C),
                                                    ),
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
                                                  16, 16, 17, 19),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 6, 16, 2),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x1A40B93C),
                                                        borderRadius:
                                                            BorderRadius.circular(25),
                                                      ),
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                                14.5,
                                                                14.5,
                                                                13.6,
                                                                13.6),
                                                        child:  SizedBox(
                                                          width: 21.8,
                                                          height: 21.8,
                                                          child: SizedBox(
                                                            width: 21.8,
                                                            height: 21.8,
                                                            child:
                                                            
                                                            (todayFilter[index].type == 'APPOINTMENT_SUCCESS') ? const ImageView.svg(
                                                                AppImages
                                                                    .appointmentSuccess) : (todayFilter[index].type == 'SCHEDULE_CHANGE')? const ImageView.svg(
                                                                AppImages
                                                                    .scheduleAppointment): (todayFilter[index].type == 'VIDEO_CONSULTATION')? const ImageView.svg(
                                                                AppImages
                                                                    .videoConsultation): (todayFilter[index].type == 'APPOINTMENT_CANCEL')? const ImageView.svg(
                                                                AppImages
                                                                    .appointmentCancelled): (todayFilter[index].type == 'ORDER_IN_TRANSIT')? const ImageView.svg(
                                                                AppImages
                                                                    .orderInTransit): (todayFilter[index].type == 'ORDER_COMPLETED')? const ImageView.svg(
                                                                AppImages
                                                                    .orderCompleted) : const ImageView.svg(
                                                                AppImages
                                                                    .appointmentCancelled),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(0, 0, 0, 2),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0, 0, 10, 0),
                                                                child: SizedBox(
                                                                  child: Text(
                                                                    notificationsData?.data?[index].title ?? '',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize: 14,
                                                                      height: 1.4,
                                                                      color: const Color(
                                                                          0xFF0A0D14),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                formatTimeDifference(notificationsData?.data?[index].date ?? ''),
                                                                style: GoogleFonts
                                                                    .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight.w500,
                                                                  fontSize: 14,
                                                                  height: 1.4,
                                                                  color: const Color(
                                                                      0xFF6B7280),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                              
                                                                  notificationsData?.data?[index].description ?? '',
                                                              style:
                                                                  GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.7,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              )),
                                                         
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          
                                          
                                        
                                        ],
                                      ),
                                     
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: yesterdayFilter.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  16, 8, 17.6, 7),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                    child: SizedBox(
                                                      child: Text(
                                                        'Yesterday',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16,
                                                          height: 1.3,
                                                          color:
                                                              const Color(0xFF0A0D14),
                                                        ),
                                                      ),
                                                    ),
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
                                                  16, 16, 17, 19),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 6, 16, 2),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x1A40B93C),
                                                        borderRadius:
                                                            BorderRadius.circular(25),
                                                      ),
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                                14.5,
                                                                14.5,
                                                                13.6,
                                                                13.6),
                                                        child:  SizedBox(
                                                          width: 21.8,
                                                          height: 21.8,
                                                          child: SizedBox(
                                                            width: 21.8,
                                                            height: 21.8,
                                                            child:
                                                            
                                                            (yesterdayFilter[index].type == 'APPOINTMENT_SUCCESS') ? const ImageView.svg(
                                                                AppImages
                                                                    .appointmentSuccess) : (yesterdayFilter[index].type == 'SCHEDULE_CHANGE')? const ImageView.svg(
                                                                AppImages
                                                                    .scheduleAppointment): (yesterdayFilter[index].type == 'VIDEO_CONSULTATION')? const ImageView.svg(
                                                                AppImages
                                                                    .videoConsultation): (yesterdayFilter[index].type == 'APPOINTMENT_CANCEL')? const ImageView.svg(
                                                                AppImages
                                                                    .appointmentCancelled): (yesterdayFilter[index].type == 'ORDER_IN_TRANSIT')? const ImageView.svg(
                                                                AppImages
                                                                    .orderInTransit): (yesterdayFilter[index].type == 'ORDER_COMPLETED')? const ImageView.svg(
                                                                AppImages
                                                                    .orderCompleted) : const ImageView.svg(
                                                                AppImages
                                                                    .appointmentCancelled),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(0, 0, 0, 2),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0, 0, 10, 0),
                                                                child: SizedBox(
                                                                  child: Text(
                                                                    yesterdayFilter[index].title ?? '',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize: 14,
                                                                      height: 1.4,
                                                                      color: const Color(
                                                                          0xFF0A0D14),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                formatTimeDifference(yesterdayFilter[index].date ?? ''),
                                                                style: GoogleFonts
                                                                    .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight.w500,
                                                                  fontSize: 14,
                                                                  height: 1.4,
                                                                  color: const Color(
                                                                      0xFF6B7280),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                              
                                                                  yesterdayFilter[index].description ?? '',
                                                              style:
                                                                  GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.7,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              )),
                                                         
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          
                                          
                                        
                                        ],
                                      ),
                                     
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: pastDaysFilter.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),


                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  16, 8, 17.6, 7),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                    child: SizedBox(
                                                      child: Text(
                                                        justGetDate(pastDaysFilter.last.date ?? ''),
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              const Color(0xFF0A0D14),
                                                        ),
                                                      ),
                                                    ),
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
                                                  16, 16, 17, 19),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 6, 16, 2),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x1A40B93C),
                                                        borderRadius:
                                                            BorderRadius.circular(25),
                                                      ),
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                                14.5,
                                                                14.5,
                                                                13.6,
                                                                13.6),
                                                        child:  SizedBox(
                                                          width: 21.8,
                                                          height: 21.8,
                                                          child: SizedBox(
                                                            width: 21.8,
                                                            height: 21.8,
                                                            child:
                                                            
                                                            (pastDaysFilter[index].type == 'APPOINTMENT_SUCCESS') ? const ImageView.svg(
                                                                AppImages
                                                                    .appointmentSuccess) : (pastDaysFilter[index].type == 'SCHEDULE_CHANGE')? const ImageView.svg(
                                                                AppImages
                                                                    .scheduleAppointment): (pastDaysFilter[index].type == 'VIDEO_CONSULTATION')? const ImageView.svg(
                                                                AppImages
                                                                    .videoConsultation): (pastDaysFilter[index].type == 'APPOINTMENT_CANCEL')? const ImageView.svg(
                                                                AppImages
                                                                    .appointmentCancelled): (pastDaysFilter[index].type == 'ORDER_IN_TRANSIT')? const ImageView.svg(
                                                                AppImages
                                                                    .orderInTransit): (pastDaysFilter[index].type == 'ORDER_COMPLETED')? const ImageView.svg(
                                                                AppImages
                                                                    .orderCompleted) : const ImageView.svg(
                                                                AppImages
                                                                    .appointmentCancelled),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(0, 0, 0, 2),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0, 0, 10, 0),
                                                                child: SizedBox(
                                                                  child: Text(
                                                                    pastDaysFilter[index].title ?? '',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize: 13,
                                                                      height: 1.4,
                                                                      color: const Color(
                                                                          0xFF0A0D14),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                formatTimeDifference(pastDaysFilter[index].date ?? ''),
                                                                style: GoogleFonts
                                                                    .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight.w500,
                                                                  fontSize: 14,
                                                                  height: 1.4,
                                                                  color: const Color(
                                                                      0xFF6B7280),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                              
                                                                  pastDaysFilter[index].description ?? '',
                                                              style:
                                                                  GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.7,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              )),
                                                         
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          
                                          
                                        
                                        ],
                                      ),
                                     
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
    });
  }

  String formatTimeDifference(String dateString) {
  DateTime inputDate = DateTime.parse(dateString);
  DateTime currentDate = DateTime.now().add(const Duration(hours: 1));

  Duration difference = currentDate.difference(inputDate);

  if (difference.inHours < 24) {
    return '${difference.inHours}h';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()}w';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()}mth';
  } else {
    return '${(difference.inDays / 365).floor()}yr';
  }
}


  String justGetDate(String date){


      String notificationDate = date.split('T')[0];

      return notificationDate;
  }

}
