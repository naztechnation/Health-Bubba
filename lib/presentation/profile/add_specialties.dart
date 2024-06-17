import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthbubba/model/user/qualification.dart';
import 'package:healthbubba/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/error_page.dart';
import '../../widgets/image_view.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/modals.dart';
import 'work_information.dart';

class SpecialtyListPage extends StatelessWidget {
  const SpecialtyListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: SpecialtyListPageScreen(),
    );
  }
}

class SpecialtyListPageScreen extends StatefulWidget {
  @override
  State<SpecialtyListPageScreen> createState() =>
      _SpecialtyListPageScreenState();
}

class _SpecialtyListPageScreenState extends State<SpecialtyListPageScreen> {
  late AccountCubit _accountCubit;

  List<QualificationData> specialties = [];

  getQualifications() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.loadQualifications();
  }

  @override
  void initState() {
    getQualifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is QualificationsLoaded) {
        if (state.qualification.ok ?? false) {
          specialties = state.qualification.message?.data ?? [];
          setState(() {});
        } else {}
      } else if (state is SelectQualificationsLoaded) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.success),
            title: 'Success!!!',
            subtitle: state.qualification.message?.message ?? '');
        AppNavigator.pushAndReplacePage(context, page: const WorkInformation());
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

      return (state is QualificationsLoading ||
              state is SelectQualificationsLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Add Specialties',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                centerTitle: false,
                leading: GestureDetector(
                  onTap: () {
                    if (context
                        .read<OnboardViewModel>()
                        .selectedSpecialties
                        .isNotEmpty) {
                      context.read<OnboardViewModel>().clearSpecialties();
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
                      uploadQualifications(
                          qualificationsId: context
                              .read<OnboardViewModel>()
                              .selectedSpecialtiesId);
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
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  const Divider(
                    color: Color(0xFF40B93C),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(color: Colors.grey.shade200, height: 0.9),
                  Expanded(
                    child: ListView.separated(
                      itemCount: specialties.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.grey.shade200, height: 0.9),
                      itemBuilder: (context, index) {
                        final specialty =
                            specialties[index].qualificationName ?? '';
                        String specialtiesId =
                            specialties[index].qualificationId.toString() ?? '';
                        return Consumer<OnboardViewModel>(
                          builder: (context, provider, child) {
                            final isSelected = provider.selectedSpecialties
                                .contains(specialty);
                            return ListTile(
                              title: Text(
                                specialty,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              trailing: isSelected
                                  ? const ImageView.svg(AppImages.check)
                                  : null,
                              tileColor: isSelected
                                  ? Colors.lightGreen.withOpacity(0.12)
                                  : null,
                              onTap: () {
                                provider.toggleSpecialty(
                                    specialty: specialty,
                                    specialtiesId: specialtiesId);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Divider(color: Colors.grey.shade200, height: 0.9),
                ],
              ),
            );
    });
  }

  uploadQualifications({required List<String> qualificationsId}) {
    if (qualificationsId.isNotEmpty) {
      _accountCubit.selectQualifications(qualificationsId: qualificationsId);
    } else {
      ToastService().showToast(context,
          leadingIcon: const ImageView.svg(AppImages.error),
          title: 'Error',
          subtitle: 'Select atleast one specialty to continue');
    }
  }
}
