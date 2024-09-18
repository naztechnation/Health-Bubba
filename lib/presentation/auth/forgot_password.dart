import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart'; 
import '../../res/app_strings.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/button_view.dart';

import '../../widgets/custom_toast.dart';
import '../../widgets/image_view.dart';
import 'sign_up.dart';
import 'verify_code.dart';

class ForgotPassword extends StatelessWidget {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
            lazy: false,
            create: (_) => AccountCubit(
                accountRepository: AccountRepositoryImpl(),
                viewModel:
                    Provider.of<AccountViewModel>(context, listen: false)),
            child: BlocConsumer<AccountCubit, AccountStates>(
                listener: (context, state) {
                  if (state is ResetPasswordLoaded) {
                    if (state.userData.ok ?? false) {
                      ToastService().showToast(
                        context,
                        leadingIcon: const ImageView.svg(AppImages.tick),
                        title: AppStrings.successTitle,
                        subtitle: state.userData.message ?? '',
                      );
                          AppNavigator.pushAndStackPage(context, page: VerifyCodeScreen(email: _emailController.text.trim(), isForgetPassword: true,));

                      
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
                builder: (context, state) => Stack(
                  children: [
                    Scaffold(
                              backgroundColor: AppColors.lightPrimary,
                              body:  Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height * 0.06,
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
                                          mainAxisAlignment: MainAxisAlignment.start,
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
                                                    margin: const EdgeInsets.fromLTRB(
                                                        0, 0, 9, 8),
                                                    child: Text(
                                                      'Reset Password',
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
                                                    'Enter the email you have registered with so we could send you an OTP to reset your password.',
                                                    textAlign: TextAlign.center,
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
                                                        margin:
                                                            const EdgeInsets.fromLTRB(
                                                                0, 0, 0, 16),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              margin: const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 0, 8),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment.topLeft,
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
                                                            Form(
                                                              key: _formKey,
                                                              child: TextEditView(
                                                                controller:
                                                                    _emailController,
                                                                borderColor: Colors
                                                                    .grey.shade200,
                                                                borderWidth: 0.5,
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
                                                          initiateResetPassword(context);
                                                        },
                                                        borderRadius: 100,
                                                        color:
                                                            AppColors.lightSecondary,
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
                          )),
                          if (state is ResetPasswordLoading )
            Container(
              color: AppColors.indicatorBgColor,
              child:   Center(
                child: CircularProgressIndicator(color: AppColors.indicatorColor,),
              ),
            ),
                  ],
                ),
    ));
  }

  initiateResetPassword(
    BuildContext ctx,
  ) {
    if (_formKey.currentState!.validate()) {
      ctx.read<AccountCubit>().initiateResetPassword(
             
            email: _emailController.text.trim(),
          );
    }

    FocusScope.of(ctx).unfocus();

  }
}
