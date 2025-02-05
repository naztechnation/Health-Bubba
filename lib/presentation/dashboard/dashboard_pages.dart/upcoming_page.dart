 
import 'package:flutter/material.dart';
  
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart'; 
 
import '../../../res/app_images.dart';
import '../../../utils/navigator/page_navigator.dart'; 
import '../../../widgets/image_view.dart'; 
import 'widgets/search_page.dart';
import 'widgets/upcoming_appointments.dart';
 
 

class UpcomingAppointmentScreen extends StatelessWidget {
  final List<AppointmentListsData> upcomingAppointment;
  const UpcomingAppointmentScreen({super.key, required this.upcomingAppointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Upcoming Appointments',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: const Color(0xFF0A0D14),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AppNavigator.pushAndStackPage(context,
                  page: SearchPage(
                    appointment:  upcomingAppointment,
                         isSchedule: true
                        
                  ));
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 4.5, 20, 4.5),
              width: 22,
              height: 22,
              child: const SizedBox(
                width: 18,
                height: 18,
                child: ImageView.svg(
                  AppImages.searchIcon,
                  scale: 4,
                ),
              ),
            ),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child:  UpcomingPage(
                upcomingAppointment: upcomingAppointment,
              )
      ));
      } 
}
 
