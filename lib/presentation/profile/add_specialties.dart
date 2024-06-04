import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/view_model/onboard_view_model.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';
import '../../widgets/image_view.dart';
import 'work_profile.dart';

class SpecialtyListPage extends StatelessWidget {
  final List<String> specialties = [
    'Cardiology',
    'Dermatology',
    'Endocrinology',
    'Gastroenterology',
    'Neurology',
    'Oncology',
    'Orthopedics',
    'Pediatrics',
    'Psychiatry',
    'Radiology',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Specialties',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 21, bottom: 21),
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
        actions: [
          GestureDetector(
            onTap: () {
              AppNavigator.pushAndReplacePage(context, page: const WorkInformation());
              context.read<OnboardViewModel>().saveLanguages();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(
            color: Color(0xFF40B93C),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(color: Colors.grey.shade200, height: 0.9),
          Expanded(
            child: ListView.separated(
              itemCount: specialties.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, height: 0.9),
              itemBuilder: (context, index) {
                final specialty = specialties[index];
                return Consumer<OnboardViewModel>(
                  builder: (context, provider, child) {
                    final isSelected = provider.selectedSpecialties.contains(specialty);
                    return ListTile(
                      title: Text(specialty,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                      trailing: isSelected ? const ImageView.svg(AppImages.check) : null,
                      tileColor: isSelected ? Colors.lightGreen.withOpacity(0.12) : null,
                      onTap: () {
                        provider.toggleSpecialty(specialty);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Divider(color: Colors.grey.shade200, height: 0.9), 
        ],
      ),
    );
  }
}
