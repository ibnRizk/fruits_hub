import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/feature/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
