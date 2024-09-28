import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../../../blocs/accounts/account.dart';
import '../../../model/view_model/account_view_model.dart';
import '../../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../../res/app_strings.dart'; 
import '../../../utils/navigator/page_navigator.dart';
import '../../../utils/validator.dart';
import '../../../widgets/custom_toast.dart';
import '../../dashboard/dashboard.dart'; 

class PasswordManagerPage extends StatefulWidget {
  @override
  State<PasswordManagerPage> createState() => _PasswordManagerPageState();
}

class _PasswordManagerPageState extends State<PasswordManagerPage> {
  final _formKey = GlobalKey<FormState>();

  final _oldPasswordController = TextEditingController();

  final _newPasswordController = TextEditingController();

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
          lazy: false,
          create: (_) => AccountCubit(
              accountRepository: AccountRepositoryImpl(),
              viewModel: Provider.of<AccountViewModel>(context, listen: false)),
          child: BlocConsumer<AccountCubit, AccountStates>(
            listener: (context, state) {
              if (state is ChangePasswordLoaded) {
                if (state.changePassword.ok?? false) {
                  ToastService().showToast(
                    context,
                    leadingIcon: const ImageView.svg(AppImages.tick,
                                                        height: 25,
                    
                    ),
                    title: AppStrings.successTitle,
                    subtitle: state.changePassword.message ?? '',
                  );

                  AppNavigator.pushAndStackPage(context,
                      page: const Dashboard());
                } else {
                  ToastService().showToast(
                    context,
                    leadingIcon: const ImageView.svg(AppImages.error,
                    
                                                        height: 25,
                    
                    ),
                    title: AppStrings.errorTitle,
                    subtitle: state.changePassword.message ?? '',
                  );
                }
              } else if (state is AccountApiErr) {
                ToastService().showToast(
                  context,
                  leadingIcon: const ImageView.svg(AppImages.error,
                                                        height: 25,
                  
                  ),
                  title: AppStrings.errorTitle,
                  subtitle: state.message ?? '',
                );
              } else if (state is AccountNetworkErr) {
                if (state.message != null) {
                  ToastService().showToast(
                    context,
                    leadingIcon: const ImageView.svg(AppImages.error,
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
                          backgroundColor: Colors.white,
                          appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                centerTitle: true,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 19, bottom: 19),
                    child: SizedBox(
                      width: 15,
                      height: 15,
                      child: ImageView.svg(
                        AppImages.backBtn,
                        height: 15,
                      ),
                    ),
                  ),
                ),
                          ),
                          body:  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                      child: SingleChildScrollView(
                        child: Form(
                                key: _formKey,
                      
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(
                                      color: Color(
                                        0xFF40B93C,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(16, 16, 16, 15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
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
                                                      'Current Password',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color:
                                                            const Color(0xFF131316),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextEditView(
                                                  controller: _oldPasswordController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  hintText: ' ',
                                                  validator: (value) {
                                                    return Validator.validate(
                                                        value, 'Old password');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
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
                                                      'New Password',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color:
                                                            const Color(0xFF131316),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextEditView(
                                                  controller: _newPasswordController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  hintText: ' ',
                                                  validator: (value) {
                                                    return Validator.validate(
                                                        value, 'New password');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: ButtonView(
                                    
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AccountCubit>().changePassword(
                                              oldPassword:
                                                  _oldPasswordController.text.trim(),
                                              newPassword:
                                                  _newPasswordController.text.trim(),
                                            );
                                      }
                      
                                      FocusScope.of(context).unfocus();
                                    },
                                    borderRadius: 100,
                                    color: AppColors.lightSecondary,
                                    child: const Text(
                                      'Save changes',
                                      style: TextStyle(
                                          color: AppColors.lightPrimary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if(state is ChangePasswordProcessing)...[
                    Container(
              color: AppColors.indicatorBgColor,
              child:   Center(
                child: CircularProgressIndicator(color: AppColors.indicatorColor,),
              ),
            ),
                ]
              ],
            ),
    ),
        );
  }
}
