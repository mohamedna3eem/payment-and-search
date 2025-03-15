import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/sing_in_view_body.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/singn_up_view_body.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class SingnUpView extends StatelessWidget {
  const SingnUpView({super.key});
  static const routeName = 'singUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.sp),
        child: PharmaAppBar(title: 'Sign Up'),
      ),
      body: SingnUpBody(),
    );
  }
}
