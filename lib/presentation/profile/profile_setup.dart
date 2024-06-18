import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/user/qualification.dart';
import '../../model/view_model/account_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../utils/validator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/error_page.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/text_edit_view.dart';
import 'work_information.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: ProfileSetupPage(),
    );
  }
}

class ProfileSetupPage extends StatefulWidget {
  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  late AccountCubit _accountCubit;
  List<QualificationData> qualifications = [];

  List<int> _selectedQualificationsIds = [];

  void _saveSelectedQualificationsIds() {
    _selectedQualificationsIds =
        _selectedItems.map((item) => item.qualificationId ?? 0).toList();
    if (_selectedQualificationsIds.isNotEmpty) {
      _accountCubit.selectQualifications(
          qualificationIds: _selectedQualificationsIds);
    } else {
      ToastService().showToast(context,
          leadingIcon: const ImageView.svg(AppImages.error),
          title: 'Error',
          subtitle: 'Select atleast one qualification to continue');
    }
  }

  getSpecialties() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.loadQualifications();
  }

  @override
  void initState() {
    getSpecialties();
    _updateTextField();
    super.initState();
  }

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _licenceNumberController = TextEditingController();
  final _yearsOfExpController = TextEditingController();
  final _hospitalAffliateController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  final _titleController = TextEditingController();
  final _qualificationController = TextEditingController();

  bool isAgreed = false;

  final _formKey = GlobalKey<FormState>();

  List<String> titles = [
    "Dr.",
    "Mr.",
    "Ms.",
    "Mrs.",
    "Prof.",
    "Fr. (Father)",
    "Sr. (Sister)"
  ];

  List<QualificationData> _selectedItems = [];

  void _onCheckboxChanged(bool isChecked, QualificationData item) {
    setState(() {
      if (isChecked) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      _updateTextField();
    });
  }

  void _updateTextField() {
    _qualificationController.text =
        _selectedItems.map((item) => item.qualificationName).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is QualificationsLoaded) {
        if (state.qualification.ok ?? false) {
          qualifications = state.qualification.message?.data ?? [];
          setState(() {});
        } else {}
      } else if (state is SelectQualificationsLoaded) {
        if (state.qualification.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.success),
              title: AppStrings.successTitle,
              subtitle: state.qualification.message?.message ?? '');
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: AppStrings.errorTitle,
              subtitle: state.qualification.message?.message ?? '');
        }
      } else if (state is UpdateUserLoaded) {
        if (state.updateUser.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.success),
              title: AppStrings.successTitle,
              subtitle: state.updateUser.message ?? '');
          AppNavigator.pushAndReplacePage(context,
              page: const WorkInformation());
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: AppStrings.errorTitle,
              subtitle: state.updateUser.message ?? '');
        }
      }
    }, builder: (context, state) {
      if (state is AccountApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.loadQualifications();
            });
      } else if (state is AccountNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.loadQualifications();
            });
      }

      return (state is GetSpecialtiesLoading ||
              state is SelectQualificationsLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.07,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 11),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 1.4, 8),
                                child: Text(
                                  'Setup your Profile',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: const Color(0xFF0A0D14),
                                  ),
                                ),
                              ),
                              Text(
                                'Provide all the essential details below',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.7,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 63),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFCFCFC),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 15, 16, 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Title',
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
                                                page:
                                                    titleModalContent(context));
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'First name',
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
                                          controller: _firstnameController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          validator: (value) {
                                            return Validator.validate(
                                                value, 'First name');
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Last name',
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
                                          controller: _lastnameController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          validator: (value) {
                                            return Validator.validate(
                                                value, 'Last name');
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Medical Qualification',
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
                                          controller: _qualificationController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          hintText: 'MBBS, MCPS, MD',
                                          suffixIcon: const Padding(
                                            padding: EdgeInsets.all(17.0),
                                            child: ImageView.svg(
                                              AppImages.dropDown,
                                              scale: 0.8,
                                            ),
                                          ),
                                          readOnly: true,
                                          onTap: () {
                                            if (qualifications.isNotEmpty) {
                                              _selectedItems.clear();
                                              _qualificationController.clear();
                                              Modals.showDialogModal(context,
                                                  page:
                                                      qualificationModalContent(
                                                          context));
                                            } else {
                                              _accountCubit
                                                  .loadQualifications();
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Medical License Number',
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
                                          controller: _licenceNumberController,
                                          borderColor: Colors.grey.shade200,
                                          keyboardType: TextInputType.number,
                                          borderWidth: 0.5,
                                          validator: (value) {
                                            return Validator.validate(
                                                value, 'License Number');
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Years of Experience',
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
                                          controller: _yearsOfExpController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          hintText: '',
                                           keyboardType: TextInputType.number,
                                          validator: (value) {
                                            return Validator.validate(
                                                value, 'Years of Experience');
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Clinic/ Hospital Affiliation',
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
                                          controller:
                                              _hospitalAffliateController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          hintText: '',
                                          validator: (value) {
                                            return Validator.validate(value,
                                                'Clinic/ Hospital Affiliation');
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
                                          validator: (value) {
                                            return Validator.validate(
                                                value, 'Phone Number');
                                          },
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Location (Optional)',
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
                                          controller: _locationController,
                                          borderColor: Colors.grey.shade200,
                                          borderWidth: 0.5,
                                          hintText: 'Ikeja, Lagos, Nigeria',
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.all(7.0),
                                            child: ImageView.svg(
                                              AppImages.location,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: ButtonView(
                            processing: state is UpdateUserLoading,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_titleController.text.trim().isNotEmpty) {
                                  if (isAgreed) {
                                  _accountCubit.updateUserData(
                                      title: _titleController.text.trim(),
                                      firstname:
                                          _firstnameController.text.trim(),
                                      lastname: _lastnameController.text.trim(),
                                      licenceNumber:
                                          _licenceNumberController.text.trim(),
                                      experience: int.tryParse(
                                              _yearsOfExpController.text
                                                  .trim()) ??
                                          0,
                                      hospitalAffliated:
                                          _hospitalAffliateController.text
                                              .trim(),
                                      phone: _phoneController.text.trim());
                                } else {
                                  ToastService().showToast(context,
                                      leadingIcon: const ImageView.svg(
                                          AppImages.error),
                                      title: AppStrings.errorTitle,
                                      subtitle:
                                          'Agree to our terms and conditions to continue');
                                }
                                } else {
                                  ToastService().showToast(context,
                                      leadingIcon: const ImageView.svg(
                                          AppImages.error),
                                      title: AppStrings.errorTitle,
                                      subtitle:
                                          'Select title please');
                                }


                                
                              }
                            },
                            borderRadius: 100,
                            color: AppColors.lightSecondary,
                            child: RichText(
                              text: TextSpan(
                                text: 'Next - ',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.6,
                                  color: const Color(0xFFFFFFFF),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Work information',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.3,
                                      color: const Color(0xCCFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }

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
        itemCount: titles.length,
        separatorBuilder: (context, index) => (index == 0)
            ? Divider(
                color: Colors.grey.shade300,
                height: 0,
              )
            : const SizedBox.shrink(),
        itemBuilder: (context, index) {
          String title = titles[index];
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
                color: (index == 0) ? const Color(0xFFF9FAFB) : Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15),
                child: Text(
                  title,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
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

  qualificationModalContent(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: qualifications.length,
            itemBuilder: (context, index) {
              QualificationData qualification = qualifications[index];
              bool isChecked = _selectedItems.any((item) =>
                  item.qualificationId == qualification.qualificationId);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 23),
                child: Row(
                  children: [
                    CustomCheckbox(
                      bgColor: const Color(0xFF6667FA),
                      isChecked: isChecked,
                      onChanged: (checked) {
                        _onCheckboxChanged(checked, qualification);
                      },
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: Text(
                        qualification.qualificationName ?? '',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          height: 1.5,
                          color: const Color(0xFF030712),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              _saveSelectedQualificationsIds();
            },
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
