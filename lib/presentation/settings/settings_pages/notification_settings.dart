import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../blocs/users/users.dart';
import '../../../model/user/notification_settings.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_images.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/loading_screen.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
        create: (BuildContext context) => UserCubit(
              userRepository: UserRepositoryImpl(),
              viewModel: Provider.of<UserViewModel>(context, listen: false),
            ),
        child: const Notification());
  }
}

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  int upcomingAlert = 1;
  int medicationReminder = 1;
  int orderAlert = 1;

  late UserCubit _userCubit;
  NotificationSettingsData? notificationSettings;

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    _userCubit.getNotificationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is GetNotifyLoaded) {
        if (state.notificationSettings.ok ?? false) {
          notificationSettings = state.notificationSettings.message!.data;

          upcomingAlert = notificationSettings?.upcomingAppointmentAlert ?? 1;
          medicationReminder = notificationSettings?.medicationsReminder ?? 1;
          orderAlert = notificationSettings?.orderAlert ?? 1;
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.notificationSettings.message?.message ?? '');
        }
      } else if (state is UpdateNotifyLoaded) {
        if (state.notificationSettings.ok ?? false) {
          notificationSettings = state.notificationSettings.message!.data;

          upcomingAlert = notificationSettings?.upcomingAppointmentAlert ?? 1;
          medicationReminder = notificationSettings?.medicationsReminder ?? 1;
          orderAlert = notificationSettings?.orderAlert ?? 1;
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.notificationSettings.message?.message ?? '');
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
              _userCubit.getNotificationSettings();
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getNotificationSettings();
            });
      }
      return (state is GetNotifyLoading || state is UpdateNotifyLoading)
          ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'Notification Settings',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
              ),
              body: Container(
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
                      const Divider(
                        color: Color(
                          0xFF40B93C,
                        ),
                      ),
                      buildNotificationSettingItem(
                        'Upcoming Appointment Alert',
                        upcomingAlert,
                        (bool value) {
                          setState(() {
                            upcomingAlert = value ? 1 : 0;
                          });

                          _userCubit.updateNotificationSettings(
                              upcomingAlert: upcomingAlert.toString(),
                              medicationReminder: medicationReminder.toString(),
                              orderAlert: orderAlert.toString());
                        },
                      ),
                      buildNotificationSettingItem(
                        'Medications Reminder',
                        medicationReminder,
                        (bool value) {
                          setState(() {
                            medicationReminder = value ? 1 : 0;
                            _userCubit.updateNotificationSettings(
                                upcomingAlert: upcomingAlert.toString(),
                                medicationReminder:
                                    medicationReminder.toString(),
                                orderAlert: orderAlert.toString());
                          });
                        }, 
                      ),
                      buildNotificationSettingItem(
                        'Order/Delivery Alert',
                        orderAlert,
                        (bool value) {
                          setState(() {
                            orderAlert = value ? 1 : 0;
                            _userCubit.updateNotificationSettings(
                                upcomingAlert: upcomingAlert.toString(),
                                medicationReminder:
                                    medicationReminder.toString(),
                                orderAlert: orderAlert.toString());
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  Widget buildNotificationSettingItem(
    String title,
    int currentValue,
    Function(bool) onChanged,
  ) {
    return Container(
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
        padding: const EdgeInsets.fromLTRB(16, 15, 6, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1.4,
                color: const Color(0xFF0A0D14),
              ),
            ),
            Transform.scale(
              transformHitTests: false,
              scale: .7,
              child: CupertinoSwitch(
                value: currentValue == 1,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
