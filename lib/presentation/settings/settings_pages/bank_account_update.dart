
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
import '../../../model/user/qualification.dart';
import '../../../model/view_model/account_view_model.dart';
import '../../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../../res/app_strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading_screen.dart';


class BankAccountUpdate extends StatelessWidget {
  const BankAccountUpdate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: BankAccountUpdatePage(),
    );
  }
}
class BankAccountUpdatePage extends StatefulWidget {

  @override
  State<BankAccountUpdatePage> createState() => _BankAccountUpdatePageState();
}

class _BankAccountUpdatePageState extends State<BankAccountUpdatePage> {
  late AccountCubit _accountCubit;

  List<String> banks = [];

  getSpecialties() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.loadQualifications();
  }

  @override
  void initState() {
    getSpecialties();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is QualificationsLoaded) {
        if (state.qualification.ok ?? false) {
          // qualifications = state.qualification.message?.data ?? [];
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Payment details',
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Bank Name',
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
                                      controller: TextEditingController(),
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
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Account Number',
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
                                      controller: TextEditingController(),
                                      borderColor: Colors.grey.shade200,
                                      borderWidth: 0.5,
                                      hintText: ' ',
                                      
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Account name',
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
                                      controller: TextEditingController(),
                                      borderColor: Colors.grey.shade200,
                                      borderWidth: 0.5,
                                      hintText: ' ',
                                       
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
              child: ButtonView(
                  onPressed: () {
                    // AppNavigator.pushAndStackPage(context,
                    //     page: const BookAppointentPage(
                    //       isReBookAppointment: false,
                    //     ));
                  },
                  borderRadius: 100,
                  color: AppColors.lightSecondary,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: AppColors.lightPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
        ),
      );
  });
  }
}
