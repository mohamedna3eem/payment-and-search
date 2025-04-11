import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/features/favorites/presentation/views/widgets/favoirtes_view_body.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: ProfileViewBody(),
    );
  }
}
