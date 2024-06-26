import 'package:flutter/material.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/medication/medication_page.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/patient_page.dart';
import 'package:provider/provider.dart';

import '../../model/view_model/user_view_model.dart';
import 'dashboard_pages.dart/appointment_tabs.dart';
import 'dashboard_pages.dart/home_page.dart';
import 'widget/custom_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

   
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserViewModel>(context, listen: true);

    return   Scaffold(


      body: _buildPage(user.currentPage),
      bottomNavigationBar: CustomBottomBar(

        onChanged: (index) {
          setState(() {
            user.updateIndex(index);
          });
        },
       selectedIndex: user.currentPage
       ),
    );
  }

    Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return   const HomePage();
      case 1:
        return   const PatientPage();
      case 2:
        return   const AppointmentTabView();
      case 3:
        return   const MedicationPage();
      default:
        return DefaultWidge();
    }
  }
}