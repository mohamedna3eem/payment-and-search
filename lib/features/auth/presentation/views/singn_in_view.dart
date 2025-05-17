import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/widgets/custom_app_bar.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/sing_in_view_body.dart';
import 'package:pharma_now/features/home/tabs/profile_tab/profile_tab.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.sp),
        child: PharmaAppBar(title: 'Sign in',
         ),
      ),
      body: SiginViewBody(),
    );
  }
}
