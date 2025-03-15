import 'package:flutter/material.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_in_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_up_view.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/forget_password_view_body.dart';
import 'package:pharma_now/features/splash/presentation/views/splash_view.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/verification_view_signup.dart';
import '../../features/on_boarding/presentation/views/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());

    case SingnUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SingnUpView());

    case VerificationView.routeName:
      return MaterialPageRoute(builder: (context) => const VerificationView());

    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
