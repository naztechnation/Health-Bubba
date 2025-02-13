import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:url_launcher/url_launcher.dart';

import '../../res/app_images.dart';
import '../../res/app_strings.dart'; 
import '../../widgets/image_view.dart';
import 'res/app_colors.dart';
import 'widgets/button_view.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Update available',
          style: TextStyle(
            fontWeight: FontWeight.w400,

            // color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                  width: 150,
                  child: (Platform.isAndroid)
                      ? const ImageView.asset(AppImages.playStoreLogo)
                      : const ImageView.asset(
                          AppImages.appleStoreLogo,
                        )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Text(
              'App Update Info!!!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Text(
              AppStrings.updateInfo,
              style: TextStyle(
                color:    Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
            child: Divider(),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                const SizedBox(
                  width: 8,
                ),
                 ButtonView(onPressed: () async{
                       
                     if ((Platform.isAndroid)) {
                        if (await canLaunch(
                            'https://play.google.com/store/apps/details?id=com.healthbubba.doctorsapp')) {
                          await launch(
                              'https://play.google.com/store/apps/details?id=com.healthbubba.doctorsapp');
                        } else {
                          throw 'Could not launch url';
                        }
                      } else {
                        if (await canLaunch(
                            'https://apps.apple.com/us/app/healthbubba-partner/id6642711816')) {
                          await launch(
                              'https://apps.apple.com/us/app/healthbubba-partner/id6642711816');
                        } else {
                          throw 'Could not launch url';
                        }
                      }
                     }, 
                     borderRadius: 100,
                     color: AppColors.lightSecondary,
                     child: const Text('Update', 
                     style: TextStyle(color: AppColors.lightPrimary, fontSize: 14, fontWeight: FontWeight.w500),)),
                   
                      const SizedBox(height: 14,),
                 
                  GestureDetector(
                      onTap: () {
                      SystemNavigator.pop();
                      },
                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 38,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100, ),
                                         color:  AppColors.lightPrimary,
                                         border: Border.all(color: Colors.grey, width: 0.5)
                                         ),
                      
                      child: const Center(
                        child: Text('No, Close', 
                                           style: TextStyle(color: AppColors.lightSecondary, fontSize: 14, fontWeight: FontWeight.w500),),
                      )
                                       ),
                    ),
                 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
