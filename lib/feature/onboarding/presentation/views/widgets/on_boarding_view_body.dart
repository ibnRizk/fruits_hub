import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/widgets/custom_button.dart';
import 'package:fruits_hub/feature/onboarding/presentation/views/widgets/on_boarding_page_view.dart';

import '../../../../../constants.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() =>
      _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState
    extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            color: AppColors.primaryColor.withOpacity(.5),
            activeColor: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 29),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizintalPadding,
          ),
          child: CustomButton(
            onPressed: () {},
            text: 'ابدأ الان',
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
