import 'package:flutter/material.dart';
import 'package:healthbubba/widgets/image_view.dart'; 
import 'package:provider/provider.dart';

import '../../../model/view_model/user_view_model.dart';
import '../../../res/app_images.dart';


class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged, this.selectedIndex = 0});

  Function(int)? onChanged;
  int selectedIndex;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: AppImages.homeOutline,
      activeIcon: AppImages.home,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: AppImages.patientOutline,
      activeIcon: AppImages.patient,
      title: "Patient",
      type: BottomBarEnum.Patient,
    ),
    BottomMenuModel(
      icon: AppImages.appointmentOutline,
      activeIcon: AppImages.appointment,
      title: "Appointment",
      type: BottomBarEnum.Appointment,
    ),
    BottomMenuModel(
      icon: AppImages.medicationOutline,
      activeIcon: AppImages.medication,
      title: "Medication",
      type: BottomBarEnum.Medication,
    )
  ];
 

  @override
  void initState() {
     
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context, listen: true);
    
    return Container(
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
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 6,),
                ImageView.svg(
                    bottomMenuList[0].icon,
                  height: 20,
                  width: 18,
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 10),
                  child: Text(
                    bottomMenuList[0].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageView.svg(
                    bottomMenuList[0].activeIcon,
                  height: 20,
                  width: 18,
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[0].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF40B93C),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageView.svg(
                    bottomMenuList[1].icon,
                  height: 20,
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[1].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageView.svg(
                    bottomMenuList[1].activeIcon,
                  height: 20,
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[1].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF40B93C),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageView.svg(
                    bottomMenuList[2].icon,
                  height: 20,
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[2].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageView.svg(
                    bottomMenuList[2].activeIcon,
                  height: 20,
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[2].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF40B93C),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 ImageView.svg(
                    bottomMenuList[3].icon,
                  height: 20,
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[3].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 ImageView.svg(
                    bottomMenuList[3].activeIcon,
                  height: 20,
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    bottomMenuList[3].title ?? "",
                    style: const TextStyle(
                      color: Color(0xFF40B93C),
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
        onTap: (index) {
                      user.updateIndex(index);
      
            widget.onChanged?.call(index);
          setState(() {});
      
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Patient,
  Appointment,
  Medication,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
