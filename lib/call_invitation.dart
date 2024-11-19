import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'blocs/users/user_cubit.dart';
import 'blocs/users/users.dart';
import 'model/view_model/user_view_model.dart';
import 'presentation/dashboard/dashboard_pages.dart/widgets/cancel_appointment.dart';
import 'requests/repositories/user_repo/user_repository_impl.dart';
import 'res/app_colors.dart';
import 'res/app_images.dart';
import 'res/app_strings.dart';
import 'widgets/button_view.dart';
import 'widgets/custom_toast.dart';
import 'widgets/decision_widgets.dart';
import 'widgets/error_page.dart';
import 'widgets/image_view.dart';
import 'widgets/modals.dart';

class CallInviteScreen extends StatelessWidget {
  final String inviteeId;
  final String appointmentId;
  final String inviteeName;
  final bool isVideoCall;
  const CallInviteScreen(
      {super.key, required this.inviteeId, required this.inviteeName, required this.appointmentId,   this.isVideoCall = true});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
          userRepository: UserRepositoryImpl(),
          viewModel: Provider.of<UserViewModel>(context, listen: false)),
      child: CallInvite(
        inviteeId: inviteeId,
        isVideoCall: isVideoCall,
        inviteeName: inviteeName, appointmentId: appointmentId,
      ),
    );
  }
}

class CallInvite extends StatefulWidget {
  final String inviteeId;
  final String appointmentId;
  final bool isVideoCall;

  final String inviteeName;
  const CallInvite(
      {super.key, required this.inviteeId, required this.inviteeName, required this.appointmentId, required this.isVideoCall});

  @override
  State<CallInvite> createState() => _CallInviteState();
}

class _CallInviteState extends State<CallInvite> {
  late UserCubit _userCubit;

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is CancelAppointmentLoaded) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.successIcon),
            title: state.cancelAppointment.message?.message ?? '',
            subtitle: AppStrings.successTitle);
             AppNavigator.pushAndStackPage(context, page: const Dashboard());
      } else if (state is UserApiErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      } else if (state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(statusCode: state.message ?? '', onTap: () {});
      } else if (state is UserNetworkErr) {
        return ErrorPage(statusCode: state.message ?? '', onTap: () {});

      
      }
      return Stack(
        children: [
          Scaffold(
            
              body: PopScope(
         canPop: false,
          onPopInvokedWithResult: (value, result) async {

               Modals.showDialogModal(
                        context,
                        page: destructiveActions1(
                            context: context,
                            message:
                                'You are about to end this consultation Session.',
                            primaryText: 'Mark Session as Completed',
                            secondaryText: 'Cancel Appointment',
                            primaryAction: () async {
                               Navigator.pop(context);
                              _userCubit.completeAppointment(appointmentId: widget.appointmentId);
                             
          
                            },
                            primaryBgColor: const Color(0xFF093126),
                            secondaryBgColor: AppColors.lightPrimary,
                            secondaryAction: () {
                               AppNavigator.pushAndStackPage(context,
                          page: CancelAppointment(
                            appointmentId: widget.appointmentId
                                ,
                          ));
                            
                            }, secondary2Text: 'Exit Session', 
                            
                              secondary2Action: () {
                               
                              Navigator.pop(context);
                              AppNavigator.pushAndReplacePage(context, page: const Dashboard());
                            },
                            ),
                          
                      );

            
          },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ZegoSendCallInvitationButton(
                        invitees: [
                          ZegoUIKitUser(
                            id: widget.inviteeId,
                            name: widget.inviteeName,
                          ),
                        ],
                        isVideoCall:     widget.isVideoCall,
                        resourceID: AppStrings.zegoResourceId,
                      ),
                    ),
                    Text(
                      'Tap on Icon to Start Session',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF0A0D14),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                width: 100,
                margin: const EdgeInsets.only(bottom: 20, right: 50, left: 50),
                child: ButtonView(
                    expanded: false,
                    onPressed: () {
                      Modals.showDialogModal(
                        context,
                        page: destructiveActions1(
                            context: context,
                            message:
                                'You are about to end this consultation Session.',
                            primaryText: 'Mark Session as Completed',
                            secondaryText: 'Cancel Appointment',
                            primaryAction: () async {
                               Navigator.pop(context);
                              _userCubit.completeAppointment(appointmentId: widget.appointmentId);
                             
          
                            },
                            primaryBgColor: const Color(0xFF093126),
                            secondaryBgColor: AppColors.lightPrimary,
                            secondaryAction: () {
                               AppNavigator.pushAndStackPage(context,
                          page: CancelAppointment(
                            appointmentId: widget.appointmentId
                                ,
                          ));
                            
                            }, secondary2Text: 'Exit Session', 
                            
                              secondary2Action: () {
                               
                              Navigator.pop(context);
                              AppNavigator.pushAndReplacePage(context, page: const Dashboard());
                            },
                            ),
                          
                      );
                    },
                    borderRadius: 100,
                    borderColor: const Color(0xFFF70000),
                    color: const Color(0xFFF70000),
                    child: const Text(
                      'Exit Call',
                      style: TextStyle(
                          color: AppColors.lightPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              )),
              if (  state is CancelAppointmentLoading
                       )
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
}
