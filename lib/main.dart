import 'package:flutter/material.dart';
import 'package:pharma_now/core/helper_functions/on_generate_route.dart';
import 'package:pharma_now/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(PharmaNow());
}

class PharmaNow extends StatelessWidget {
  const PharmaNow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
