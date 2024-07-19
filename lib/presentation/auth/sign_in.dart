import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/auth/sign_up.dart';
import 'package:healthbubba/presentation/auth/verify_code.dart';
import 'package:healthbubba/res/app_routes.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

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
import '../../widgets/checkbox.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/image_view.dart';
import '../dashboard/dashboard.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _checkboxState = false;

  void _handleCheckboxChanged(bool newValue) {
    setState(() {
      _checkboxState = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<OnboardViewModel>(context, listen: true);

    return Scaffold(
        backgroundColor: AppColors.lightPrimary,
        body: BlocProvider<AccountCubit>(
            lazy: false,
            create: (_) => AccountCubit(
                accountRepository: AccountRepositoryImpl(),
                viewModel:
                    Provider.of<AccountViewModel>(context, listen: false)),
            child: BlocConsumer<AccountCubit, AccountStates>(
                listener: (context, state) {
                  if (state is LoginLoaded) {
                    if (state.loginData.ok?? false) {
                      ToastService().showToast(
                        context,
                        leadingIcon: const ImageView.svg(AppImages.tick),
                        title: AppStrings.successTitle,
                        subtitle: state.loginData.message ?? '',
                      );

                      if (state.loginData.message!.toLowerCase().trim() ==
                          'Operation successful. An OTP code was sent to your email address.'.toLowerCase()) {
                        AppNavigator.pushAndStackPage(context,
                            page: VerifyCodeScreen(
                              email: _emailController.text.trim(),
                              isForgetPassword: false,
                            ));
                      } else {
                        StorageHandler.saveUserToken(
                            state.loginData.data?.token ?? '');
                            StorageHandler.saveUserId(
                            state.loginData.data?.user?.id.toString() ?? '');
                        StorageHandler.saveUserTitle(
                            state.loginData.data?.user?.title ?? '');
                        StorageHandler.saveUserFirstName(
                            state.loginData.data?.user?.firstName ?? '');
                        StorageHandler.saveUserPicture(
                            "${AppStrings.imageBaseUrl}${state.loginData.data?.user?.picture ?? ''}");
                       
                        if (_checkboxState) {
                          StorageHandler.saveIsLoggedIn('true');
                        } else {
                          StorageHandler.saveIsLoggedIn('');
                        }
                        AppNavigator.pushAndStackPage(context,
                            page: const Dashboard());
                      }
                    } else {
                      ToastService().showToast(
                        context,
                        leadingIcon: const ImageView.svg(AppImages.error),
                        title: AppStrings.errorTitle,
                        subtitle: state.loginData.message ?? '',
                      );
                    }
                  } else if (state is AccountApiErr) {
                    ToastService().showToast(
                      context,
                      leadingIcon: const ImageView.svg(AppImages.error),
                      title: AppStrings.errorTitle,
                      subtitle: state.message ?? '',
                    );
                  } else if (state is AccountNetworkErr) {
                    if (state.message != null) {
                      ToastService().showToast(
                        context,
                        leadingIcon: const ImageView.svg(AppImages.error),
                        title: AppStrings.errorTitle,
                        subtitle: state.message ?? '',
                      );
                    }
                  }
                },
                builder: (context, state) => Container(
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
                                                  0, 0, 0, 40),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 16),
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
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 16),
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
                                                              'Password',
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
                                                              _passwordController,
                                                          borderColor: Colors
                                                              .grey.shade200,
                                                          borderWidth: 0.5,
                                                          validator: (value) {
                                                            return Validator
                                                                .validate(value,
                                                                    'Password');
                                                          },
                                                          obscureText: password
                                                              .showPasswordStatus,
                                                          suffixIcon:
                                                              GestureDetector(
                                                            onTap: () {
                                                              password
                                                                  .showPassword();
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      16.0),
                                                              child: password
                                                                      .showPasswordStatus
                                                                  ? const Icon(
                                                                      Icons
                                                                          .visibility_off_outlined,
                                                                      size: 18,
                                                                    )
                                                                  : const Icon(
                                                                      Icons
                                                                          .visibility_outlined,
                                                                      size: 18),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(1, 0, 0.5, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomCheckbox(
                                                              isChecked:
                                                                  _checkboxState,
                                                              onChanged:
                                                                  (value) {
                                                                _handleCheckboxChanged(
                                                                    value);
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              'Keep me logged in',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            AppNavigator
                                                                .pushAndReplaceName(
                                                                    context,
                                                                    name: AppRoutes
                                                                        .forgetPassword);
                                                          },
                                                          child: Text(
                                                            'Forgot Password?',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF131316),
                                                              decorationColor:
                                                                  const Color(
                                                                      0xFF131316),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ButtonView(
                                                processing:
                                                    state is AccountLoading,
                                                onPressed: () {
                                                  _loginUser(context);
                                                },
                                                borderRadius: 100,
                                                color: AppColors.lightSecondary,
                                                child: const Text(
                                                  'Sign In',
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
                                                color: const Color(0xFF40B93C),
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
                    ))));
  }

  _loginUser(
    BuildContext ctx,
  ) {
    if (_formKey.currentState!.validate()) {
      ctx.read<AccountCubit>().loginUser(
            password: _passwordController.text.trim(),
            email: _emailController.text.trim(),
          );
    }

    FocusScope.of(context).unfocus();
  }
}
