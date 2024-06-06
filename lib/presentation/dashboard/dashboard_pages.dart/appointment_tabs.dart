import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../res/app_images.dart';
import '../../../widgets/image_view.dart';
import 'widgets/cancelled.dart';
import 'widgets/completed_appointnment.dart';
import 'widgets/search_page.dart';
import 'widgets/upcoming_appointments.dart';

class AppointmentTabView extends StatefulWidget {
  @override
  _AppointmentTabViewState createState() => _AppointmentTabViewState();
}

class _AppointmentTabViewState extends State<AppointmentTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          ' ',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: const Color(0xFF0A0D14),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Appointments',
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
              AppNavigator.pushAndStackPage(context, page: SearchPage());
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF1F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(
                color: Colors.transparent,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              tabs: [
                CustomTab(
                  text: 'Upcoming',
                  isSelected: _tabController.index == 0,
                ),
                
                CustomTab(
                  text: 'Completed',
                  isSelected: _tabController.index == 1,
                ),
                CustomTab(
                  text: 'Cancelled',
                  isSelected: _tabController.index == 2,
                ),
              ].map((tab) => Expanded(child: tab)).toList(),
              onTap: (index) {
                setState(() {});
              },
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          UpcomingPage(),
          CompletedPage(),
          CancelledPage(),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  CustomTab({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: const Color(0xFFFFFFFF),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                ),
              ],
            )
          : null,
       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

 

 

