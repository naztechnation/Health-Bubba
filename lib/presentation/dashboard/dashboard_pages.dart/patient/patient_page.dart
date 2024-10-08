import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/patients/patients_list.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_images.dart';
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../../dashboard.dart';
import '../widgets/patient_card.dart';
import 'patient_details.dart';

class PatientPage extends StatelessWidget {
  final bool isDashboard;

  const PatientPage({Key? key, required this.isDashboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: PatientsScreen(
        isDashboard: isDashboard,
      ),
    );
  }
}

class PatientsScreen extends StatefulWidget {
  final bool isDashboard;

  PatientsScreen({Key? key, required this.isDashboard}) : super(key: key);

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  late UserCubit _userCubit;
  int pages = 1;
  int currentPage = 1;
  int limit = 10;
  int total = 1;

  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if the user has scrolled to the bottom of the screen
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !isLoading) {
      incrementPageAndValue();
      
    }
  }

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();
    _scrollController.addListener(_onScroll);
    getPatientsLists();
  }

  getPatientsLists() async {
    _userCubit.getPatientsLists(
        page: currentPage.toString(), limit: limit.toString());
  }

  void incrementPageAndValue() {
    print('${currentPage < pages}');
    print('${currentPage}');
    print('${ pages}');
    if (currentPage < pages) {
      setState(() {
        currentPage += 1;
      });
       
      _userCubit.getPatientsLists(
          page: currentPage.toString(), limit: limit.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    updatePatientsList(  );
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is PatientsListLoaded) {
        isLoading = false;
      } else if (state is PatientDetailsLoading) {
        isLoading = true;
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
              _userCubit.getPatientsLists(
                  page: currentPage.toString(), limit: limit.toString());
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getPatientsLists(
                  page: currentPage.toString(), limit: limit.toString());
            });
      }
      return Stack(children: [
        Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leading: (!widget.isDashboard)
                  ? GestureDetector(
                      onTap: () {
                        AppNavigator.pushAndReplacePage(context,
                            page: const Dashboard());
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.only(left: 18.0, top: 18, bottom: 19),
                        child: SizedBox(
                          width: 15,
                          height: 15,
                          child: ImageView.svg(
                            AppImages.backBtn,
                            height: 15,
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
              title: const Text(
                'Patients',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              centerTitle: true,
            ),
            body: (Provider.of<UserViewModel>(context, listen: true)
                    .filteredPatientsLists
                    .isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.10,
                        width: 80,
                      ),
                      const Align(
                        child: SizedBox(
                            height: 80,
                            width: 80,
                            child: ImageView.svg(AppImages.noData)),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        alignment: Alignment.center,
                        child: Text(
                          'No Registered Patient Yet. ',
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
                : RefreshIndicator(
                    onRefresh: _refreshPage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15),
                                child: TextEditView(
                                  controller:
                                      _userCubit.viewModel.searchController,
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
                                  hintText: 'Search Patients name ',
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  border: Border(
                                    top: BorderSide(
                                        color: Color(0xFFE5E7EB), width: 1),
                                    bottom: BorderSide(
                                        color: Color(0xFFE5E7EB), width: 1),
                                  ),
                                ),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 15, 16, 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE2E4E9)),
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color(0xFFF6F8FA),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x3DE4E5E7),
                                          offset: Offset(0, 1),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            3, 7, 3, 3),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ListView.builder(
                                              itemCount:
                                                  Provider.of<UserViewModel>(
                                                          context,
                                                          listen: true)
                                                      .filteredPatientsLists
                                                      .length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    AppNavigator
                                                        .pushAndStackPage(
                                                      context,
                                                      page: PatientDetails(
                                                        patientsData: _userCubit
                                                                .viewModel
                                                                .filteredPatientsLists[
                                                            index],
                                                      ),
                                                    );
                                                  },
                                                  child: patientCard(
                                                    context: context,
                                                    patients: _userCubit
                                                            .viewModel
                                                            .filteredPatientsLists[
                                                        index],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              if (state is PatientsListLoading )
                                Center(
                                    child: SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          color: Colors.grey.shade300,
                                        ))),

                              // GestureDetector(
                              //   onTap: incrementPageAndValue,
                              //   child: Center(
                              //     child: Text(
                              //       'Load more...',
                              //       style: GoogleFonts.getFont(
                              //         'Inter',
                              //         fontStyle: FontStyle.italic,
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 15,
                              //         height: 1.4,
                              //         color: const Color(0xFF0A0D14),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        if (_userCubit.viewModel.filteredPatientsLists.isEmpty
            ? state is PatientsListLoading
            : false)
          Container(
            color: AppColors.indicatorBgColor,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.indicatorColor),
            ),
          )
      ]);
    });
  }

  updatePatientsList( ) {
    if (Provider.of<UserViewModel>(context, listen: true).patients?.ok ?? false) {
      
        pages = Provider.of<UserViewModel>(context, listen: true).patients?.data?.pagination?.pages ?? 0;
      currentPage = Provider.of<UserViewModel>(context, listen: true).patients?.data?.pagination?.currentPage ?? 1;
      
      
    } else {}
  }

  Future<void> _refreshPage() async {
    await _userCubit.getPatientsLists(
        page: currentPage.toString(), limit: limit.toString());
  }
}
