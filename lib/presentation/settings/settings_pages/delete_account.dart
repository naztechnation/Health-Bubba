import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../blocs/users/users.dart';
import '../../../handlers/secure_handler.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_strings.dart';
import '../../../utils/navigator/page_navigator.dart';
import '../../../utils/validator.dart';
import '../../../widgets/checkbox.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/modals.dart';
import '../../auth/sign_in.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: DeleteAccountScreen(),
    );
  }
}

class DeleteAccountScreen extends StatefulWidget {
  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  late UserCubit _userCubit;

  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is DeactivateAccountLoaded) {
        if (state.userAccount.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.successIcon),
              title: AppStrings.successTitle,
              subtitle: state.userAccount.message ?? '');

          StorageHandler.clearCache();
          StorageHandler.saveOnboardState('true');

          AppNavigator.pushAndReplacePage(context, page: SignInScreen());
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.userAccount.message ?? '');
        }
      } else if (state is UserApiErr || state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.deactivateUserAccount(
                details: _detailsController.text.trim(),
                reason: _titleController.text.trim(),
              );
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.deactivateUserAccount(
                details: _detailsController.text.trim(),
                reason: _titleController.text.trim(),
              );
            });
      }
      return Stack(
        children: [
          Scaffold(
            body: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Center(
                  child: Text(
                    'Delete Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
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
                actions: const [
                  Text(
                    '         ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 12, 18.4, 12),
                                child: Text(
                                  'We’re sad to see you go! Kindly let us know where we let you down and we’ll be sure to review it and make improvements asap. Thank you.',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.6,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Reason for deactivating',
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
                                controller: _titleController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: 'Select',
                                readOnly: true,
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.all(17.0),
                                  child: ImageView.svg(
                                    AppImages.dropDown,
                                    scale: 0.8,
                                  ),
                                ),
                                onTap: () {
                                  Modals.showDialogModal(context,
                                      page: titleModalContent(context));
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE5E7EB),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Provide more details',
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
                                  controller: _detailsController,
                                  maxLines: 5,
                                  validator: (value) {
                                    return Validator.validate(value, 'Reason');
                                  },
                                  hintText:
                                      'Please explain the reason you are deactivating',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCheckbox(
                                isChecked: true,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'I would like my account to be deleted and I acknowledge that my details will be completely removed from the HealthBubba’s system after 30days.',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: const Color(0xFF131316),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, -4),
                      blurRadius: 8.8999996185,
                    ),
                  ],
                ),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
                    child: ButtonView(
                        onPressed: () {
                          if (_titleController.text.trim().isNotEmpty) {
                            if (_formKey.currentState!.validate()) {
                              _userCubit.deactivateUserAccount(
                                details: _detailsController.text.trim(),
                                reason: _titleController.text.trim(),
                              );
                            }
                          } else {
                            Modals.showToast(
                                'Select Reason for deactivating', context);
                          }
                        },
                        borderRadius: 100,
                        color: const Color(0xFFF70000),
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(
                              color: AppColors.lightPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ))),
              ),
            ),
          ),
           if (state is DeactivateAccountLoading )
            Container(
              color: AppColors.indicatorBgColor,
              child:   Center(
                child: CircularProgressIndicator(color: AppColors.indicatorColor,),
              ),
            ),
        ],
      );
    });
  }

  List<String> reasons = [
    'Privacy Concerns',
    'Technical Issues',
    'Service Quality',
    'Cost/Too Expensive',
    'No Longer Needed',
    'Prefer In-Person Visits',
    'Switching to Another Service',
    'Poor User Experience',
    'Others'
  ];

  titleModalContent(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 1),
            blurRadius: 1.5,
          ),
          BoxShadow(
            color: Color(0x0D2F3037),
            offset: Offset(0, 24),
            blurRadius: 34,
          ),
          BoxShadow(
            color: Color(0x0A222A35),
            offset: Offset(0, 4),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 0.5,
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: reasons.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade300,
          height: 0,
        ),
        itemBuilder: (context, index) {
          String title = reasons[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _titleController.text = title;
              });

              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all((index == 0) ? 8 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15),
                child: Text(
                  title,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.5,
                    color: const Color(0xFF030712),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
