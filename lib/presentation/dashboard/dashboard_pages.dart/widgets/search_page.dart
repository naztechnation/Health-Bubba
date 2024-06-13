import 'package:flutter/material.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/patient_details.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';
import '../widgets/patient_card.dart';
import 'appointment_patient_card.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
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
                      controller: TextEditingController(),
                      prefixIcon:SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 0,),
                      const ImageView.svg(AppImages.searchIcon, height: 19,),
                      Container(
                    height: 20,
                    width: 1,
                     
                    decoration: BoxDecoration(
                        color: const Color(0xFF000000),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  const SizedBox(width: 0,),
                    ],
                  ),
                ),
                      hintText: 'Search Patient',
                    ),
                  ),
                ),
              ],
            ),
           
                      AppointmentPatientCard(isScheduled: true, isReBook: false,actionText: 'Reschedule', onCancel: (){}, onAccept: (){},),
          ],
        ),
      ),
    );
  }
}
