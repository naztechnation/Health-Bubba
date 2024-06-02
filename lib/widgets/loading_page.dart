import 'package:flutter/material.dart';


import '../../res/app_constants.dart';
import '../res/app_images.dart';
import 'image_view.dart';

class LoadingPage extends StatelessWidget {
  final int length;
  const LoadingPage({this.length = 5, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenSize(context).height,
        width: screenSize(context).width,
        decoration: BoxDecoration(
            color:Colors.white,),
        child: Align(child: ImageView.asset(AppImages.appLogo, height: 50,)),
      ),
    );
    
    }}