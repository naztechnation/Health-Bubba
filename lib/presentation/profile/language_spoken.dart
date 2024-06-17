import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/error_page.dart';
import '../../widgets/image_view.dart';
import '../../widgets/loading_screen.dart';
import 'work_information.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: LanguageSelectorScreen(),
    );
  }
}

class LanguageSelectorScreen extends StatefulWidget {
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
                              languages: languageController.text);


                    Navigator.pop(context);
                  } else {
                    Modals.showToast('Field cannot be empty');
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
          languages = state.languages.message?.data ?? [];
          setState(() {});
        } else {}
      } else if (state is SelectLanguagesLoaded) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.success),
            title: 'Success!!!',
            subtitle: state.language.message?.message ?? '');

        AppNavigator.pushAndReplacePage(context, page: const WorkInformation());
        
      }
    }, builder: (context, state) {
      if (state is AccountApiErr) {
        return ErrorPage(statusCode: state.message ?? '', onTap: () {
          _accountCubit.loadLanguages();
        });
      } else if (state is AccountNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _accountCubit.loadLanguages();
            });
      }

      return (state is LanguagesLoading || state is SelectLanguageLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Language Spoken',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                centerTitle: false,
                leading: GestureDetector(
                  onTap: () {
                    if (context
                        .read<OnboardViewModel>()
                        .selectedLanguages
                        .isNotEmpty) {
                      context.read<OnboardViewModel>().clearLanguage();
                      Modals.showDialogModal(
                        context,
                        page: destructiveActions(
                            context: context,
                            message:
                                'Lorem ipsum dolor sit amet consectetur. Imperdiet nibh sed quis feugiat non.',
                            primaryText: 'Discard',
                            secondaryText: 'Save',
                            primaryAction: () {
                              AppNavigator.pushAndReplacePage(context,
                                  page: const WorkInformation());
                            },
                            primaryBgColor: const Color(0xFFF70000),
                            secondaryAction: () {
                              AppNavigator.pushAndReplacePage(context,
                                  page: const WorkInformation());
                              context.read<OnboardViewModel>().saveLanguages();
                            }),
                      );
                    } else {
                      AppNavigator.pushAndReplacePage(context,
                          page: const WorkInformation());
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
                              leadingIcon: const ImageView.svg(AppImages.error),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Color(
                      0xFF40B93C,
                    ),
                    height: 0.5,
                    thickness: 1,
                  ),
                  Consumer<OnboardViewModel>(
                    builder: (context, provider, child) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children:
                                provider.selectedLanguages.map((language) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(language.language),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          provider.removeLanguage(language.language,language.languageId);
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
                    itemCount: languages.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade300,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<OnboardViewModel>()
                              .addLanguage(languages[index].languageName ?? '', languages[index].languageId ?? 0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Text(languages[index].languageName ?? ''),
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Modals.showBottomSheetModal(context,
                            isDissmissible: true,
                            isScrollControlled: true,
                            heightFactor: 0.6,
                            page: _showAddLanguageSheet(context));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            );
    });
  }
}
