import 'package:flutter/material.dart';

// import '../../feature/on_boarding/presentation/views/on_boarding_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    // case OnBoardingView.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const OnBoardingView(),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
