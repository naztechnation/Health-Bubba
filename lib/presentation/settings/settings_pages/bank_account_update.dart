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
import '../../../model/user/banks.dart';
import '../../../model/view_model/account_view_model.dart';
import '../../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../../res/app_strings.dart';
import '../../../utils/navigator/page_navigator.dart';
import '../../../utils/validator.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/modals.dart';
import '../../dashboard/dashboard.dart';

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

  final _formKey = GlobalKey<FormState>();

  bool hasAddedDetails = false;
  String bankCode = '';

  List<BanksData> banks = [];

  var bankNameController = TextEditingController();
  var accountNumberController = TextEditingController();
  var accountNameController = TextEditingController();

  getSpecialties() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.getBanks();
  }

  TextEditingController searchController = TextEditingController();
  List<BanksData> filteredBanks = [];
   

   

  

  @override
  void initState() {
    getSpecialties();

    super.initState();
    searchController.addListener(_filterBanks); // Adding listener
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
void _filterBanks() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredBanks = banks
          .where((bank) =>
              bank.name!.toLowerCase().contains(query))  
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is BanksDataLoaded) {
        if (state.banks.ok ?? false) {
          banks = state.banks.message?.data ?? [];
          filteredBanks = banks;
        } else {}
      } else if (state is AddBanksDataLoaded) {
        if (state.bankDetails.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.success),
              title: AppStrings.successTitle,
              subtitle: state.bankDetails.message?.message ?? '');

              Future.delayed(const Duration(seconds: 2),(){
      AppNavigator.pushAndStackPage(context, page: const Dashboard());

              });

        } else {
          if (state.bankDetails.message is Map<String, dynamic>) {
            ToastService().showToast(context,
                leadingIcon: const ImageView.svg(AppImages.error),
                title: AppStrings.errorTitle,
                subtitle: state.bankDetails.message?.message ?? '');
          } else if (state.bankDetails.message is String) {
            ToastService().showToast(context,
                leadingIcon: const ImageView.svg(AppImages.error),
                title: AppStrings.errorTitle,
                subtitle: state.bankDetails.message ?? '');
          }


        }
      }  
    }, builder: (context, state) {
      if (state is AccountApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.getBanks();
            });
      } else if (state is AccountNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.getBanks();
            });
      }

      return  Stack(
        children: [
          Scaffold(
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
                                                      'Bank Name',
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
                                                  controller: bankNameController,
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
                                                    if (banks.isNotEmpty) {
                                                      Modals.showDialogModal(
                                                          context,
                                                          page: bankModalContent(
                                                              context));
                                                    } else {
                                                      _accountCubit.getBanks();
                                                    }
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
                                                      'Account Number',
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
                                                  controller:
                                                      accountNumberController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  hintText: ' ',
                                                  maxLength: 10,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    return Validator.validate(
                                                        value, 'Account number');
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
                                                      'Account name',
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
                                                  controller: accountNameController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  hintText: ' ',
                                                  validator: (value) {
                                                    return Validator.validate(
                                                        value, 'Account name');
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
                          height: 45,
                          child: ButtonView(
                              
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (bankNameController.text.isNotEmpty) {
          
                                    if (hasAddedDetails) {
                                      _accountCubit.addBankDetails(
                                          bankCode: bankCode,
                                          accountNumber: accountNumberController.text,
                                          accountName: accountNameController.text,
                                          url: AppStrings.addBanksUrl);
                                    } else {
                                      _accountCubit.addBankDetails(
                                          bankCode: bankCode,
                                          accountNumber: accountNumberController.text,
                                          accountName: accountNameController.text,
                                          url: AppStrings.editBanksUrl);
                                    }
                                  } else {
                                    ToastService().showToast(context,
                                        leadingIcon:
                                            const ImageView.svg(AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'Select bank name');
                                  }
                                }
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
                  ),
                ),
                if(state is BanksDataLoading || state is AddBanksDataLoading)...[
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

  bankModalContent(BuildContext context) {
    return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState  ) {
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
          child: Column(
            children: [
              Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15),
                      child: TextEditView(
                        controller: searchController,
                        onChanged: (value) {
                    setState(() {
                      
                    },);
                  },
                        borderColor: Colors.white,
                        borderWidth: 0,
                        prefixIcon: SizedBox(
                          width: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 0),
                              const ImageView.svg(
                                AppImages.searchIcon,
                                height: 19,
                              ),
                              Container(
                                height: 20,
                                width: 1,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF000000),
                                    borderRadius: BorderRadius.circular(11)),
                              ),
                              const SizedBox(width: 0),
                            ],
                          ),
                        ),
                        hintText: 'Search banks...',
                      ),
                    ),
              
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: filteredBanks.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade300,
                    height: 0,
                  ),
                  itemBuilder: (context, index) {
                    String title = filteredBanks[index].name ?? '';
                    String bankId = filteredBanks[index].code ?? '';
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          bankNameController.text = title;
                          bankCode = bankId;
                        });
                
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(0),
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
              ),
            ],
          ),
        );
      }
    );
  }
}
