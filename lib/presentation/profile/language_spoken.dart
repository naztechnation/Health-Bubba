import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/error_page.dart';
import '../../widgets/image_view.dart';
import '../../widgets/loading_screen.dart';
import 'work_information.dart';

class LanguageSelector extends StatelessWidget {
  final bool isEdit;

  const LanguageSelector({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: LanguageSelectorScreen(
        isEdit: isEdit,
      ),
    );
  }
}

class LanguageSelectorScreen extends StatefulWidget {
  final bool isEdit;

  const LanguageSelectorScreen({super.key, required this.isEdit});

  @override
  State<LanguageSelectorScreen> createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  late AccountCubit _accountCubit;

  List<LanguagesData> languages = [];

  getLanguages() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.loadLanguages();
  }

  @override
  void initState() {
    getLanguages();
    super.initState();
  }

  _showAddLanguageSheet(BuildContext context) {
    TextEditingController languageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Language',
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
            controller: languageController,
            hintText: '',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (languageController.text.isNotEmpty) {
                    _accountCubit.selectLanguages(
                        languages: languageController.text.trim());

                    Navigator.pop(context);
                  } else {
                    Modals.showToast('Field cannot be empty', context);
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Color(
                      0xFF40B93C,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is LanguagesLoaded) {
        if (state.languages.ok ?? false) {
          languages = _accountCubit.viewModel.plaformLanguages ?? [];

          // context.read<OnboardViewModel>().clearLanguage();
          setState(() {});
        } else {}
      } else if (state is SelectLanguagesLoaded) {
        if (state.language.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.success,
                height: 25,
              ),
              title: 'Success!!!',
              subtitle: state.language.message?.message ?? '');

          AppNavigator.pushAndReplacePage(context,
              page: WorkInformation(
                isEdit: widget.isEdit,
              ));
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: AppStrings.errorTitle,
              subtitle: state.language.message ?? '');
        }
      } else if (state is ChooseLanguagesLoaded) {
        if (state.language.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.success),
              title: 'Success!!!',
              subtitle: state.language.message?.message ?? '');

          AppNavigator.pushAndReplacePage(context,
              page: WorkInformation(isEdit: widget.isEdit));
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: AppStrings.errorTitle,
              subtitle: state.language.message ?? '');

          context.read<OnboardViewModel>().clearLanguage();
        }
      }
    }, builder: (context, state) {
      if (state is AccountApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.loadLanguages();
            });
      } else if (state is AccountNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.loadLanguages();
            });
      }

      return (((_accountCubit.viewModel.plaformLanguages.isEmpty)
                  ? state is LanguagesLoading
                  : false) ||
              state is SelectLanguageLoading ||
              state is ChooseLanguageLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text(
                  'Language Spoken',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                centerTitle: false,
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () {
                    if (context
                        .read<OnboardViewModel>()
                        .selectedLanguages
                        .isNotEmpty) {
                      Modals.showDialogModal(
                        context,
                        page: destructiveActions(
                            context: context,
                            message:
                                'if you leave this page changes made would not be saved!!!.',
                            primaryText: 'Discard',
                            secondaryText: 'Save',
                            primaryAction: () {
                              context.read<OnboardViewModel>().clearLanguage();

                              AppNavigator.pushAndReplacePage(context,
                                  page: WorkInformation(isEdit: widget.isEdit));
                            },
                            primaryBgColor: const Color(0xFFF70000),
                            secondaryBgColor: AppColors.lightPrimary,
                            secondaryAction: () {
                              Navigator.pop(context);

                              if (context
                                  .read<OnboardViewModel>()
                                  .selectedLanguages
                                  .isNotEmpty) {
                                _accountCubit.chooseLanguage(
                                    language: context
                                        .read<OnboardViewModel>()
                                        .selectedLanguagesId);
                              }
                            }),
                      );
                    } else {
                      AppNavigator.pushAndReplacePage(context,
                          page: WorkInformation(isEdit: widget.isEdit));
                    }
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
                actions: [
                  GestureDetector(
                      onTap: () {
                        if (context
                            .read<OnboardViewModel>()
                            .selectedLanguages
                            .isNotEmpty) {
                          _accountCubit.chooseLanguage(
                              language: context
                                  .read<OnboardViewModel>()
                                  .selectedLanguagesId);
                        } else {
                          ToastService().showToast(context,
                              leadingIcon: const ImageView.svg(
                                AppImages.error,
                                height: 25,
                              ),
                              title: 'Error',
                              subtitle:
                                  'Select atleast a language to continue');
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                ],
              ),
              body: Column(
                children: [
                  const Divider(
                    color: Color(
                      0xFF40B93C,
                    ),
                    height: 0.5,
                    thickness: 1,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<OnboardViewModel>(
                            builder: (context, provider, child) {
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(4.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: provider.selectedLanguages
                                        .map((language) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4.0, vertical: 5),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE5E7EB),
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(language.language),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  provider.removeLanguage(
                                                      language.language,
                                                      language.languageId);
                                                      setState(() {
                                                        
                                                      });
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  size: 15,
                                                  color: Colors.grey.shade400,
                                                )),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          ListView.separated(
                            itemCount:
                                _accountCubit.viewModel.plaformLanguages.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey.shade300,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<OnboardViewModel>().addLanguage(
                                      _accountCubit
                                              .viewModel
                                              .plaformLanguages[index]
                                              .languageName ??
                                          '',
                                      _accountCubit
                                              .viewModel
                                              .plaformLanguages[index]
                                              .languageId ??
                                          0);

                                          setState(() {
                                            
                                          });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: Text(_accountCubit
                                          .viewModel
                                          .plaformLanguages[index]
                                          .languageName ??
                                      ''),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: GestureDetector(
                    onTap: () {
                      Modals.showBottomSheetModal(context,
                          isDissmissible: true,
                          isScrollControlled: true,
                          heightFactor: 0.6,
                          page: _showAddLanguageSheet(context));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(
                            0xFF40B93C,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text('Add Language',
                            style: TextStyle(
                                color: Color(
                                  0xFF40B93C,
                                ),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
