import 'package:flutter/material.dart';
import 'package:pharma_now/features/auth/presentation/views/login_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_up.dart';
import 'package:pharma_now/features/splash/presentation/views/splash_view.dart';

import '../../features/on_boarding/presentation/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SingnUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SingnUpView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
