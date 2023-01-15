import 'package:client/app/views/onboarding/onboarding.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPagesView extends StatefulWidget {
  const OnboardingPagesView({super.key});

  @override
  State<OnboardingPagesView> createState() => _OnboardingPagesViewState();
}

class _OnboardingPagesViewState extends State<OnboardingPagesView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingViewModel>(context);

    return PageView(
      controller: provider.pageController,
      onPageChanged: onChangedFunction,
      children: <Widget>[
        imageContainer("assets/images/onboarding/background_1.png"),
        imageContainer("assets/images/onboarding/background_2.png"),
        imageContainer("assets/images/onboarding/background_3.png"),
        imageContainer("assets/images/onboarding/background_4.png"),
      ],
    );
  }

  Container imageContainer(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  onChangedFunction(int index) {
    Provider.of<OnboardingViewModel>(context, listen: false).currentIndex =
        index;
  }
}
