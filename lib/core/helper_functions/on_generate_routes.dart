import 'package:flutter/material.dart';
import 'package:fruits_hub/feature/auth/presentation/views/login_view.dart';

import '../../feature/onboarding/presentation/views/on_boerding_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
