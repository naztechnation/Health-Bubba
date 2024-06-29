import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/patient_card.dart';
import 'patient_details.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: PatientsScreen(),
    );
  }
}

class PatientsScreen extends StatefulWidget {
  PatientsScreen({Key? key}) : super(key: key);

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  late UserCubit _userCubit;
  List<Patients> patientsLists = [];
  int pages = 1;
  int currentPage = 1;
  int limit = 10;
  int total = 1;

  late TextEditingController _searchController;
List<Patients> filteredPatientsLists = [];


  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();
     _searchController = TextEditingController();
  _searchController.addListener(_filterPatients);
    getPatientsLists();
  }

  void _filterPatients() {
  setState(() {
    String query = _searchController.text.toLowerCase();
    filteredPatientsLists = patientsLists.where((patient) {
      return patient.firstName.toString().toLowerCase().contains(query);
    }).toList();
  });
}

  getPatientsLists() async {
    _userCubit.getPatientsLists(
        page: currentPage.toString(), limit: limit.toString());
  }

  void incrementPageAndValue() {
    if (currentPage < pages) {
      setState(() {
        currentPage += 1;
      });
      _userCubit.getPatientsLists(
          page: currentPage.toString(), limit: limit.toString());
    }
  }

  @override
void dispose() {
  _searchController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Patients',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {
          if (state is PatientsListLoaded) {
            if (state.patientsLists.ok ?? false) {
              setState(() {
                patientsLists.addAll(state.patientsLists.data?.patients ?? []);
                filteredPatientsLists = List.from(patientsLists);
                pages = state.patientsLists.data?.pagination?.pages ?? 0;
                currentPage =
                    state.patientsLists.data?.pagination?.currentPage ?? 1;
              });
            } else {
              ToastService().showToast(context,
                  leadingIcon: const ImageView.svg(AppImages.error),
                  title: 'Error!!!',
                  subtitle: state.patientsLists.message ?? '');
            }
          } else if (state is UserApiErr || state is UserNetworkErr) {
            ToastService().showToast(context,
                leadingIcon: const ImageView.svg(AppImages.error),
                title: 'Error!!!',
                subtitle: "Network Error");
          }
        },
        builder: (context, state) {
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
          return (state is PatientsListLoading)
              ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
              : Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 15),
                            child: TextEditView(
                              controller: _searchController,
                              prefixIcon: SizedBox(
                                width: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(11)),
                                    ),
                                    const SizedBox(width: 0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 7, 3, 3),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView.builder(
                                          itemCount: filteredPatientsLists.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: PatientDetails(patientsId: filteredPatientsLists[index].id.toString() ?? '',),
                                                );
                                              },
                                              child: patientCard(
                                                context: context,
                                                patients: filteredPatientsLists[index],
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
                          if (currentPage < pages)
                            GestureDetector(
                              onTap: incrementPageAndValue,
                              child: Center(
                                child: Text(
                                  'Load more...',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    height: 1.4,
                                    color: const Color(0xFF0A0D14),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
