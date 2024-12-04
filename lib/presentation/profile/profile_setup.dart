import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../blocs/accounts/account.dart';
import '../../handlers/secure_handler.dart';
import '../../model/google_places.dart';
import '../../model/user/qualification.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../model/view_model/user_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../utils/validator.dart';
import '../../widgets/button_view.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/error_page.dart';
import '../../widgets/text_edit_view.dart';
import 'work_information.dart';

class ProfileSetup extends StatelessWidget {
  final bool isEdit;
  const ProfileSetup({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: ProfileSetupPage(
        isEdit: isEdit,
      ),
    );
  }
}

class ProfileSetupPage extends StatefulWidget {
  final bool isEdit;

  const ProfileSetupPage({super.key, required this.isEdit});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  late AccountCubit _accountCubit;
  List<QualificationData> qualifications = [];

  List<dynamic> _selectedQualificationsIds = [];

  bool validated = false;

  String name = "";
  String title = "";
  String lastName = "";
  String medicalQualification = "";
  String medicalLicence = "";
  String yearsOfExperience = "";
  String hospitalAffliated = "";
  String phone = "";
  String location = "";

  getUserData() async {
    name = await StorageHandler.getFirstName();
    lastName = await StorageHandler.getLastName();
    medicalQualification = await StorageHandler.getMedicalQualification();
    medicalLicence = await StorageHandler.getMedicalLicenceNumber();
    yearsOfExperience = await StorageHandler.getYear();
    hospitalAffliated = await StorageHandler.getAffliate();
    phone = await StorageHandler.getPhone();
    location = await StorageHandler.getLocation();
    title = await StorageHandler.getTitle();
  }

  void _saveSelectedQualificationsIds() {
    _selectedQualificationsIds =
        _selectedItems.map((item) => item.qualificationId ?? 0).toList();
    if (_selectedQualificationsIds.isNotEmpty) {
      _accountCubit.selectQualifications(
          qualificationIds: _selectedQualificationsIds);
    } else {
      ToastService().showToast(context,
          leadingIcon: const ImageView.svg(AppImages.error),
          title: 'Error',
          subtitle: 'Select atleast one qualification to continue');
    }
  }

