import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/profile/profile_setup.dart';

import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/image_view.dart';
import '../../widgets/pin_code_view.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;


  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _pinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

   int countdown = 60;

  bool isCountdownComplete = false;

  @override
  void initState() {
    startCountdown();

    super.initState();
  }

   Future<void> startCountdown() async {
    for (int i = 60; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        countdown = i;
      });
    }
    setState(() {
      isCountdownComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                  'Enter Verification Code',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    height: 1.4,
                                    color: const Color(0xFF131316),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'We’ve sent a code to',
                                    
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.6,
                                      color: const Color(0xFF6B7280),
                                    ),
                                  ),
                                  const SizedBox(width: 2,),
                                  Expanded(
                                    child: Text(
                                      widget.email,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.6,
                                        color:   AppColors.lightSecondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 40,),

                              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: PinCodeView(
                    length: 4,
                    controller: _pinController,
                    onChanged: (_) {},
                    onCompleted: (_) {},
                    // validator: Validator.validate
                  ),
                ),
              ),
               if (!isCountdownComplete)
                          Text(
                            "Resend code in $countdown secs",
                            
                          ),
                            ],
                          ),
                        ),
                        
                        ButtonView(
                            onPressed: () {
                                AppNavigator.pushAndReplacePage(context, page: ProfileSetup());
                            },
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
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0.5, 0),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 8.7, 0),
                        child: Text(
                          'Experiencing issues receiving the code?',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.4,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                 if (isCountdownComplete)  GestureDetector(
                                          onTap: () {
                                            
                                          },
                                          child: Text(
                                            'Resend Code',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.underline,
                                              height: 1.4,
                                              color: const Color(0xFF131316),
                                              decorationColor:
                                                  const Color(0xFF131316),
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
