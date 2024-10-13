import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:provider/provider.dart';

import '../../handlers/secure_handler.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../res/app_images.dart';
import '../../res/app_strings.dart';
import '../../update_page.dart';
import 'dashboard_pages.dart/appointment_tabs.dart';
import 'dashboard_pages.dart/home_page.dart';
import 'dashboard_pages.dart/medication/medication_page.dart';
import 'dashboard_pages.dart/patient/patient_page.dart';
import 'dashboard_pages.dart/unverified_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardBottomNavigationState();
}

class _DashboardBottomNavigationState extends State<Dashboard> {
  int index = 0;

  String doctorState = "0";

  

  List<BottomNavigationBarItem> get tabs => [
        const BottomNavigationBarItem(
          icon: NavItemWrapper(icon: ImageView.svg(AppImages.homeOutline)),
          activeIcon: NavItemWrapper(icon: ImageView.svg(AppImages.home)),
          label: 'Home',
          tooltip: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: NavItemWrapper(icon: ImageView.svg(AppImages.patientOutline)),
          activeIcon: NavItemWrapper(icon: ImageView.svg(AppImages.patient)),
          label: 'Patient',
          tooltip: 'Patient',
        ),
        const BottomNavigationBarItem(
          icon:
              NavItemWrapper(icon: ImageView.svg(AppImages.appointmentOutline)),
          activeIcon:
              NavItemWrapper(icon: ImageView.svg(AppImages.appointment)),
          label: 'Appointment',
          tooltip: 'Appointment',
        ),
        const BottomNavigationBarItem(
          icon:
              NavItemWrapper(icon: ImageView.svg(AppImages.medicationOutline)),
          activeIcon: NavItemWrapper(icon: ImageView.svg(AppImages.medication)),
          label: 'Medication',
          tooltip: 'Medication',
        )
      ];

  var pages = [];

  void _checkVersionAndNavigate() {
    if (Platform.isAndroid) {
      FirebaseFirestore.instance
          .collection('app_version_android')
          .doc('version_number_android')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.exists) {
          final versionNumber =
              snapshot.data()?['current_version_android'] ?? '';
          if (versionNumber as int > AppStrings.appVersionAndroid) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UpdateScreen()),
            );
          } else {}
        }
      });
    } else if (Platform.isIOS) {
      FirebaseFirestore.instance
          .collection('app_version_ios')
          .doc('version_number_ios')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.exists) {
          final versionNumber = snapshot.data()?['current_version_ios'] ?? '';
          if (versionNumber as int > AppStrings.appVersionIos) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UpdateScreen()),
            );
          } else {}
        }
      });
    }
  }

  @override
  void initState() {
    _checkVersionAndNavigate();
     
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StorageHandler.saveIsLoggedIn('true');


    final doctorsState =
        Provider.of<OnboardViewModel>(context, listen: true).doctorsState;

    List<Widget> pages = [
      const HomePage(),
      doctorsState == '0' ? const PendingVerification() : const PatientPage(isDashboard: true),
      doctorsState == '0' ? const PendingVerification() : AppointmentTabView(isDashboard: true),
      doctorsState == '0' ? const PendingVerification() : const MedicationPage(true),
    ];

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
            fontSize: 12),
        unselectedLabelStyle: const TextStyle(
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
