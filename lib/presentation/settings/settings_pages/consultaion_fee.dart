import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../../../blocs/users/users.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_strings.dart';
import '../../../utils/validator.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/modals.dart';

class ConsultationFeePage extends StatelessWidget {
  const ConsultationFeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: ConsultationFee(),
    );
  }
}

class ConsultationFee extends StatefulWidget {
  @override
  State<ConsultationFee> createState() => _ConsultationFeeState();
}

class _ConsultationFeeState extends State<ConsultationFee> {
  List<String> duration = ['M', 'H'];

  late UserCubit _userCubit;
  final _formKey = GlobalKey<FormState>();

  var rateController = TextEditingController();
  var durationController = TextEditingController();

  String? _selectedItem;

  bool isSavedBefore = false;

  void _onRadioChanged(String? item) {
    setState(() {
      _selectedItem = item;
      _updateTextField();
    });
  }

  void _updateTextField() {
    durationController.text = _selectedItem ?? '';
  }

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();

    _userCubit.checkConsultationStatus(url: AppStrings.checkConsultationStatusUrl);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is ConsultaionFeeLoaded) {
        if (state.fee.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.success),
              title: AppStrings.successTitle,
              subtitle: state.fee.message?.message ?? '');
        }  else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.fee.message?.message ?? '');
        }
      }else if (state is CheckConsultaionStatusLoaded) {
          if (state.fee.ok ?? false) {
            setState(() {
              isSavedBefore = true;
            });
          } else {
            setState(() {
              isSavedBefore = false;
            });
          }

        } else if (state is UserApiErr || state is UserNetworkErr) {}
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.addConsultationFee(
                  rate: rateController.text.trim(),
                  duration: durationController.text.trim(),
                   url: (isSavedBefore) ? AppStrings.addConsultationUrl : AppStrings.editConsultationUrl
                  );
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.addConsultationFee(
                  rate: rateController.text.trim(),
                  duration: durationController.text.trim(), url: (isSavedBefore) ? AppStrings.addConsultationUrl : AppStrings.editConsultationUrl);
            });
      }
      return   Stack(
        children: [
          Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: const Text(
                      'Consultation Fee',
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
                  body: Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      'Rate',
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
                                                  controller: rateController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  hintText: 'Enter rate in NGN',
                                                  keyboardType:
                                                      TextInputType.number,
                                                      validator: (value) {
                                                                return Validator
                                                                    .validate(value,
                                                                        'Rate');
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
                                                      'Duration',
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
                                                  controller: durationController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  readOnly: true,
                                                  hintText: 'Select',
                                                  suffixIcon: const Padding(
                                                    padding: EdgeInsets.all(17.0),
                                                    child: ImageView.svg(
                                                      AppImages.dropDown,
                                                      scale: 0.8,
                                                    ),
                                                  ),
                                                   
                                                  onTap: () {
                                                    Modals.showDialogModal(context,
                                                        page: durationModalContent(
                                                            context));
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
                            ],
                          ),
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF093126),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33212126),
                              offset: Offset(0, 1),
                              blurRadius: 1.5,
                            ),
                            BoxShadow(
                              color: Color(0xFF083025),
                              offset: Offset(0, 0),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 50,
                          child: ButtonView(
                               
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
          
                                  if(durationController.text.trim().isNotEmpty){
                                    if(isSavedBefore){
                                     _userCubit.addConsultationFee(
                                      rate: rateController.text.trim(),
                                      duration: durationController.text.trim(),
                                       url: AppStrings.editConsultationUrl);
                                  }else{
                                     _userCubit.addConsultationFee(
                                      rate: rateController.text.trim(),
                                      duration: durationController.text.trim(),
                                       url: AppStrings.addConsultationUrl);
          
                                  }
                                  }else{
                                     ToastService().showToast(context,
                  leadingIcon: const ImageView.svg(AppImages.error),
                  title: 'Error!!!',
                  subtitle:   'Select Duration');
                                  }
                                 
                                }
                                FocusScope.of(context).unfocus();
                              },
                              borderRadius: 100,
                              color: AppColors.lightSecondary,
                              child: Text(
                                (isSavedBefore) ? 'Update' : 'Save',
                                style: const TextStyle(
                                    color: AppColors.lightPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                if(state is CheckConsultaionStatusLoading || state is ConsultaionFeeLoading)...[
                  Container(
              color: AppColors.indicatorBgColor,
              child:   Center(
                child: CircularProgressIndicator(color: AppColors.indicatorColor,),
              ),
            ),
                ]
        ],
      );
    });
  }

  durationModalContent(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
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
              itemCount: duration.length,
              itemBuilder: (context, index) {
                String dura = duration[index];
                bool isChecked = _selectedItem == dura;

                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    state(() {
                      _onRadioChanged(dura);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 18),
                    child: Row(
                      children: [
                        CustomRadioButton(
                          bgColor: const Color(0xFF6667FA),
                          isChecked: isChecked,
                          onChanged: (checked) {
                            state(() {
                              Navigator.pop(context);

                              _onRadioChanged(dura);
                            });
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: Text(
                            dura,
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
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class CustomRadioButton extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;
  final Color bgColor;

  const CustomRadioButton({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.bgColor,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChanged(!widget.isChecked);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isChecked ? widget.bgColor : Colors.transparent,
          border: Border.all(
            color: widget.isChecked ? widget.bgColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        width: 24,
        height: 24,
        child: widget.isChecked
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
