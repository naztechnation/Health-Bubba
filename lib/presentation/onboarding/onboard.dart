import 'package:flutter/material.dart';
import 'package:healthbubba/presentation/onboarding/onboarding_one.dart';
import 'package:healthbubba/presentation/onboarding/onboarding_three.dart';
import 'package:healthbubba/presentation/onboarding/onboarding_two.dart';
import 'package:provider/provider.dart';

import '../../model/view_model/onboard_view_model.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen>{
  @override
  Widget build(BuildContext context) {

     final onboard =
        Provider.of<OnboardViewModel>(context, listen: false);
    return Scaffold(
      body: PageView(
        controller: onboard.pageController,
        children: [
          OnboardingOne(),
          OnboardingTwo(),
          OnboardingThree(),
        ],
      ),
    );
  }
}