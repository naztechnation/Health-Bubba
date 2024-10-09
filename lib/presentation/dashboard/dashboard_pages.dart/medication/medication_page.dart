import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../handlers/secure_handler.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../res/app_strings.dart';
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/text_edit_view.dart';
import '../../dashboard.dart';
import '../unverified_screen.dart';
import '../widgets/medication_card.dart';
import 'create_new_medication.dart';

class MedicationPage extends StatelessWidget {
  final bool isDashboard;

  const MedicationPage(this.isDashboard);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
          userRepository: UserRepositoryImpl(),
          viewModel: Provider.of<UserViewModel>(context, listen: false)),
      child: Medications(
        isDashboard: isDashboard,
      ),
    );
  }
}

class Medications extends StatefulWidget {
  final bool isDashboard;

  const Medications({super.key, required this.isDashboard});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  late UserCubit _userCubit;

  getUserData() async {
    _userCubit = context.read<UserCubit>();

    _userCubit.getMedications();
  }

  String doctorState = "1";


getVerifiedKey()async{
    doctorState = await StorageHandler.getDoctorState() ?? '1';

}

  @override
  void initState() {
    getUserData();

    getVerifiedKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is MedicationsLoaded) {
      } else if (state is UserApiErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: AppStrings.errorTitle,
            subtitle: state.message ?? '');
      } else if (state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: AppStrings.errorTitle,
            subtitle: state.message ?? '');
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
      return (_userCubit.viewModel.filteredMedicationsLists.isEmpty &&
              state is MedicationsLoading)
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
                            child: Row(
                              children: [
                                (!widget.isDashboard)
                                    ? GestureDetector(
                                        onTap: () {
                                          AppNavigator.pushAndReplacePage(
                                              context,
                                              page: const Dashboard());
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 18.0, top: 8, bottom: 19),
                                          child: SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: ImageView.svg(
                                              AppImages.backBtn,
                                              height: 18,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        ' ',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: const Color(0xFF0A0D14),
                                        ),
                                      ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 11),
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
                              ],
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
                              controller:
                                  _userCubit.viewModel.medSearchController,
                              prefixIcon: const SizedBox(
                                width: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                          (Provider.of<UserViewModel>(context, listen: true)
                                  .filteredMedicationsLists
                                  .isEmpty)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.23,
                                      width: 80,
                                    ),
                                    const Align(
                                      child: SizedBox(
                                          height: 80,
                                          width: 80,
                                          child:
                                              ImageView.svg(AppImages.noData)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 15),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No Medications Data Yet. ',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          height: 1.7,
                                          color: const Color(0xFF0A0D14),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    )
                                  ],
                                )
                              : Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: Provider.of<UserViewModel>(
                                              context,
                                              listen: true)
                                          .filteredMedicationsLists
                                          .length,
                                      itemBuilder: (context, index) {
                                        return MedicationCard(
                                          medications: _userCubit.viewModel
                                              .filteredMedicationsLists[index],
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
                          if (doctorState == '0') {
                                                       AppNavigator
                                                        .pushAndStackPage(
                                                      context,
                                                      page: const PendingVerification(
                                                         
                                                      ),
                                                    );
                                                    }else{
                                                       AppNavigator.pushAndStackPage(context,
                              page: const CreateNewMedication());
                                                    }
                         
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
