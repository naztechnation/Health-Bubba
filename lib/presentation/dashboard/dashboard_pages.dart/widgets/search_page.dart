import 'package:flutter/material.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';

import '../../../../model/patients/appointment_lists.dart';
import '../../../../res/app_images.dart';
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../widgets/image_view.dart';
import 'appointment_patient_card.dart';
import 'cancel_appointment.dart';
import 'reschedule.dart';

class SearchPage extends StatefulWidget {
  final List<AppointmentListsData> appointment;
  final bool isSchedule; 

  const SearchPage({super.key, required this.appointment, required this.isSchedule});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  List<AppointmentListsData> filteredAppointmentLists = [];

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    _filterAppointment();
    _searchController.addListener(_filterAppointment);
  }

  void _filterAppointment() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      filteredAppointmentLists = widget.appointment.where((appointment) {
        return appointment.patientFirstName
            .toString()
            .toLowerCase()
            .contains(query);
      }).toList();
    });

    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 3, 0),
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                      child: ImageView.svg(AppImages.backBtn),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    child: TextEditView(
                      controller: _searchController,
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
                      hintText: 'Search Patient',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredAppointmentLists.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return AppointmentPatientCard(
                      isScheduled: false,
                      isReBook: false,
                      actionText: 'Reschedule',
                      onCancel: () {
                        AppNavigator.pushAndStackPage(context,
                            page: CancelAppointment(appointmentId: filteredAppointmentLists[index].appointmentId.toString(),));
                      },
                      onAccept: () {
                        AppNavigator.pushAndStackPage(context,
                            page: ReschedulePage(
                              isSchedule: widget.isSchedule,
                              isDue: false,
                              appointment: filteredAppointmentLists[index],
                            ));
                      },
                      upcomingAppointment: filteredAppointmentLists[index],
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
