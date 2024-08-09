import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/auth/sign_in.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/app_strings.dart';
import '../../utils/validator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/image_view.dart';
import 'sign_up.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  const CreateNewPasswordScreen(
      {super.key, required this.email, required this.otp});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final password = Provider.of<OnboardViewModel>(context, listen: true);

    return BlocProvider<AccountCubit>(
        lazy: false,
        create: (_) => AccountCubit(
            accountRepository: AccountRepositoryImpl(),
            viewModel: Provider.of<AccountViewModel>(context, listen: false)),
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
                AppNavigator.pushAndStackPage(context, page: SignInScreen());
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
                                                'Create New Password',
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
                                                            'Enter New Password',
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
                                                                    .all(16.0),
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
                                                            'Confirm New Password',
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
                                                            _confirmPasswordController,
                                                        borderColor: Colors
                                                            .grey.shade200,
                                                        borderWidth: 0.5,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Confirm Password Required';
                                                          }
                                                          if (value !=
                                                              _passwordController
                                                                  .text) {
                                                            return 'Passwords do not match!';
                                                          }
                                                          return null;
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
                                                                    .all(16.0),
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
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              ButtonView(
                                                  
                                                  onPressed: () {
                                                    _resetPassword(context);
                                                  },
                                                  borderRadius: 100,
                                                  color:
                                                      AppColors.lightSecondary,
                                                  child: const Text(
                                                    'Create New Password',
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0.5, 0),
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
                                            AppNavigator.pushAndReplacePage(
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
                  )),
                   if (state is AccountProcessing )
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

  _resetPassword(
    BuildContext ctx,
  ) {
    if (_formKey.currentState!.validate()) {
      ctx.read<AccountCubit>().resetPassword(
          otp: widget.otp,
          email: widget.email,
          newPassword: _passwordController.text.trim());
    }
  }
}
