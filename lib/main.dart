import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/helper_functions/on_generate_route.dart';
import 'package:pharma_now/core/services/get_it_service.dart';
import 'package:pharma_now/core/services/shard_preferences_singlton.dart';
import 'package:pharma_now/features/splash/presentation/views/splash_view.dart';
import 'package:pharma_now/firebase_options.dart';

import 'core/services/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  Bloc.observer = CustomBlocObserver();

  await prefs.init();
  runApp(PharmaNow());
}

class PharmaNow extends StatelessWidget {
  const PharmaNow({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: onGenerateRoute,
              initialRoute: SplashView.routeName,
            ));
  }
}
