import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../blocs/accounts/account.dart';
import '../../../handlers/secure_handler.dart';
import '../../../model/view_model/account_view_model.dart';
import '../../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../../../res/app_strings.dart';
import '../../../utils/navigator/page_navigator.dart';
import '../../../utils/validator.dart';
import '../../../widgets/button_view.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/pin_code_view.dart';
import 'phone_number_verified.dart';

class PhoneNumberVerification extends StatefulWidget {
  const PhoneNumberVerification({
    super.key,
  });

  @override
  State<PhoneNumberVerification> createState() =>
      _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {
  final _pinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isCountdownComplete = false;

  bool isVerificationFailed = false;

  bool callOnce = true;

  Timer? _timer;
  int _secondsRemaining = 90;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 90;
      isCountdownComplete = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          isCountdownComplete = true;
        });
        timer.cancel();
      }
    });
  }

  String get timerText {
    final minutes = (_secondsRemaining ~/ 60).toString();
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '(${minutes}:${seconds}s)';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
              ToastService().showToast(
                context,
                leadingIcon: const ImageView.svg(
                  AppImages.success,
                  height: 25,
                ),
                title: AppStrings.successTitle,
                subtitle: state.otp.message ?? '',
              );

              startTimer();
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
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.08,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: ImageView.svg(
                                  AppImages.backBtn,
                                  fit: BoxFit.cover,
                                  height: 18,
                                ),
                              ),
                            ),
                            const SizedBox.shrink()
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),
                             bottomRight: Radius.circular(20)),
                            color: Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x08000000),
                                offset: Offset(0, 0),
                                blurRadius: 0,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color(0x0F191C21),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              ),
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 24),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0.4, 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 9, 8),
                                                child: Text(
                                                  'Verify your Phone number',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF131316),
                                                  ),
                                                ),
                                              ),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                  text:
                                                      'Enter the verification code sent to phone number ',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.6,
                                                    color:
                                                        const Color(0xFF6B7280),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: '08116848839',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        height: 1.6,
                                                        color: AppColors
                                                            .lightSecondary,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Form(
                                                key: _formKey,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 20.0),
                                                  child: PinCodeView(
                                                    length: 4,
                                                    controller: _pinController,
                                                    activeState:
                                                        isVerificationFailed,
                                                    onChanged: (_) {
                                                      isVerificationFailed =
                                                          false;

                                                      setState(() {});
                                                    },
                                                    onCompleted: (_) {
                                                      _formKey.currentState!
                                                          .validate();
                                                    },
                                                    validator: (value) {
                                                      return Validator.validate(
                                                          value, 'Otp');
                                                    },
                                                  ),
                                                ),
                                              ),
                                              if (!isCountdownComplete)
                                                Text(
                                                  "Didn’t receive a code?  $timerText",
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.6,
                                                    color:
                                                        const Color(0xFF3B82F6),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (!isCountdownComplete ||
                                            state is ResendOtpLoading)
                                          ...[]
                                        else ...[
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<AccountCubit>()
                                                  .resendOtp(email: "");
                                            },
                                            child: Text(
                                              'Resend Code $timerText',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.underline,
                                                height: 1.4,
                                                color: const Color(0xFF3B82F6),
                                                decorationColor:
                                                    const Color(0xFF3B82F6),
                                              ),
                                            ),
                                          ),
                                        ],
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        ButtonView(
                                            onPressed: () {
                                              // _verifyCode(context);
                                              AppNavigator.pushAndStackPage(context, page: PhoneNumberVerified());
                                            },
                                            processin:
                                                state is ResendOtpLoading,
                                            borderRadius: 100,
                                            title: 'processing...',
                                            color: AppColors.lightSecondary,
                                            child: const Text(
                                              'Verify',
                                              style: TextStyle(
                                                  color: AppColors.lightPrimary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      ],
                                    ),
                                  ),
                                  if (isCountdownComplete)
                                    Opacity(
                                      opacity: 0.8,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text:
                                              'Trouble verifying your e-mail? ',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.6,
                                            color: const Color(0xFF6B7280),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Reach out to support',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    AppColors.lightSecondary,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                height: 1.6,
                                                color: AppColors.lightSecondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              if (state is VerifyOtpLoading)
                Container(
                  color: AppColors.indicatorBgColor,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.indicatorColor,
                    ),
                  ),
                ),
            ],
          ),
        ));
  }

  _verifyCode(
    BuildContext ctx,
  ) {
    if (_formKey.currentState!.validate()) {
      ctx
          .read<AccountCubit>()
          .verifyOtp(otp: _pinController.text.trim(), email: "", url: "");
      // url: widget.isForgetPassword
      //     ? AppStrings.verifyOtpPasswordResetUrl
      //     : AppStrings.verifyOtpUrl);
    }
    // if (enterDigitCodeController.text.isNotEmpty) {
    //   if (widget.isForgetPassword) {

    //   } else {
    //     ctx.read<AccountCubit>().verifyCode(
    //           url: AppStrings.verifyCodeUrl,
    //           code: enterDigitCodeController.text.trim(),
    //           email: widget.email,
    //         );
    //   }
    //   FocusScope.of(ctx).unfocus();
    // } else {
    //   Modals.showToast('please enter code sent to your mail');
    // }
  }
}
