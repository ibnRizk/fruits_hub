import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/feature/auth/presentation/views/signin_view.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../onboarding/presentation/views/on_boerding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() =>
      _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNaviagtion() {
    bool isOnBoardingViewSeen = Prefs.getBool(
      kisOnBoardingViewSeen,
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (isOnBoardingViewSeen) {
          Navigator.pushReplacementNamed(
            context,
            SigninView.routeName,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            OnBoardingView.routeName,
          );
        }
      }
    });
  }
}
