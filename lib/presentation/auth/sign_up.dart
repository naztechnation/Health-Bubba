import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../model/view_model/onboard_view_model.dart';
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

  bool _isStrong = false;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<OnboardViewModel>(context, listen: true);

    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0.4, 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 9, 8),
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
                              Text(
                                'Let’s experience the joy of HealthBubba.',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.6,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Email Address',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF131316),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextEditView(
                                          controller: _emailController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Password',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF131316),
                                              ),
                                            ),
                                          ),
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
                                          obscureText:
                                              password.showPasswordStatus,
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              password.showPassword();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: password.showPasswordStatus
                                                  ? const Icon(
                                                      Icons
                                                          .visibility_off_outlined,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.visibility_outlined,
                                                      size: 18),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _isVisible,
                                    child: AnimatedBuilder(
                                      animation: _passwordController,
                                      builder: (context, child) {
                                        final password =
                                            _passwordController.text;

                                        return Align(
                                          alignment: Alignment.centerLeft,
                                          child: PasswordStrengthChecker(
                                            onStrengthChanged: (bool value) {
                                              setState(() {
                                                _isStrong = value;
                                              });
                                            },
                                            password: password,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Confirm New Password',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF131316),
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextEditView(
                                          controller:
                                              _confirmPasswordController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          validator: (value) {
                                            return Validator.validate(
                                                value, 'Password');
                                          },
                                          obscureText:
                                              password.showPasswordStatus,
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              password.showPassword();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: password.showPasswordStatus
                                                  ? const Icon(
                                                      Icons
                                                          .visibility_off_outlined,
                                                      size: 18,
                                                    )
                                                  : const Icon(
                                                      Icons.visibility_outlined,
                                                      size: 18),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ButtonView(
                                    onPressed: () {
                                AppNavigator.pushAndStackPage(context, page: VerifyCodeScreen());

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
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0.5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 8.7, 0),
                            child: Text(
                              'Already have an account?',
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
                                  AppNavigator.pushAndStackPage(context, page: SignInScreen());
                              
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
