 
import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/patients/administered_route.dart';
import '../../../../model/patients/medication_category.dart';
import '../../../../model/patients/medication_sub_category.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../res/app_strings.dart';
import '../../../../utils/validator.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/checkbox.dart';
import '../../../../widgets/choice_widget.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/decision_widgets.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/modals.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/select_patient.dart';

class CreateNewMedication extends StatelessWidget {
  const CreateNewMedication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
          userRepository: UserRepositoryImpl(),
          viewModel: Provider.of<UserViewModel>(context, listen: false)),
      child: CreateNewMedicationScreen(),
    );
  }
}

class CreateNewMedicationScreen extends StatefulWidget {
  @override
  State<CreateNewMedicationScreen> createState() =>
      _CreateNewMedicationScreenState();
}

class _CreateNewMedicationScreenState extends State<CreateNewMedicationScreen> {
  late UserCubit _userCubit;

  var medicationNameController = TextEditingController();

  var medicationCategoryController = TextEditingController();

  var administrationRouteController = TextEditingController();

  var medicationDosageController = TextEditingController();

  var medicationDurationController = TextEditingController();

  var medicationNoteController = TextEditingController();

  final _searchController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String patientName = '';
  String patientImage = '';
  String patientId = '';

  DateTime? startDate;
  DateTime? endDate;
  String formattedStartDate = '';
  String formattedEndDate = '';

  String categoryId = '';
  String medicationId = '';
  String adminRouteId = '';

  String realPatientId = '';
  String _frequency = "Everyday";
  String _whenTaken = "After Food";
  String? selectedTimeDay;

  bool istimeDayChecked = false;

  List<MedicationCategoryData> medCategories = [];
  List<Medications> filteredMedicationLists = [];

  List<Medications> medications = [];

  List<AdministeredRouteData> routeAdim = [];

  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  List<String> timeOfDay = [
    "Morning",
    "Noon",
    "Evening",
    "Night",
  ];

  String? selectedDay;

  List<String> selectedDays = [];
  List<String> selectedTimeOfDays = [];

