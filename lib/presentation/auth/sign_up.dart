import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/widgets/custom_toast.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../blocs/accounts/account.dart';
import '../../handlers/secure_handler.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../utils/validator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/image_view.dart';
import '../../widgets/password_checker.dart';
import '../profile/profile_setup.dart';
import 'otp_sent_screen.dart';
import 'sign_in.dart';
import 'verify_code.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  final _referralController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isStrong = false;
  bool _isVisible = false;

  bool isLoading = false;
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<OnboardViewModel>(context, listen: true);

    return BlocProvider<AccountCubit>(
        lazy: false,
        create: (_) => AccountCubit(
            accountRepository: AccountRepositoryImpl(),
            viewModel: Provider.of<AccountViewModel>(context, listen: false)),
        child: BlocConsumer<AccountCubit, AccountStates>(
          listener: (context, state) {
            if (state is AccountLoaded) {
              if (state.userData.ok ?? false) {
                AppNavigator.pushAndStackPage(context,
                    page: OTPSentScreen(
                      email: _emailController.text.trim(),
                      isForgetPassword: false,
                    ));
              } else {
                if (state.userData.errors != null) {
                  ToastService().showToast(
                    context,
                    leadingIcon: const ImageView.svg(
                      AppImages.error,
                      height: 25,
                    ),
                    title: AppStrings.errorTitle,
                    subtitle: state.userData.message ?? '',
                  );
                }
              }
            } else if (state is GoogleRegLoaded) {
              if (state.google.ok ?? false) {
                StorageHandler.saveUserToken(
                    state.google.data?.token?.accessToken ?? '');
                StorageHandler.saveUserId(
                    state.google.data?.user?.id.toString() ?? '');
                StorageHandler.saveUserTitle(
                    state.google.data?.user?.title ?? '');
                StorageHandler.saveUserFirstName(
                    state.google.data?.user?.firstName ?? '');
                StorageHandler.saveLastName(
                    state.google.data?.user?.firstName ?? '');
                StorageHandler.saveUserPicture(
                    "${AppStrings.imageBaseUrl}${state.google.data?.user?.picture ?? ''}");

                StorageHandler.saveIsLoggedIn('true');
                ZegoUIKitPrebuiltCallInvitationService().init(
                  appID: AppStrings.zigoAppIdUrl,
                  appSign: AppStrings.zegoAppSign,
                  userID: state.google.data?.user?.id.toString() ?? '',
                  userName: state.google.data?.user?.lastName ?? '',
                  plugins: [ZegoUIKitSignalingPlugin()],
                );
                AppNavigator.pushAndReplacePage(context,
                    page: const ProfileSetup(
                      isEdit: false,
                    ));
              } else {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(
                    AppImages.error,
                    height: 25,
                  ),
                  title: AppStrings.errorTitle,
                  subtitle: state.google.message ?? '',
                );
              }
            } else if (state is AppleRegLoaded) {
              if (state.google.ok ?? false) {
                StorageHandler.saveUserToken(
                    state.google.data?.token?.accessToken ?? '');
                StorageHandler.saveUserId(
                    state.google.data?.user?.id.toString() ?? '');
                StorageHandler.saveUserTitle(
                    state.google.data?.user?.title ?? '');
                StorageHandler.saveUserFirstName(
                    state.google.data?.user?.firstName ?? '');
                StorageHandler.saveLastName(
                    state.google.data?.user?.firstName ?? '');
                StorageHandler.saveUserPicture(
                    "${AppStrings.imageBaseUrl}${state.google.data?.user?.picture ?? ''}");

                StorageHandler.saveIsLoggedIn('true');
                ZegoUIKitPrebuiltCallInvitationService().init(
                  appID: AppStrings.zigoAppIdUrl,
                  appSign: AppStrings.zegoAppSign,
                  userID: state.google.data?.user?.id.toString() ?? '',
                  userName: state.google.data?.user?.lastName ?? '',
                  plugins: [ZegoUIKitSignalingPlugin()],
                );
                AppNavigator.pushAndReplacePage(context,
                    page: const ProfileSetup(
                      isEdit: false,
                    ));
              } else {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(
                    AppImages.error,
                    height: 25,
                  ),
                  title: AppStrings.errorTitle,
                  subtitle: state.google.message ?? '',
                );

                StorageHandler.saveIsLoggedIn('');
              }
            } else if (state is AccountApiErr) {
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
              StorageHandler.saveIsLoggedIn('');
            } else if (state is AccountNetworkErr) {
              ToastService().showToast(
                context,
                leadingIcon: const ImageView.svg(
                  AppImages.error,
                  height: 25,
                ),
                title: AppStrings.errorTitle,
                subtitle: state.message ?? '',
              );

              StorageHandler.saveIsLoggedIn('');
            }
          },
          builder: (context, state) => Stack(
            children: [
              Scaffold(
                  backgroundColor: AppColors.lightPrimary,
                  body: Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
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
                              Align(
                                child: Text(
                                  'Sign Up',
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
                                height: 15,
                              ),
                              Align(
                                child: Text(
                                  'Let’s experience the joy of HealthBubba.',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.6,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Email Address',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                keyboardType: TextInputType.emailAddress,
                                borderWidth: 0.5,
                                validator: (value) {
                                  return Validator.validateEmail(
                                      value ?? '', 'Email');
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Phone Number',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _phoneController,
                                borderColor: Colors.grey.shade200,
                                keyboardType: TextInputType.number,
                                borderWidth: 0.5,
                                maxLength: 11,
                                validator: (value) {
                                  return Validator.validate(
                                      value, 'Phone Number');
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Password',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _passwordController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      _isVisible = true;
                                    } else {
                                      _isVisible = false;
                                    }
                                  });
                                },
                                validator: (value) {
                                  return Validator.validate(value, 'Password');
                                },
                                obscureText: userAuth.showPasswordStatus,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    userAuth.showPassword();
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: userAuth.showPasswordStatus
                                          ? const ImageView.svg(
                                              AppImages.eyeClosedIcon,
                                              color: Colors.grey,
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: ImageView.svg(
                                                AppImages.eyeOpenIcon,
                                                color: Colors.grey,
                                              ),
                                            )),
                                ),
                              ),
                              if (_isVisible)
                                const SizedBox(
                                  height: 20,
                                ),
                              Visibility(
                                visible: _isVisible,
                                child: AnimatedBuilder(
                                  animation: _passwordController,
                                  builder: (context, child) {
                                    final password = _passwordController.text;

                                    return PasswordStrengthChecker(
                                      onStrengthChanged: (bool value) {
                                        setState(() {
                                          _isStrong = value;
                                        });
                                      },
                                      password: password,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Confirm New Password',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _confirmPasswordController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm Password Required';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match!';
                                  }
                                  return null;
                                },
                                obscureText: userAuth.showConfirmPasswordStatus,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    userAuth.showConfirmPassword();
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: userAuth.showConfirmPasswordStatus
                                          ? const ImageView.svg(
                                              AppImages.eyeClosedIcon,
                                              color: Colors.grey,
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: ImageView.svg(
                                                AppImages.eyeOpenIcon,
                                                color: Colors.grey,
                                              ),
                                            )),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Enter Referral code(Optional)',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _referralController,
                                borderColor: Colors.grey.shade200,
                                keyboardType: TextInputType.name,
                                borderWidth: 0.5,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Row(
                                  children: [
                                    CustomCheckbox(
                                      isChecked: isAgreed,
                                      onChanged: (value) {
                                        isAgreed = value;
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'I agree to HealthBubba’s ',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                          children: [
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  _launchUrl(
                                                      'https://healthbubba.com/terms');
                                                },
                                              text: 'Terms and Conditions',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.3,
                                                color: const Color(0xFF40B93C),
                                              ),
                                            ),
                                            const TextSpan(
                                              text: ' and ',
                                            ),
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  _launchUrl(
                                                      'https://healthbubba.com/privacy-policy');
                                                },
                                              text: 'Privacy Policy',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.3,
                                                color: const Color(0xFF40B93C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              ButtonView(
                                  onPressed: () {
                                    registerUser(context: context);
                                  },
                                  borderRadius: 100,
                                  color: AppColors.lightSecondary,
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                        color: AppColors.lightPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                              const SizedBox(
                                height: 30,
                              ),
                              Opacity(
                                opacity: 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        width: 200,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'OR',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        width: 200,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    final GoogleSignIn googleSignIn =
                                        GoogleSignIn();
                                    await googleSignIn.signOut();
                                    setState(() {
                                      isLoading = true;
                                    });
                                    String email =
                                        await userAuth.signInWithGoogle();

                                    if (email.isNotEmpty) {
                                      await context
                                          .read<AccountCubit>()
                                          .regWithGoogle(
                                            email: email ?? '',
                                            dob: '',
                                            sex: '',
                                            firstname: '',
                                            fcm: '',
                                          );
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      ToastService().showToast(
                                        context,
                                        leadingIcon: const ImageView.svg(
                                          height: 25,
                                          AppImages.error,
                                        ),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'verification failed',
                                      );
                                    }
                                  } catch (error) {
                                    print(error);
                                  }
                                },
                                child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: const Color(0xFFE9E9E9),
                                            width: 0.8)),
                                    child: const Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ImageView.svg(AppImages.googleLogo),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                                color: AppColors.lightSecondary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              if (Platform.isIOS)
                                const SizedBox(
                                  height: 20,
                                ),
                              if (Platform.isIOS)
                                GestureDetector(
                                  onTap: () async {
                                    final credential = await SignInWithApple
                                        .getAppleIDCredential(
                                      scopes: [
                                        AppleIDAuthorizationScopes.email,
                                        AppleIDAuthorizationScopes.fullName,
                                      ],
                                    );
                                    if (credential.userIdentifier != null) {
                                      context.read<AccountCubit>().regWithApple(
                                            email: credential.email ?? '',
                                            dob: '',
                                            sex: '',
                                            firstname:
                                                credential.familyName ?? '',
                                            fcm: '',
                                            appleId:
                                                credential.userIdentifier ?? '',
                                          );
                                    } else {
                                      ToastService().showToast(
                                        context,
                                        leadingIcon: const ImageView.svg(
                                          AppImages.error,
                                          height: 25,
                                        ),
                                        title: AppStrings.successTitle,
                                        subtitle: 'verification failed',
                                      );
                                    }
                                  },
                                  child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFFE9E9E9),
                                              width: 0.8)),
                                      child: const Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ImageView.svg(
                                              AppImages.appleLogo,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Continue with Apple',
                                              style: TextStyle(
                                                  color:
                                                      AppColors.lightSecondary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              const SizedBox(
                                height: 30,
                              ),
                              Opacity(
                                opacity: 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AppNavigator.pushAndStackPage(context,
                                            page: SignInScreen(isFromMainPage: false));
                                      },
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          height: 1.4,
                                          color: const Color(0xFF40B93C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),

              //stephenagbo001@gmail.com  Scarface@06166 08098999999
              if (state is AppleRegLoading || state is AccountProcessing)
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

  registerUser({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      
        if (isAgreed) {
          context.read<AccountCubit>().registerUser(
                email: _emailController.text.trim(),
                referral: _referralController.text.trim(),
                phone: _phoneController.text.trim(),
                password: _passwordController.text.trim(),
              );
        } else {
          ToastService().showToast(
            context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: AppStrings.errorTitle,
            subtitle: 'Please agree with our terms to continue',
          );
        }
      
    }
    FocusScope.of(context).unfocus();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
