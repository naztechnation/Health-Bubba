import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthbubba/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/user/get_specialties.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/error_page.dart';
import '../../widgets/image_view.dart';
import '../../widgets/loading_screen.dart';
import '../../widgets/modals.dart';
import '../../widgets/text_edit_view.dart';
import 'work_information.dart';

class SpecialtyListPage extends StatelessWidget {
  final bool isEdit;
  const SpecialtyListPage({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: SpecialtyListPageScreen(
        isEdit: isEdit,
      ),
    );
  }
}

class SpecialtyListPageScreen extends StatefulWidget {
  final bool isEdit;

  const SpecialtyListPageScreen({super.key, required this.isEdit});
  @override
  State<SpecialtyListPageScreen> createState() =>
      _SpecialtyListPageScreenState();
}

class _SpecialtyListPageScreenState extends State<SpecialtyListPageScreen> {
  late AccountCubit _accountCubit;
  List<GetSpecialtiesData> specialties = [];
  List<GetSpecialtiesData> filteredSpecialties = [];
  TextEditingController searchController = TextEditingController();

  getSpecialties() async {
    _accountCubit = context.read<AccountCubit>();
    _accountCubit.getSpecialties();
  }

  @override
  void initState() {
    super.initState();
    getSpecialties();
    searchController.addListener(_filterSpecialties);
    filteredSpecialties = _accountCubit.viewModel.platformSpecialties;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterSpecialties() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredSpecialties = specialties
          .where((specialty) =>
              specialty.specialtyName?.toLowerCase().contains(query) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {
        if (state is GetSpecialtiesLoaded) {
          if (state.specialties.ok ?? false) {
            specialties = _accountCubit.viewModel.platformSpecialties;
            filteredSpecialties = specialties;

            setState(() {});
          }
        } else if (state is SelectSpecialtiesLoaded) {
          if (state.selectSpecialties.ok ?? false) {
            ToastService().showToast(
              context,
              leadingIcon: const ImageView.svg(AppImages.success,
                                                        height: 25,
              
              ),
              title: 'Success!!!',
              subtitle: state.selectSpecialties.message?.message ?? '',
            );
            AppNavigator.pushAndReplacePage(
              context,
              page: WorkInformation(isEdit: widget.isEdit),
            );
          } else {
            ToastService().showToast(
              context,
              leadingIcon: const ImageView.svg(AppImages.error,
                                                        height: 25,
              
              ),
              title: 'Error!!!',
              subtitle: state.selectSpecialties.message ?? '',
            );
            context.read<OnboardViewModel>().clearSpecialties();
          }
        }
      },
      builder: (context, state) {
        if (state is AccountApiErr) {
          return ErrorPage(
              statusCode: state.message ?? '',
              onTap: () {
                _accountCubit.getSpecialties();
              });
        } else if (state is AccountNetworkErr) {
          return ErrorPage(
              statusCode: state.message ?? '',
              onTap: () {
                _accountCubit.getSpecialties();
              });
        }

        return (((_accountCubit.viewModel.platformSpecialties.isEmpty)
                    ? state is GetSpecialtiesLoading
                    : false) ||
                state is SelectSpecialtiesLoading)
            ? LoadersPage(
                length: MediaQuery.sizeOf(context).height.toInt(),
              )
            : Scaffold(
                backgroundColor: Colors.white,

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
                        Modals.showDialogModal(
                          context,
                          page: destructiveActions(
                            context: context,
                            message:
                                'If you leave this page, changes made will not be saved!',
                            primaryText: 'Discard',
                            secondaryText: 'Save',
                            primaryAction: () {
                              context
                                  .read<OnboardViewModel>()
                                  .clearSpecialties();
                              AppNavigator.pushAndReplacePage(
                                context,
                                page: WorkInformation(isEdit: widget.isEdit),
                              );
                            },
                            primaryBgColor: const Color(0xFFF70000),
                            
              secondaryBgColor: AppColors.lightPrimary,
                            secondaryAction: () {
                              uploadQualifications(
                                selectSpecialtiesId: context
                                    .read<OnboardViewModel>()
                                    .selectedSpecialtiesId,
                              );
                            },
                          ),
                        );
                      } else {
                        AppNavigator.pushAndReplacePage(
                          context,
                          page: WorkInformation(isEdit: widget.isEdit),
                        );
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
                          selectSpecialtiesId: context
                              .read<OnboardViewModel>()
                              .selectedSpecialtiesId,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                body: Column(
                  children: [
                    const Divider(
                      color: Color(0xFF40B93C),
                      height: 0.9,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 15),
                      child: TextEditView(
                        controller: searchController,
                        borderColor: Colors.white,
                        borderWidth: 0,
                        prefixIcon: const SizedBox(
                          width: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 0),
                                  ImageView.svg(
                                    AppImages.searchIcon,
                                    height: 19,
                                  ),
                                  SizedBox(width: 0),
                            ],
                          ),
                        ),
                        hintText: 'Search specialties',
                      ),
                    ),
                    const Divider(color: Color(0xFFE5E7EB), height: 0.9),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        itemCount: filteredSpecialties.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const Divider(
                            color: Color(0xFFE5E7EB), height: 0.9),
                        itemBuilder: (context, index) {
                          final specialty =
                              filteredSpecialties[index].specialtyName ?? '';
                          int specialtiesId =
                              filteredSpecialties[index].specialtyId ?? 0;
                          return Consumer<OnboardViewModel>(
                            builder: (context, provider, child) {
                              final isSelected = provider.selectedSpecialties
                                  .contains(specialty);
                              return ListTile(
                                title: Text(
                                  specialty,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: isSelected
                                    ? const ImageView.svg(AppImages.check)
                                    : null,
                                tileColor: isSelected
                                    ? Colors.lightGreen.withOpacity(0.12)
                                    : null,
                                onTap: () {
                                   if (provider.selectedSpecialties.length < 3 || provider.selectedSpecialties.contains(specialty)) {
    provider.toggleSpecialty(
      specialty: specialty,
      specialtiesId: specialtiesId,
    );
  }
                                  
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
      },
    );
  }

  void uploadQualifications({required List<int> selectSpecialtiesId}) {
    if (selectSpecialtiesId.isNotEmpty) {
      _accountCubit.selectSpecialties(specialties: selectSpecialtiesId);
    } else {
      ToastService().showToast(
        context,
        leadingIcon: const ImageView.svg(AppImages.error,
        
                                                        height: 25,
        
        ),
        title: 'Error',
        subtitle: 'Select at least one specialty to continue',
      );
    }
  }
}