  void _selectDate(
      BuildContext context, bool isStartDate, StateSetter state) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      state(() {
        setState(() {
          if (isStartDate) {
            startDate = selectedDate;
            formattedStartDate =
                DateFormat('yyyy-MM-dd HH:mm:ss').format(startDate!);
          } else {
            endDate = selectedDate;
            formattedEndDate =
                DateFormat('yyyy-MM-dd HH:mm:ss').format(endDate!);
          }
          _updateDateField();
        });
      });

       
    }
  }

  void _updateDateField() {
    String formattedStartDate = _formatDate(startDate);
    String formattedEndDate = _formatDate(endDate);
    medicationDurationController.text =
        '$formattedStartDate - $formattedEndDate';
  }

  String _formatDate(
    DateTime? date,
  ) {
    if (date == null) {
      return '--';
    } else {
      return DateFormat('MMMM d').format(date);
    }
  }

  void _onCheckboxChanged(bool isChecked, String item) {
    setState(() {
      if (isChecked) {
        selectedDays.add(item);
      } else {
        selectedDays.remove(item);
      }
    });
  }

  void _onCheckboxTimeDayChanged(bool isChecked, String item) {
    setState(() {
      if (isChecked) {
        selectedTimeOfDays.add(item);
      } else {
        selectedTimeOfDays.remove(item);
      }
    });
  }

  void _handleFrequencySelected(String frequency) {
    setState(() {
      _frequency = frequency;
    });
  }

  void _handleWhenTakenSelected(String whenTaken) {
    setState(() {
      _whenTaken = whenTaken;
    });
  }

  getUserData() async {
    _userCubit = context.read<UserCubit>();

    _userCubit.getMedicationCategory();
    _userCubit.getAdministeredRoute();
  }

  @override
  void initState() {
    getUserData();

    super.initState();
  }

  void _filterMedications(StateSetter state) {
    state(() {
      String query = _searchController.text.toLowerCase();
      filteredMedicationLists = medications.where((medics) {
        return medics.medicationName.toString().toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is CreateMedicationLoaded) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.successIcon),
            title: AppStrings.successTitle,
            subtitle: state.createNewMedication.message ?? '');
        Modals.showDialogModal(
          context,
          page: destructiveActions(
              context: context,
              message: 'Do you wish to create a new medication???.',
              primaryText: 'No, Back to Home',
              secondaryText: 'Create again',
              primaryAction: () {
                AppNavigator.pushAndReplacePage(context,
                    page: const Dashboard());
              },
              primaryBgColor: const Color(0xFFF70000),
              secondaryAction: () {
                setState(() {
                  medicationCategoryController.clear();
                  medicationDosageController.clear();
                  medicationDurationController.clear();
                  medicationNameController.clear();
                  medicationNoteController.clear();
                  administrationRouteController.clear();
                  _frequency = 'Everyday';
                  selectedDays.clear();

                  _whenTaken = "After Food";
                  medicationId = '';
                  adminRouteId = '';
                  patientId = '';
                  _handleFrequencySelected('Everyday');
                  _handleWhenTakenSelected('After Food');
                  startDate = null;
                  endDate = null;
                });
                Navigator.pop(context);
              }),
        );
      } else if (state is MedicationCategoryLoaded) {
        medCategories = state.medicationCategory.data ?? [];
        medicationNameController.clear();
      } else if (state is AdministeredRouteLoaded) {
        routeAdim = state.route.data ?? [];
      } else if (state is MedicationSubCategoryLoaded) {
        medications = state.medicationSubCategory.data?.medications ?? [];

        filteredMedicationLists = medications;
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
      return 
            Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'Create New Medication',
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
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      height: 0,
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
                                                      'Category',
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
                                                      medicationCategoryController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  readOnly: true,
                                                  hintText: 'Select',
                                                  onTap: () {
                                                    if (medCategories.isNotEmpty) {
                                                      Modals.showDialogModal(
                                                          context,
                                                          page: categoryModalContent(
                                                              context: context,
                                                              controller:
                                                                  medicationCategoryController,
                                                              item: medCategories));
                                                    } else {
                                                      _userCubit
                                                          .getMedicationCategory();
                                                    }
                                                  },
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
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Medication name',
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
                                            controller: medicationNameController,
                                            borderColor: Colors.grey.shade200,
                                            borderWidth: 0.5,
                                            readOnly: true,
                                            onTap: () {
                                              if (medCategories.isEmpty ||
                                                  medications.isEmpty) {
                                                ToastService().showToast(context,
                                                    leadingIcon:
                                                        const ImageView.svg(
                                                            AppImages.error),
                                                    title: 'Error!!!',
                                                    subtitle:
                                                        "Select category first");
                                              } else {
                                                Modals.showDialogModal(context,
                                                    page: subCategoryModalContent(
                                                        context: context,
                                                        controller:
                                                            medicationNameController,
                                                        item: medications));
                                              }
                                            },
                                            hintText: 'Select Medications',
                                            suffixIcon: const Padding(
                                              padding: EdgeInsets.all(17.0),
                                              child: ImageView.svg(
                                                AppImages.dropDown,
                                                scale: 0.8,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Divider(
                                            color: Colors.grey.shade300,
                                            height: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(16, 0, 16, 15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Medication For',
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
                                          if (patientId == null ||
                                              patientId == '') ...[
                                            TextEditView(
                                              controller: TextEditingController(),
                                              borderColor: Colors.grey.shade200,
                                              borderWidth: 0.5,
                                              hintText: 'Select Patient',
                                              readOnly: true,
                                              onTap: () async {
                                                final result = await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SelectPatient()),
                                                );
                
                                                if (result != null) {
                                                  setState(() {
                                                    patientId = result['patientId'];
                                                    patientImage =
                                                        result['patientImage'];
                                                    patientName =
                                                        result['patientName'];
                                                  });
                                                }
                                              },
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 1.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16,
                                                  color:
                                                      Colors.black.withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ] else ...[
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color(0xFFFFFFFF),
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
                                              child: Container(
                                                padding: const EdgeInsets.fromLTRB(
                                                    12, 4, 14, 4),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  40),
                                                          child: SizedBox(
                                                            width: 42.1,
                                                            height: 43,
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                child:
                                                                    Image.network(
                                                                  fit: BoxFit.cover,
                                                                  patientImage ??
                                                                      '',
                                                                  errorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                    return const ImageView
                                                                        .asset(
                                                                        AppImages
                                                                            .avatarIcon);
                                                                  },
                                                                  loadingBuilder:
                                                                      (context,
                                                                          child,
                                                                          loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null)
                                                                      return child;
                                                                    return const ImageView
                                                                        .asset(
                                                                        AppImages
                                                                            .avatarIcon);
                                                                  },
                                                                )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        Text(
                                                          patientName ?? '',
                                                          style:
                                                              GoogleFonts.getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF0A0D14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          patientId = '';
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(0, 12, 0, 0),
                                                        width: 20,
                                                        height: 20,
                                                        child: const SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: ImageView.svg(
                                                            AppImages.remove,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(16, 0, 16, 15),
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
                                                      'Route of Administration',
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
                                                      administrationRouteController,
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
                                                    if (routeAdim.isNotEmpty) {
                                                      Modals.showDialogModal(
                                                          context,
                                                          page: adminModeModalContent(
                                                              context: context,
                                                              controller:
                                                                  administrationRouteController,
                                                              item: routeAdim));
                                                    } else {
                                                      _userCubit
                                                          .getAdministeredRoute();
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
                                                      'Dosage',
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
                                                      medicationDosageController,
                                                  borderColor: Colors.grey.shade200,
                                                  borderWidth: 0.5,
                                                  hintText: 'e.g, 1 Tablet',
                                                  validator: (value) {
                                                    return Validator.validate(
                                                        value, 'Dosage');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 7, 16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(0, 0, 0, 8),
                                                          child: Align(
                                                            alignment:
                                                                Alignment.topLeft,
                                                            child: Text(
                                                              'Frequency',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                fontSize: 14,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        ChoiceSelector(
                                                          items: const [
                                                            "Everyday",
                                                            "Specific days",
                                                          ],
                                                          onSelected:
                                                              _handleFrequencySelected,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (_frequency.toLowerCase() ==
                                                    'Specific days'.toLowerCase())
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(8),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0xFF40B93C),
                                                      ),
                                                      color:
                                                          const Color(0xFFFFFFFF),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color(0xFF40B93C),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 0,
                                                        ),
                                                        BoxShadow(
                                                          color: Color(0x409F9E9E),
                                                          offset: Offset(0, 1),
                                                          blurRadius: 1,
                                                        ),
                                                      ],
                                                    ),
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 20, 0, 0),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              17.7, 8, 0, 16),
                                                      child: choiceContent(
                                                        context,
                                                        days,
                                                      ),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 0, 0, 8),
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Time of the day',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                          color: const Color(
                                                              0xFF131316),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  timeDayContent(
                                                    context,
                                                    timeOfDay,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.fromLTRB(
                                                            0, 0, 0, 8),
                                                    child: Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'To be Taken',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                          color: const Color(
                                                              0xFF131316),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ChoiceSelector(
                                                    items: const [
                                                      "After Food",
                                                      "Before Food",
                                                    ],
                                                    onSelected:
                                                        _handleWhenTakenSelected,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
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
                                                    'Duration',
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
                                                    medicationDurationController,
                                                borderColor: Colors.grey.shade200,
                                                borderWidth: 0.5,
                                                hintText: 'July 5-July 8',
                                                readOnly: true,
                                                onTap: () {
                                                  Modals.showDialogModal(context,
                                                      page: dateSelectionWidget());
                                                },
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
                                        ],
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
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Add Notes for Patient (Optional)',
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
                                            controller: medicationNoteController,
                                            borderColor: Colors.grey.shade200,
                                            borderWidth: 0.5,
                                            hintText: '',
                                            maxLines: 4,
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
                                  if (patientId.isNotEmpty &&
                                      adminRouteId.isNotEmpty &&
                                      medicationCategoryController
                                          .text.isNotEmpty &&
                                      administrationRouteController
                                          .text.isNotEmpty &&
                                      selectedTimeOfDays.isNotEmpty &&
                                      formattedStartDate.isNotEmpty &&
                                      formattedEndDate.isNotEmpty &&
                                      medicationId.isNotEmpty) {
                                    _userCubit.createNewMedication(
                                        patientId: patientId,
                                        medicationName:
                                            medicationNameController.text,
                                        medicationId: medicationId,
                                        category: medicationCategoryController.text,
                                        administrationRouteId: adminRouteId,
                                        dosage: medicationDosageController.text,
                                        notes: medicationNoteController.text,
                                        durationStart: formattedStartDate,
                                        durationEnd: formattedEndDate,
                                        frequency: _frequency,
                                        toBeTaken: _whenTaken,
                                        days: selectedDays,
                                        times: selectedTimeOfDays);
                                  } else {
                                    ToastService().showToast(
                                      context,
                                      leadingIcon:
                                          const ImageView.svg(AppImages.error),
                                      title: 'Error!!!',
                                      subtitle: 'Select all fields',
                                    );
                                  }
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
                      ),
                    ),
                  ),
                ),
                if(state is MedicationCategoryLoading ||
              state is MedicationSubCategoryLoading ||
              state is AdministeredRouteLoading || state is CreateMedicationLoading)...[

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

  categoryModalContent(
      {required BuildContext context,
      var controller,
      required List<MedicationCategoryData> item}) {
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
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: item.length,
        separatorBuilder: (context, index) => (index == 0)
            ? Divider(
                color: Colors.grey.shade300,
                height: 0,
              )
            : const SizedBox.shrink(),
        itemBuilder: (context, index) {
          String title = item[index].categoryName ?? '';
          return GestureDetector(
            onTap: () {
              setState(() {
                controller.text = title;

                categoryId = item[index].categoryId.toString() ?? '';

                _userCubit.getMedicationSubCategory(categoryId: categoryId);
              });

              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all((index == 0) ? 8 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (index == 0) ? const Color(0xFFF9FAFB) : Colors.white,
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
    );
  }

  subCategoryModalContent(
      {required BuildContext context,
      var controller,
      required List<Medications> item}) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              child: TextEditView(
                controller: _searchController,
                onChanged: (value) {
                  _filterMedications(state);
                },
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
                hintText: 'Search Medication name ',
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: filteredMedicationLists.length,
                separatorBuilder: (context, index) => (index == 0)
                    ? Divider(
                        color: Colors.grey.shade300,
                        height: 0,
                      )
                    : const SizedBox.shrink(),
                itemBuilder: (context, index) {
                  String title =
                      filteredMedicationLists[index].medicationName ?? '';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.text = title;

                        medicationId = filteredMedicationLists[index]
                                .medicationCategoryId
                                .toString() ??
                            '';
                      });

                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all((index == 0) ? 8 : 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: (index == 0)
                            ? const Color(0xFFF9FAFB)
                            : Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 15),
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
    });
  }

  adminModeModalContent(
      {required BuildContext context,
      var controller,
      required List<AdministeredRouteData> item}) {
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
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: item.length,
        separatorBuilder: (context, index) => (index == 0)
            ? Divider(
                color: Colors.grey.shade300,
                height: 0,
              )
            : const SizedBox.shrink(),
        itemBuilder: (context, index) {
          String title = item[index].name ?? '';
          adminRouteId = item[index].id.toString() ?? '';
          return GestureDetector(
            onTap: () {
              setState(() {
                controller.text = title;
              });

              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all((index == 0) ? 8 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (index == 0) ? const Color(0xFFF9FAFB) : Colors.white,
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
    );
  }

  choiceContent(
    BuildContext context,
    List<String> items,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            String item = items[index];
            bool isChecked = selectedDays.contains(item);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1),
              child: Row(
                children: [
                  CustomCheckbox(
                    bgColor: const Color(0xFF40B93C),
                    isChecked: isChecked,
                    onChanged: (checked) {
                      _onCheckboxChanged(checked, item);
                    },
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        height: 1.5,
                        color: const Color(0xFF030712),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  timeDayContent(
    BuildContext context,
    List<String> items,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: items.map((item) {
          istimeDayChecked = selectedTimeOfDays.contains(item);

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCheckbox(
                bgColor: const Color(0xFF40B93C),
                isChecked: istimeDayChecked,
                onChanged: (checked) {
                  _onCheckboxTimeDayChanged(checked, item);
                },
              ),
              const SizedBox(
                width: 13,
              ),
              GestureDetector(
                onTap: () {
                  //_onCheckboxTimeDayChanged(isChecked, item);
                },
                child: Text(
                  item,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    height: 1.5,
                    color: const Color(0xFF030712),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  dateSelectionWidget() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      state(() {
                        _selectDate(context, true, state);
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Start Date',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              _formatDate(startDate),
                              style: TextStyle(
                                fontSize: startDate == null ? 22 : 14,
                                color: startDate == null
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                state(() {
                                  _selectDate(context, true, state);
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(17.0),
                                child: ImageView.svg(
                                  AppImages.dropDown,
                                  scale: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectDate(context, false, state),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'End Date',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              _formatDate(endDate),
                              style: TextStyle(
                                fontSize: endDate == null ? 22 : 14,
                                color: endDate == null
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                state(() {
                                  _selectDate(context, false, state);
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(17.0),
                                child: ImageView.svg(
                                  AppImages.dropDown,
                                  scale: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonView(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: 100,
                  color: AppColors.lightSecondary,
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                        color: AppColors.lightPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      );
    });
  }
}
