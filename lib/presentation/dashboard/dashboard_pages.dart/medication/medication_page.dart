import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/medication_card.dart';
import 'create_new_medication.dart';

class MedicationPage extends StatelessWidget {
  const MedicationPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
          userRepository: UserRepositoryImpl(),
          viewModel: Provider.of<UserViewModel>(context, listen: false)),
      child: Medications(),
    );
  }
}

class Medications extends StatefulWidget {
  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  late UserCubit _userCubit;

  

  getUserData() async {
    _userCubit = context.read<UserCubit>();

    _userCubit.getMedications();
  }

  @override
  void initState() {
    getUserData();
   
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is MedicationsLoaded) {
         
      } else if (state is UserApiErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      } else if (state is UserNetworkErr) {
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
              getUserData();
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              getUserData();
            });
      }
      return (_userCubit.viewModel.filteredMedicationsLists.isEmpty &&state is MedicationsLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              body: Stack(
                children: [
                  Container(
                    color: const Color(0xFFFFFFFF),
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SafeArea(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 11),
                                child: Text(
                                  'Medication',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: const Color(0xFF0A0D14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            child: TextEditView(
                              controller: _userCubit.viewModel.medSearchController,
                              prefixIcon: SizedBox(
                                width: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      width: 0,
                                    ),
                                    const ImageView.svg(
                                      AppImages.searchIcon,
                                      height: 19,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF000000),
                                          borderRadius:
                                              BorderRadius.circular(11)),
                                    ),
                                    const SizedBox(
                                      width: 0,
                                    ),
                                  ],
                                ),
                              ),
                              hintText: 'Search Medications, Patients',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Colors.grey.shade300,
                            height: 0,
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: Provider.of<UserViewModel>(context, listen: true).filteredMedicationsLists.length,
                                itemBuilder: (context, index) {
                                  return MedicationCard(
                                    medications:
                                        _userCubit.viewModel.filteredMedicationsLists[index],
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: ButtonView(
                        onPressed: () {
                          AppNavigator.pushAndStackPage(context,
                              page: const CreateNewMedication());
                        },
                        borderRadius: 100,
                        color: AppColors.lightSecondary,
                        child: const Text(
                          'Create New Medication',
                          style: TextStyle(
                              color: AppColors.lightPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            );
    });
  }

  Future<void> _refreshPage() async {

   
    await _userCubit.getMedications();
  }
}