  getSpecialties() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.loadQualifications();
  }

  @override
  void initState() {
    getUserData();
    getSpecialties();
    _updateTextField();
    super.initState();
  }

  final _qualificationController = TextEditingController();

  bool isAgreed = false;

  bool isOtherSelected = true;

  final _formKey = GlobalKey<FormState>();

  List<String> titles = [
    "Dr.",
    "Mr.",
    "Ms.",
    "Mrs.",
    "Prof.",
    "Fr. (Father)",
    "Sr. (Sister)"
  ];

  bool callOnce = true;

  List<QualificationData> _selectedItems = [];

  void _onCheckboxChanged(bool isChecked, QualificationData item) {
    setState(() {
      if (isChecked) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      _updateTextField();
    });
  }

  void _updateTextField() {
    _qualificationController.text =
        _selectedItems.map((item) => item.qualificationName).join(', ');
  }

  Future<List<Predictions>>? _placesFuture;

  String searchQuery = '';
  Future<void> _showPlacePickerBottomSheet() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        TextEditingController _searchController = TextEditingController();

        return StatefulBuilder(builder: (_, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Search for a place',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextEditView(
                    controller: _searchController,
                    hintText: 'Enter a location',
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                        _placesFuture =
                            query.isEmpty ? null : _fetchPlaces(query);
                      });
                    },
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: ImageView.svg(
                        AppImages.searchIcon,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<Predictions>>(
                    future: _placesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Text('Error fetching places');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context, searchQuery);
                          },
                          child: Text(
                              searchQuery.isEmpty
                                  ? 'Enter a location'
                                  : 'Use "$searchQuery"',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.5,
                                color: const Color(0xFF0A0D14),
                              )),
                        );
                      } else {
                        final places = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(places[index].description ?? '',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: const Color(0xFF0A0D14),
                                      )),
                                  onTap: () {
                                    Navigator.pop(
                                        context, places[index].description);
                                  },
                                ),
                                Divider(
                                  height: 0.3,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        });
      },
    ).then((selectedPlace) {
      if (selectedPlace != null) {
        Provider.of<UserViewModel>(context, listen: false)
            .updateLocation(selectedPlace);
      }
    });
  }

  List<Predictions> predictions = [];

  Future<List<Predictions>> _fetchPlaces(String query) async {
    await _accountCubit.searchPlaces(input: query);

    return predictions;
  }

  Future<String> getUserAddress() async {
    try {
      // Request location permission if needed
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return 'Location permission denied';
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Convert latitude and longitude to a human-readable address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        return '${place.locality}, ${place.country}';
      } else {
        return 'Address not found';
      }
    } catch (e) {
      return 'Failed to get location: $e';
    }
  }

  bool isLoading = false;

  String selectedNumber = "0";

  void _setUserLocation() async {
    setState(() {
      isLoading = true;
    });
    String address = await getUserAddress();
    setState(() {
      isLoading = false;
    });
    setState(() {
      Provider.of<UserViewModel>(context, listen: false)
          .updateLocation(address);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserViewModel>(context, listen: true);
    final doctorsState =
        Provider.of<OnboardViewModel>(context, listen: true).doctorsState;

    if (widget.isEdit && callOnce) {
      if (name.isNotEmpty && lastName.isNotEmpty) {
        profile.updateFirstname(name);
        profile.updateLastname(lastName);
        _qualificationController.text = medicalQualification;
        profile.updateLicenceNumber(medicalLicence);

        profile.updateYear(yearsOfExperience);
        profile.updateHospital(hospitalAffliated);
        profile.updatePhone(phone);
        profile.updateLocation(location);
        callOnce = false;
      }
    }

    StorageHandler.saveIsLoggedIn('true');

    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is QualificationsLoaded) {
        if (state.qualification.ok ?? false) {
          qualifications = state.qualification.message?.data ?? [];
          setState(() {});
        } else {}
      } else if (state is UploadDocsLoaded) {
        if (state.uploadDocs.ok ?? false) {
          if (selectedNumber == "1") {
            profile.updateLicenceDoc(state.uploadDocs.data?.picture ?? "");
          } else if (selectedNumber == "2") {
            profile.updateotherDoc(state.uploadDocs.data?.picture ?? "");
          }
        } else {}
      } else if (state is SelectQualificationsLoaded) {
        if (state.qualification.ok ?? false) {
          if (!isOtherSelected) {
            _accountCubit.updateUserData(
                title: profile.titleController.text.trim(),
                firstname: profile.firstnameController.text.trim(),
                lastname: profile.lastnameController.text.trim(),
                licenceNumber: profile.licenceNumberController.text.trim(),
                experience:
                    int.tryParse(profile.yearsOfExpController.text.trim()) ?? 0,
                hospitalAffliated:
                    profile.hospitalAffliateController.text.trim(),
                phone: profile.phoneController.text.trim(),
                doctorLicenceDoc: profile.licenceDoc,
                otherDocs: profile.otherDoc);
          }
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: AppStrings.errorTitle,
              subtitle: state.qualification.message ?? '');
        }
      } else if (state is UpdateUserLoaded) {
        if (state.updateUser.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.success,
                height: 25,
              ),
              title: AppStrings.successTitle,
              subtitle: state.updateUser.message ?? '');

          profile.clearFirstname();
          profile.clearLastname();
          if (widget.isEdit) {
            AppNavigator.pushAndStackPage(context, page: const Dashboard());
          } else {
            AppNavigator.pushAndStackPage(context,
                page: WorkInformation(
                  isEdit: widget.isEdit,
                ));
          }
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: AppStrings.errorTitle,
              subtitle: state.updateUser.message ?? '');
        }
      } else if (state is SearchPlacesLoaded) {
        if (state.googlePlaces.status == "OK") {
          predictions = state.googlePlaces.predictions ?? [];
        }
      }
    }, builder: (context, state) {
      if (widget.isEdit) {
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
      }

      return Stack(
        children: [
          Scaffold(
            body: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 1.4, 8),
                  child: Text(
                    (widget.isEdit) ? 'Edit Profile' : 'Setup your Profile',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.5,
                      color: const Color(0xFF0A0D14),
                    ),
                  ),
                ),
                centerTitle: true,
                leading: (widget.isEdit)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(left: 12.0, top: 17, bottom: 19),
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
                    : const SizedBox.shrink(),
              ),
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 11),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Modals.showToast(name, context);
                                  },
                                  child: Text(
                                    'Provide all the essential details below',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      height: 1.7,
                                      color: const Color(0xFF6B7280),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFCFCFC),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 15, 16, 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Title',
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
                                            controller: profile.titleController,
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
                                              Modals.showDialogModal(context,
                                                  page: titleModalContent(
                                                      context));
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'First name',
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
                                            controller:
                                                profile.firstnameController,
                                            borderColor: Colors.grey.shade200,
                                            textColor:
                                                // (name.isNotEmpty)
                                                // ? Colors.grey
                                                // :
                                                Colors.black,
                                            borderWidth: 0.5,
                                            // readOnly: (name.isNotEmpty),
                                            // validator: (value) {
                                            //   return Validator.validate(
                                            //       value, 'First name');
                                            // },
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updateFirstname(value);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Last name',
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
                                            controller:
                                                profile.lastnameController,
                                            borderColor: Colors.grey.shade200,
                                            // readOnly: (lastName.isNotEmpty),
                                            borderWidth: 0.5,
                                            // validator: (value) {
                                            //   return Validator.validate(
                                            //       value, 'Last name');
                                            // },
                                            textColor:
                                                // (lastName.isNotEmpty)
                                                //     ? Colors.grey
                                                //     :
                                                Colors.black,
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updateLastname(value);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Medical Qualification',
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
                                            controller:
                                                _qualificationController,
                                            borderColor: Colors.grey.shade200,
                                            borderWidth: 0.5,
                                            hintText: 'MBBS, MCPS, MD',
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                if (qualifications.isNotEmpty) {
                                                  _selectedItems.clear();
                                                  _qualificationController
                                                      .clear();
                                                  Modals.showDialogModal(
                                                      context,
                                                      page:
                                                          qualificationModalContent(
                                                              context));
                                                } else {
                                                  _accountCubit
                                                      .loadQualifications();
                                                }
                                              },
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (validated) ...[
                                                      const ImageView.svg(
                                                        AppImages.successIcon,
                                                        color: Colors.green,
                                                      )
                                                    ] else ...[
                                                      const SizedBox.shrink()
                                                    ],
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.0, right: 12),
                                                      child: ImageView.svg(
                                                        AppImages.dropDown,
                                                        scale: 0.9,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            readOnly: isOtherSelected,
                                            onTap: () {
                                              if (isOtherSelected) {
                                                if (qualifications.isNotEmpty) {
                                                  _selectedItems.clear();
                                                  _qualificationController
                                                      .clear();
                                                  Modals.showDialogModal(
                                                      context,
                                                      page:
                                                          qualificationModalContent(
                                                              context));
                                                } else {
                                                  _accountCubit
                                                      .loadQualifications();
                                                }
                                              } else {}
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Medical License Number',
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
                                            controller:
                                                profile.licenceNumberController,
                                            borderColor: Colors.grey.shade200,
                                            keyboardType: TextInputType.number,
                                            borderWidth: 0.5,
                                            // validator: (value) {
                                            //   return Validator.validate(
                                            //       value, 'License Number');
                                            // },
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updateLicenceNumber(value);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          if (profile.pickedDocFilePath1
                                              .isNotEmpty) ...[
                                            Text(
                                              'Upload Medical License Number',
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
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xFFFFFFFF),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xFFF0F0F0),
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
                                              child: Align(
                                                child: ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.all(0),
                                                  leading: Container(
                                                    height: 32,
                                                    width: 32,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 13),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors
                                                            .grey.shade100),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: ImageView.svg(
                                                          AppImages.file),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    profile.pickedDocFileName1,
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
                                                  trailing: (state
                                                          is UploadDocsLoading)
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: SizedBox(
                                                              height: 15,
                                                              width: 15,
                                                              child:
                                                                  CircularProgressIndicator
                                                                      .adaptive(
                                                                backgroundColor:
                                                                    Colors.grey,
                                                              )),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () {
                                                            profile
                                                                .removeAllPaths1();
                                                          },
                                                          child: Container(
                                                              // margin: const EdgeInsets.only(right: 13),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                              child: const ImageView
                                                                  .svg(AppImages
                                                                      .trash)),
                                                        ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ] else ...[
                                            Text(
                                              'Upload Medical License',
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
                                            GestureDetector(
                                              onTap: () async {
                                                await profile
                                                    .uploadFile(context);
                                                setState(() {
                                                  selectedNumber = "1";
                                                });
                                                if (profile.pickedDocFilePath1
                                                    .isNotEmpty) {
                                                  if (!isGreaterThan5MB(
                                                      profile.fileSize1)) {
                                                    _accountCubit.uploadDocs(
                                                        docs: File(profile
                                                            .pickedDocFilePath1));
                                                  } else {
                                                    ToastService().showToast(
                                                        context,
                                                        leadingIcon:
                                                            const ImageView.svg(
                                                          AppImages.error,
                                                          height: 25,
                                                        ),
                                                        title: AppStrings
                                                            .errorTitle,
                                                        subtitle:
                                                            'File Size should not be more than 5 MB');
                                                  }
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0xFFF0F0F0),
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
                                                child: Align(
                                                  child: ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    leading: Container(
                                                      height: 32,
                                                      width: 32,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 13),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .grey.shade100),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: ImageView.svg(
                                                            AppImages.upload),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      'Click to Upload',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF131316),
                                                      ),
                                                    ),
                                                    trailing: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 13),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade300,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Color(
                                                                0xFFF0F0F0),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 0,
                                                          ),
                                                          BoxShadow(
                                                            color: Color(
                                                                0x409F9E9E),
                                                            offset:
                                                                Offset(0, 1),
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Text(
                                                        'Upload Doc',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          height: 1.4,
                                                          color: const Color(
                                                              0xFF131316),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                          if (profile.pickedDocFilePath2
                                              .isNotEmpty) ...[
                                            Text(
                                              'Upload other relevant document (Optional)',
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
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xFFFFFFFF),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xFFF0F0F0),
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
                                              child: Align(
                                                child: ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.all(0),
                                                  leading: Container(
                                                    height: 32,
                                                    width: 32,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 13),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors
                                                            .grey.shade100),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: ImageView.svg(
                                                          AppImages.file),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    profile.pickedDocFileName2,
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
                                                  trailing: (state
                                                          is UploadDocsLoading)
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: SizedBox(
                                                              height: 20,
                                                              width: 5,
                                                              child:
                                                                  CircularProgressIndicator
                                                                      .adaptive(
                                                                backgroundColor:
                                                                    Colors.grey,
                                                              )),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () {
                                                            profile
                                                                .removeAllPaths2();
                                                          },
                                                          child: Container(
                                                              // margin: const EdgeInsets.only(right: 13),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                              child: const ImageView
                                                                  .svg(AppImages
                                                                      .trash)),
                                                        ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ] else ...[
                                            Text(
                                              'Upload other relevant document (Optional)',
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
                                            GestureDetector(
                                              onTap: () async {
                                                await profile
                                                    .uploadFile1(context);
                                                setState(() {
                                                  selectedNumber = "2";
                                                });
                                                if (profile.pickedDocFilePath2
                                                    .isNotEmpty) {
                                                  if (!isGreaterThan5MB(
                                                      profile.fileSize2)) {
                                                    _accountCubit.uploadDocs(
                                                        docs: File(profile
                                                            .pickedDocFilePath2));
                                                  } else {
                                                    ToastService().showToast(
                                                        context,
                                                        leadingIcon:
                                                            const ImageView.svg(
                                                          AppImages.error,
                                                          height: 25,
                                                        ),
                                                        title: AppStrings
                                                            .errorTitle,
                                                        subtitle:
                                                            'File Size should not be more than 5 MB');
                                                  }
                                                }
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0xFFF0F0F0),
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
                                                child: Align(
                                                  child: ListTile(
                                                    contentPadding:
                                                        const EdgeInsets.all(0),
                                                    leading: Container(
                                                      height: 32,
                                                      width: 32,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 13),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .grey.shade100),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: ImageView.svg(
                                                            AppImages.upload),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      'Click to Upload',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF131316),
                                                      ),
                                                    ),
                                                    trailing: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 13),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade300,
                                                            width: 0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Color(
                                                                0xFFF0F0F0),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 0,
                                                          ),
                                                          BoxShadow(
                                                            color: Color(
                                                                0x409F9E9E),
                                                            offset:
                                                                Offset(0, 1),
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Text(
                                                        'Upload Doc',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                          height: 1.4,
                                                          color: const Color(
                                                              0xFF131316),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                          Text(
                                            'Years of Experience',
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
                                            controller:
                                                profile.yearsOfExpController,
                                            borderColor: Colors.grey.shade200,
                                            borderWidth: 0.5,
                                            hintText: '',
                                            keyboardType: TextInputType.number,
                                            // validator: (value) {
                                            //   return Validator.validate(
                                            //       value, 'Years of Experience');
                                            // },
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updateYear(value);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Clinic / Hospital Affiliation',
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
                                            controller: profile
                                                .hospitalAffliateController,
                                            borderColor: Colors.grey.shade200,
                                            borderWidth: 0.5,
                                            hintText: '',
                                            // validator: (value) {
                                            //   return Validator.validate(value,
                                            //       'Clinic/ Hospital Affiliation');
                                            // },
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updateHospital(value);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Phone Number',
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
                                            controller: profile.phoneController,
                                            borderColor: Colors.grey.shade200,
                                            keyboardType: TextInputType.number,
                                            borderWidth: 0.5,
                                            maxLength: 11,
                                            // validator: (value) {
                                            //   return Validator.validate(
                                            //       value, 'Phone Number');
                                            // },
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updatePhone(value);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            'Location (Optional)',
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
                                            controller:
                                                profile.locationController,
                                            borderColor: Colors.grey.shade200,
                                            borderWidth: 0.5,
                                            suffixIcon: const Padding(
                                              padding: EdgeInsets.all(19),
                                              child: ImageView.svg(
                                                AppImages.dropDown,
                                                scale: 0.9,
                                              ),
                                            ),
                                            hintText: 'Ikeja, Lagos, Nigeria',
                                            prefixIcon: (isLoading)
                                                ? const Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: SizedBox(
                                                        height: 20,
                                                        width: 5,
                                                        child:
                                                            CircularProgressIndicator
                                                                .adaptive(
                                                          backgroundColor:
                                                              Colors.grey,
                                                        )),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      _setUserLocation();
                                                    },
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(7.0),
                                                      child: ImageView.svg(
                                                        AppImages.location,
                                                      ),
                                                    ),
                                                  ),
                                            onTap: _showPlacePickerBottomSheet,
                                            onChanged: (value) {
                                              Provider.of<UserViewModel>(
                                                      context,
                                                      listen: false)
                                                  .updateLocation(value);
                                            },
                                          ),
                                         
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       horizontal: 12.0),
                                //   child: Row(
                                //     children: [
                                //       CustomCheckbox(
                                //         isChecked: isAgreed,
                                //         onChanged: (value) {
                                //           isAgreed = value;
                                //         },
                                //       ),
                                //       const SizedBox(
                                //         width: 10,
                                //       ),
                                //       Expanded(
                                //         child: RichText(
                                //           text: TextSpan(
                                //             text: 'I agree to HealthBubba’s ',
                                //             style: GoogleFonts.getFont(
                                //               'Inter',
                                //               fontWeight: FontWeight.w400,
                                //               fontSize: 14,
                                //               height: 1.4,
                                //               color: const Color(0xFF131316),
                                //             ),
                                //             children: [
                                //               TextSpan(
                                //                 recognizer:
                                //                     TapGestureRecognizer()
                                //                       ..onTap = () {
                                //                         _launchUrl(
                                //                             'https://healthbubba.com/terms');
                                //                       },
                                //                 text: 'Terms and Conditions',
                                //                 style: GoogleFonts.getFont(
                                //                   'Inter',
                                //                   fontWeight: FontWeight.w500,
                                //                   fontSize: 14,
                                //                   height: 1.3,
                                //                   color:
                                //                       const Color(0xFF40B93C),
                                //                 ),
                                //               ),
                                //               const TextSpan(
                                //                 text: ' and ',
                                //               ),
                                //               TextSpan(
                                //                 recognizer:
                                //                     TapGestureRecognizer()
                                //                       ..onTap = () {
                                //                         _launchUrl(
                                //                             'https://healthbubba.com/privacy-policy');
                                //                       },
                                //                 text: 'Privacy Policy',
                                //                 style: GoogleFonts.getFont(
                                //                   'Inter',
                                //                   fontWeight: FontWeight.w500,
                                //                   fontSize: 14,
                                //                   height: 1.3,
                                //                   color:
                                //                       const Color(0xFF40B93C),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                         
                         
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar:  Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom:  20),
              child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: ButtonView(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                onPressed: () {
                                  if (profile.titleController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'Title field required');
                                  } else if (profile.firstnameController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'First name field required');
                                  } else if (profile.lastnameController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'Last name field required');
                                  }else if (_qualificationController
                                      .text.isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle:
                                            'Qualifications field required');
                                  } else if (profile.licenceNumberController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle:
                                            'Licence Number field required');
                                  }else if (profile.licenceDoc.isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'Add licence document please');
                                  }  else if (profile.yearsOfExpController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle:
                                            'Years of experience field required');
                                  } else if (profile
                                      .hospitalAffliateController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle:
                                            'Affliated Hospital field required');
                                  } else if (profile.phoneController.text
                                      .trim()
                                      .isEmpty) {
                                    ToastService().showToast(context,
                                        leadingIcon: const ImageView.svg(
                                            height: 25, AppImages.error),
                                        title: AppStrings.errorTitle,
                                        subtitle: 'Phone number field required');
                                  }  else {
                                    if (doctorsState == '1') {
                                      Modals.showDialogModal(
                                        context,
                                        page: destructiveActions(
                                            context: context,
                                            message:
                                                'Warning: Changes made here will trigger a re-verification process to confirm your identity.',
                                            primaryText: 'I Admit',
                                            secondaryText: 'Exit Please',
                                            primaryAction: () async {
                                              Navigator.pop(context);
                                              _accountCubit.updateUserData(
                                                  title: profile.titleController.text
                                                      .trim(),
                                                  firstname: profile
                                                      .firstnameController.text
                                                      .trim(),
                                                  lastname:
                                                      profile
                                                          .lastnameController.text
                                                          .trim(),
                                                  licenceNumber: profile
                                                      .licenceNumberController.text
                                                      .trim(),
                                                  experience:
                                                      int.tryParse(
                                                              profile
                                                                  .yearsOfExpController
                                                                  .text
                                                                  .trim()) ??
                                                          0,
                                                  hospitalAffliated: profile
                                                      .hospitalAffliateController
                                                      .text
                                                      .trim(),
                                                  phone: profile.phoneController.text
                                                      .trim(),
                                                  doctorLicenceDoc: profile.licenceDoc,
                                                  otherDocs: profile.otherDoc);
                                            },
                                            primaryBgColor:
                                                const Color(0xFFF70000),
                                            secondaryBgColor:
                                                AppColors.lightPrimary,
                                            secondaryAction: () {
                                              Navigator.pop(context);
                                            }),
                                      );
                                    } else {
                                      _accountCubit.updateUserData(
                                          title: profile.titleController.text
                                              .trim(),
                                          firstname: profile
                                              .firstnameController.text
                                              .trim(),
                                          lastname: profile
                                              .lastnameController.text
                                              .trim(),
                                          licenceNumber: profile
                                              .licenceNumberController.text
                                              .trim(),
                                          experience:
                                              int.tryParse(
                                                      profile.yearsOfExpController
                                                          .text
                                                          .trim()) ??
                                                  0,
                                          hospitalAffliated: profile
                                              .hospitalAffliateController.text
                                              .trim(),
                                          phone:
                                              profile.phoneController.text.trim(),
                                          doctorLicenceDoc: profile.licenceDoc,
                                          otherDocs: profile.otherDoc);
                                    }
                                  }
                                },
                                borderRadius: 100,
                                color: AppColors.lightSecondary,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Next - ',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.6,
                                      color: const Color(0xFFFFFFFF),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Work information',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          height: 1.3,
                                          color: const Color(0xCCFFFFFF),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
            ),
          ),
          if (state is GetSpecialtiesLoading ||
              state is SelectQualificationsLoading ||
              state is UpdateUserLoading) ...[
            Container(
              color: AppColors.indicatorBgColor,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.indicatorColor,
                ),
              ),
            ),
          ]
        ],
      );
    });
  }

  bool isGreaterThan5MB(String fileSize) {
    // Parse the input string (e.g., "0.02 MB").
    final parts = fileSize.split(' '); // Splits into ["0.02", "MB"]

    if (parts.length != 2) return false; // Ensure the format is correct.

    final sizeValue = double.tryParse(parts[0]);
    final sizeUnit = parts[1].toUpperCase(); // Normalize the unit (e.g., "MB").

    if (sizeValue == null) return false; // Invalid number.

    // Convert the size to bytes.
    double sizeInBytes;
    switch (sizeUnit) {
      case 'KB':
        sizeInBytes = sizeValue * 1024;
        break;
      case 'MB':
        sizeInBytes = sizeValue * 1024 * 1024;
        break;
      case 'GB':
        sizeInBytes = sizeValue * 1024 * 1024 * 1024;
        break;
      default:
        return false; // Unknown unit.
    }

   
    const fiveMBInBytes = 5 * 1024 * 1024;

    // Compare the sizes.
    return sizeInBytes > fiveMBInBytes;
  }

  titleModalContent(BuildContext context) {
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
        itemCount: titles.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade200,
          height: 0,
        ),
        itemBuilder: (context, index) {
          String title = titles[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                Provider.of<UserViewModel>(context, listen: false)
                    .updateTitle(title);
              });

              Navigator.pop(context);
            },
            child: Container(
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
    );
  }

  qualificationModalContent(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
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
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: qualifications.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade200,
                height: 0,
              ),
              itemBuilder: (context, index) {
                QualificationData qualification = qualifications[index];
                bool isChecked = _selectedItems.any((item) =>
                    item.qualificationId == qualification.qualificationId);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13.0, horizontal: 23),
                  child: Row(
                    children: [
                      CustomCheckbox(
                        bgColor: const Color(0xFF6667FA),
                        isChecked: isChecked,
                        onChanged: (checked) {
                          _onCheckboxChanged(checked, qualification);
            
                          bool isLastSelected = _selectedItems.any((item) =>
                              item.qualificationId ==
                              qualifications.last.qualificationId);
                          _qualificationController.text =
                              qualification.qualificationName ?? '';
            
                          // if (isLastSelected) {
                          //   // isOtherSelected = false;
                          //   Navigator.pop(context);
            
                          //   _qualificationController.clear();
                          //   setState(() {});
                          // } else {
                          //   isOtherSelected = true;
                          // }
                        },
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Text(
                          qualification.qualificationName ?? '',
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
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 0,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: .0),
                      child: Text(
                        'Close',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _saveSelectedQualificationsIds();
                  },
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: .0),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
