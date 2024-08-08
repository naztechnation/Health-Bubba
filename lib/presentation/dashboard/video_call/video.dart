import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../blocs/users/user_cubit.dart';
import '../../../blocs/users/users.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../../../res/app_strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/decision_widgets.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/modals.dart';

class VideoCall extends StatelessWidget {
  final String appointmentId;
  final String patientName;
  final num patientId;
  final num doctorsId;

  const VideoCall({
    super.key,
    required this.appointmentId,
    required this.patientName,
    required this.patientId,
    required this.doctorsId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: VideoCallScreen(
        appointmentId: appointmentId,
        patientName: patientName,
        patientId: patientId,
        doctorsId: doctorsId,
      ),
    );
  }
}

class VideoCallScreen extends StatefulWidget {
  final String patientName;
  final String appointmentId;

  final num patientId;
  final num doctorsId;
  const VideoCallScreen(
      {super.key,
      required this.patientName,
      required this.patientId,
      required this.doctorsId,
      required this.appointmentId});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  String createChannelName(num patientId, num doctorsId) {
    List<num> sortedId = [patientId, doctorsId]..sort();

    String channelName = sortedId.join("_");

    return channelName;
  }

  String channelName = "";
  late UserCubit _userCubit;

  late AgoraClient client;

  String userType = '';

  num doctorsId = 0;

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    channelName =
        createChannelName(widget.patientId, widget.doctorsId).toLowerCase();
    initAgora();
  }

  void initAgora() async {
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "164e47eb399248f5856e254d0e429047",
          channelName: channelName,
          username: widget.patientName,
          tempToken: ''),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );

    await client.initialize();
  }

  @override
  void dispose() {
    onBackPress();
    super.dispose();
  }

  Future<bool> onBackPress() async {
    Navigator.pop(context);

    await client.release();

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onBackPress,
        child: SafeArea(
          child:
              BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
            if (state is CancelAppointmentLoaded) {
              if (state.cancelAppointment.ok ?? false) {
                ToastService().showToast(context,
                    leadingIcon: const ImageView.svg(AppImages.successIcon),
                    title: AppStrings.successTitle,
                    subtitle: state.cancelAppointment.message?.message ?? '');
                onBackPress();
              } else {
                ToastService().showToast(context,
                    leadingIcon: const ImageView.svg(AppImages.error),
                    title: 'Error!!!',
                    subtitle: state.cancelAppointment.message?.message ?? '');
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
                    _userCubit.completeAppointment(
                      appointmentId: widget.appointmentId,
                    );
                  });
            } else if (state is UserNetworkErr) {
              return ErrorPage(
                  statusCode: state.message ?? '',
                  onTap: () {
                    _userCubit.completeAppointment(
                      appointmentId: widget.appointmentId,
                    );
                  });
            }
            return Stack(
              children: [
                Scaffold(
                  body: Stack(
                    children: [
                      AgoraVideoViewer(
                        client: client,
                        layoutType: Layout.floating,
                        enableHostControls: true,
                      ),
                      AgoraVideoButtons(
                        client: client,
                        addScreenSharing: false,
                        onDisconnect: () {
                          Modals.showDialogModal(
                            context,
                            page: destructiveActions(
                                context: context,
                                message:
                                    'Are you sure you want to end this session? As this would mark this appointmennt as completed',
                                primaryText: 'Make as completed.',
                                secondaryText: 'No, end call.',
                                primaryAction: () async {
                                  Navigator.pop(context);

                                  _userCubit.completeAppointment(
                                    appointmentId: widget.appointmentId,
                                  );
                                },
                                primaryBgColor:
                                    const Color.fromARGB(255, 35, 155, 51),
                                secondaryAction: () {
                                  Navigator.pop(context);
                                  onBackPress();
                                }),
                          );
                        },
                      ),
                      Positioned(
                          top: 100,
                          left: 30,
                          right: 30,
                          child: Align(
                              child: Column(
                            children: [
                              const Text(
                                'Ringing...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.patientName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))),
                    ],
                  ),
                ),
                if (state is CancelAppointmentLoading)
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
          }),
        ));
  }
}
