import 'package:flutter/material.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../../handlers/secure_handler.dart';
import '../../res/app_images.dart';
import 'dashboard_pages.dart/appointment_tabs.dart';
import 'dashboard_pages.dart/home_page.dart';
import 'dashboard_pages.dart/medication/medication_page.dart';
import 'dashboard_pages.dart/patient/patient_page.dart';

 
 

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() =>
      _DashboardBottomNavigationState();
}

class _DashboardBottomNavigationState extends State<Dashboard> {
  int index = 0;

  List<BottomNavigationBarItem> get tabs => [
        const BottomNavigationBarItem(
          icon: NavItemWrapper(
              icon: ImageView.svg(AppImages.homeOutline)),
          activeIcon: NavItemWrapper(
              icon: ImageView.svg(AppImages.home)),
          label: 'Home',
          tooltip: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: NavItemWrapper(
              icon: ImageView.svg(AppImages.patientOutline)),
          activeIcon: NavItemWrapper(
              icon: ImageView.svg(AppImages.patient)),
          label: 'Patient',
          tooltip: 'Patient',
        ),
        const BottomNavigationBarItem(
          icon: NavItemWrapper(
              icon: ImageView.svg(AppImages.appointmentOutline)),
          activeIcon: NavItemWrapper(
              icon: ImageView.svg(AppImages.appointment)),
          label: 'Appointment',
          tooltip: 'Appointment',
        ),
        const BottomNavigationBarItem(
          icon: NavItemWrapper(
              icon: ImageView.svg(AppImages.medicationOutline)),
          activeIcon: NavItemWrapper(
              icon: ImageView.svg(AppImages.medication)),
          label: 'Medication',
          tooltip: 'Medication',
        )
      ];

  final pages = [
    const HomePage(),
    const PatientPage(),
      AppointmentTabView(isDashboard: true,),
    const MedicationPage()
  ];

  @override
  Widget build(BuildContext context) {
                    StorageHandler.saveIsLoggedIn('true');
    
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => selectedTab(index),
        currentIndex: index,
        backgroundColor: AppColors.lightPrimary,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
                      color: Color(0xFF40B93C),
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),
        unselectedLabelStyle:const TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
        selectedItemColor: const Color(0xFF40B93C),
        unselectedItemColor: const Color(0xFF6B7280),
        items: tabs,
      ),
    );
  }

  selectedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}

class NavItemWrapper extends StatelessWidget {
  const NavItemWrapper({
    super.key,
    required this.icon,
  });

  final Widget icon;

   

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: icon,
    );
  }
}
