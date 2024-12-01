import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/auth/continue_signin.dart';
import 'package:healthbubba/presentation/auth/sign_up.dart';
import 'package:healthbubba/presentation/profile/profile_setup.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../blocs/accounts/account.dart';
import '../../handlers/secure_handler.dart';

import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/app_strings.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../utils/validator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/image_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../dashboard/dashboard.dart';

class SignInScreen extends StatefulWidget {
  final bool isFromMainPage;

  const SignInScreen({super.key, required this.isFromMainPage});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String fcmToken = "";

  getUserToken()async{
      fcmToken = await StorageHandler.getFirebaseToken() ?? '';
  }

  @override
  void initState() {
     getUserToken();
    StorageHandler.saveIsLoggedIn('');

    super.initState();
  }

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
            if (state is GoogleLoginLoaded) {
              if (state.google.ok ?? false) {
                StorageHandler.saveUserToken(state.google.data?.token ?? '');
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

                if (state.google.data?.user?.firstName == null ||
                    state.google.data?.user?.firstName == '') {
                  AppNavigator.pushAndStackPage(context,
                      page: const ProfileSetup(
                        isEdit: false,
                      ));
                } else {
                  AppNavigator.pushAndStackPage(context,
                      page: const Dashboard());
                }
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
            } else if (state is AppleLoginLoaded) {
              if (state.google.ok ?? false) {
                StorageHandler.saveUserToken(state.google.data?.token ?? '');
                StorageHandler.saveUserId(
                    state.google.data?.user?.id.toString() ?? '');
                StorageHandler.saveUserTitle(
                    state.google.data?.user?.title ?? '');
                StorageHandler.saveUserFirstName(
                    state.google.data?.user?.firstName ?? '');
                StorageHandler.saveLastName(
                    state.google.data?.user?.firstName ?? '');
                StorageHandler.saveUserPicture(
                    state.google.data?.user?.picture ?? '');

                StorageHandler.saveIsLoggedIn('true');
                ZegoUIKitPrebuiltCallInvitationService().init(
                  appID: AppStrings.zigoAppIdUrl,
                  appSign: AppStrings.zegoAppSign,
                  userID: state.google.data?.user?.id.toString() ?? '',
                  userName: state.google.data?.user?.lastName ?? '',
                  plugins: [ZegoUIKitSignalingPlugin()],
                );

                if (state.google.data?.user?.firstName == null ||
                    state.google.data?.user?.firstName == '') {
                  AppNavigator.pushAndStackPage(context,
                      page: const ProfileSetup(
                        isEdit: false,
                      ));
                } else {
                  AppNavigator.pushAndStackPage(context,
                      page: const Dashboard());
                }
              } else {
                StorageHandler.saveIsLoggedIn('');

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
            } else if (state is AccountApiErr) {
              StorageHandler.saveIsLoggedIn('');

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
              StorageHandler.saveIsLoggedIn('');

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
              WillPopScope(
                onWillPop: () async {
                  //  SystemNavigator.pop();
                  if (!widget.isFromMainPage) {
                    return true;
                  } else {
                    return false;
                  }
                },
                child: Scaffold(
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
                                              0, 0, 0.4, 32),
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
                                                  'Sign In',
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
                                              Text(
                                                'Hey there, welcome back!',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.6,
                                                  color:
                                                      const Color(0xFF6B7280),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 23),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 6),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 0, 8),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              'Email Address',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        TextEditView(
                                                          controller:
                                                              _emailController,
                                                          borderColor: Colors
                                                              .grey.shade200,
                                                          borderWidth: 0.5,
                                                          validator: (value) {
                                                            return Validator
                                                                .validate(value,
                                                                    'Email');
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ButtonView(
                                                onPressed: () {
                                                //  Modals.showToast(fcmToken, context);
                                                    _loginUser(context);
                                                },
                                                borderRadius: 100,
                                                color: AppColors.lightSecondary,
                                                child: const Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .lightPrimary,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        String email =
                                            await userAuth.signInWithGoogle();

                                        if (email.isNotEmpty) {
                                          await context
                                              .read<AccountCubit>()
                                              .loginWithGoogle(
                                                email: email, fcmToken: fcmToken,
                                              );
                                        } else {
                                          ToastService().showToast(
                                            context,
                                            leadingIcon: const ImageView.svg(
                                                AppImages.error),
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
                                              ImageView.svg(
                                                  AppImages.googleLogo),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Continue with Google',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .lightSecondary,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                          await context
                                              .read<AccountCubit>()
                                              .loginWithApple(
                                                email: credential.email ?? '',
                                                appleId:
                                                    credential.userIdentifier ??
                                                        '', fcmToken: fcmToken,
                                              );
                                        } else {
                                          ToastService().showToast(
                                            context,
                                            leadingIcon: const ImageView.svg(
                                                AppImages.error),
                                            title: AppStrings.errorTitle,
                                            subtitle: 'verification failed',
                                          );
                                        }
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                100,
                                              ),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFE9E9E9),
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
                                                      color: AppColors
                                                          .lightSecondary,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0.5, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8.7, 0),
                                            child: Text(
                                              'Don’t have an account?',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF6B7280),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: SignUpScreen());
                                            },
                                            child: Text(
                                              'Register',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF093126),
                                              ),
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
                      ),
                    )),
              ),
              if (userAuth.status ||
                  state is GoogleLoginLoading ||
                  state is AppleLoginLoading)
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

  _loginUser(
    BuildContext ctx,
  ) {
    if (_formKey.currentState!.validate()) {
      AppNavigator.pushAndStackPage(context,
          page:
              ContinueSignInScreen(emailAddress: _emailController.text.trim()));
    }

    FocusScope.of(context).unfocus();
  }
}
