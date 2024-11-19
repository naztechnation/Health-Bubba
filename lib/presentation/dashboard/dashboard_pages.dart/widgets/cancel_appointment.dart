import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../res/app_strings.dart';
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../utils/validator.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../dashboard.dart';
import 'radio_button_widget.dart';

class CancelAppointment extends StatelessWidget {
  final String appointmentId;

  const CancelAppointment({
    Key? key,
    required this.appointmentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: CancelAppointmentScreen(
        appointmentId: appointmentId,
      ),
    );
  }
}

class CancelAppointmentScreen extends StatefulWidget {
  final String appointmentId;

  const CancelAppointmentScreen({super.key, required this.appointmentId});

  @override
  State<CancelAppointmentScreen> createState() =>
      _CancelAppointmentScreenState();
}

class _CancelAppointmentScreenState extends State<CancelAppointmentScreen> {
  late UserCubit _userCubit;

  final _complaintController = TextEditingController();

  String _selectedOption = 'Personal emergency';

  final _formKey = GlobalKey<FormState>();

  void _handleRadioButtonChange(String newValue) {
    setState(() {
      _selectedOption = newValue;
    });
  }

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is CancelAppointmentLoaded) {
        if (state.cancelAppointment.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.successIcon,
                height: 25,
              ),
              title: AppStrings.successTitle,
              subtitle: state.cancelAppointment.message?.message ?? '');

          AppNavigator.pushAndReplacePage(context, page: const Dashboard());
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: 'Error!!!',
              subtitle: state.cancelAppointment.message?.message ?? '');
        }
      } else if (state is UserApiErr || state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.cancelAppointment(
                appointmentId: widget.appointmentId,
                reason: """
                        $_selectedOption

                        ${_complaintController.text}
                        """,
              );
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.cancelAppointment(
                appointmentId: widget.appointmentId,
                reason: """
                        $_selectedOption
                        
                        ${_complaintController.text}
                        """,
              );
            });
      }
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Cancel Appointment',
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
                              'Please let us know the reason for your cancellation so that we can better serve you. We care about your health!',
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        border: Border(
                          top: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 15, 0, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioButtonWidget(
                                onChanged: _handleRadioButtonChange)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 310),
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
                                  'Others',
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
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFFFFFFF),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF40B93C),
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: Color(0x409F9E9E),
                                      offset: Offset(0, 1),
                                      blurRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Color(0x3690D68E),
                                      offset: Offset(0, 0),
                                      blurRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Form(
                                    key: _formKey,
                                    child: TextEditView(
                                      controller: _complaintController,
                                      validator: (value) {
                                        return Validator.validate(
                                            value, 'Reason');
                                      },
                                      maxLines: 5,
                                      hintText:
                                          'Please explain the reason you are cancelling',
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                        if (_formKey.currentState!.validate()) {
                          _userCubit.cancelAppointment(
                            appointmentId: widget.appointmentId,
                            reason: """
                            $_selectedOption
                            
                            ${_complaintController.text}
                            """,
                          );
                        }
                      },
                      borderRadius: 100,
                      color: const Color(0xFFF70000),
                      child: const Text(
                        'Cancel Appointment',
                        style: TextStyle(
                            color: AppColors.lightPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ))),
            ),
          ),
          if (state is CancelAppointmentLoading)
            Container(
              color: AppColors.indicatorBgColor,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.indicatorColor,
                ),
              ),
            ),
        ],
      );
    });
  }
}
