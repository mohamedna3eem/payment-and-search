import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/widgets/custom_app_bar.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.sp),
        child: PharmaAppBar(title: 'Sign in'),
      ),
      body: LoginViewBody(),
    );
  }
}
