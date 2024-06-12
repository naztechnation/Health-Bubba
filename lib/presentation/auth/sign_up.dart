import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/widgets/custom_toast.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../utils/validator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/image_view.dart';
import '../../widgets/password_checker.dart';
import 'sign_in.dart';
import 'verify_code.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isStrong = false;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<OnboardViewModel>(context, listen: true);

    return Scaffold(
        backgroundColor: AppColors.lightPrimary,
        body: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
            child: BlocProvider<AccountCubit>(
                lazy: false,
                create: (_) => AccountCubit(
                    accountRepository: AccountRepositoryImpl(),
                    viewModel:
                        Provider.of<AccountViewModel>(context, listen: false)),
                child: BlocConsumer<AccountCubit, AccountStates>(
                    listener: (context, state) {
                      if (state is AccountLoaded) {
                        if (state.userData.ok ?? false) {
                          ToastService().showToast(
                            context,
                            leadingIcon: const ImageView.svg(AppImages.tick),
                            title: AppStrings.successTitle,
                            subtitle: state.userData.message ?? '',
                          );
                          AppNavigator.pushAndStackPage(context,
                              page:   VerifyCodeScreen(email: _emailController.text.trim(),isForgetPassword: false,));
                        } else {
                          if (state.userData.errors != null) {
                            ToastService().showToast(
                              context,
                              leadingIcon: const ImageView.svg(AppImages.error),
                              title: AppStrings.errorTitle,
                              subtitle: state.userData.message ?? '',
                            );
                          }
                        }
                      } else if (state is AccountApiErr) {
                        if (state.message != null) {
                          ToastService().showToast(
                            context,
                            leadingIcon: const ImageView.svg(AppImages.error),
                            title: AppStrings.errorTitle,
                            subtitle: state.message ?? '',
                          );
                        }
                      } else if (state is AccountNetworkErr) {
                        ToastService().showToast(
                          context,
                          leadingIcon: const ImageView.svg(AppImages.error),
                          title: AppStrings.errorTitle,
                          subtitle: state.message ?? '',
                        );
                      }
                    },
                    builder: (context, state) => SingleChildScrollView(
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
                                        value, 'Email');
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
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
                                    return Validator.validate(
                                        value, 'Password');
                                  },
                                  obscureText: password.showPasswordStatus,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      password.showPassword();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: password.showPasswordStatus
                                          ? const Icon(
                                              Icons.visibility_off_outlined,
                                              size: 18,
                                            )
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              size: 18),
                                    ),
                                  ),
                                ),
                             if( _isVisible)   const SizedBox(
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
                                  obscureText: password.showConfirmPasswordStatus,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      password.showConfirmPassword();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: password.showConfirmPasswordStatus
                                          ? const Icon(
                                              Icons.visibility_off_outlined,
                                              size: 18,
                                            )
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              size: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                ButtonView(
                                    onPressed: () {
                                      registerUser(context: context);
                                    },
                                    processing: state is AccountProcessing,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              page: SignInScreen());
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
                        )))));
  }

  registerUser({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      if (_isVisible) {
        if (_isStrong) {
          context.read<AccountCubit>().registerUser(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              );
        } else {
          ToastService().showToast(
            context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: AppStrings.errorTitle,
            subtitle: '',
          );
        }
      }
    }
    FocusScope.of(context).unfocus();
  }
}
