import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/profile/profile_setup.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../handlers/secure_handler.dart';
import '../../model/view_model/account_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/app_strings.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/image_view.dart';

class VerificationSuccessScreen extends StatefulWidget {
  const VerificationSuccessScreen({
    super.key,
  });

  @override
  State<VerificationSuccessScreen> createState() =>
      _VerificationSuccessScreenState();
}

class _VerificationSuccessScreenState extends State<VerificationSuccessScreen> {
  bool isVerificationFailed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
        lazy: false,
        create: (_) => AccountCubit(
            accountRepository: AccountRepositoryImpl(),
            viewModel: Provider.of<AccountViewModel>(context, listen: false)),
        child: BlocConsumer<AccountCubit, AccountStates>(
          listener: (context, state) {
            if (state is VerifyOtpLoaded) {
              if (state.verifyOtp.ok!) {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(
                    AppImages.tick,
                    height: 25,
                  ),
                  title: AppStrings.successTitle,
                  subtitle: state.verifyOtp.message ?? '',
                );
                if (state.verifyOtp.data is String) {
                } else {
                  StorageHandler.saveUserToken(
                      state.verifyOtp.data?.token?.accessToken ?? '');
                }
              } else {
                if (state.verifyOtp.message!.trim() ==
                    "Invalid or expired OTP") {
                  isVerificationFailed = true;
                }

                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(
                    AppImages.error,
                    height: 25,
                  ),
                  title: AppStrings.errorTitle,
                  subtitle: state.verifyOtp.message ?? '',
                );
              }
            } else if (state is ResendOtpLoaded) {
              // Modals.showToast(state.userData.message!,
              //     messageType: MessageType.success);

              ToastService().showToast(
                context,
                leadingIcon: const ImageView.svg(
                  AppImages.success,
                  height: 25,
                ),
                title: AppStrings.successTitle,
                subtitle: state.otp.message ?? '',
              );
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
          builder: (context, state) => Stack(
            children: [
              Scaffold(
                  backgroundColor: AppColors.lightPrimary,
                  body: Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.08,
                          ),
                          const Align(
                            child: ImageView.svg(
                              AppImages.appLogo1,
                              fit: BoxFit.fitWidth,
                              height: 25.47,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.13,
                                    ),
                                    Container(
                                      height: 152,
                                      width: 152,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        color: const Color(0xFFFFFFFF),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x0A000000),
                                            offset: Offset(0, 1),
                                            blurRadius: 1.5,
                                          ),
                                          BoxShadow(
                                            color: Color(0x0D2F3037),
                                            offset: Offset(0, 24),
                                            blurRadius: 34,
                                          ),
                                          BoxShadow(
                                            color: Color(0x0A222A35),
                                            offset: Offset(0, 4),
                                            blurRadius: 3,
                                          ),
                                          BoxShadow(
                                            color: Color(0x0D000000),
                                            offset: Offset(0, 1),
                                            blurRadius: 0.5,
                                          ),
                                        ],
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: ImageView.asset(
                                            AppImages.verifySuccessIcon),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 9, 8),
                                child: Text(
                                  'Verification successful',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    height: 1.4,
                                    color: const Color(0xFF131316),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Opacity(
                                opacity: 0.8,
                                child: Text(
                                  'Your account has been created successfully!',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ButtonView(
                                  onPressed: () {
                                    AppNavigator.pushAndReplacePage(context,
                                          page: const ProfileSetup(
                                            isEdit: false,
                                          ));
                                  },
                                  processin: state is ResendOtpLoading,
                                  borderRadius: 100,
                                  color: AppColors.lightSecondary,
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: AppColors.lightPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
