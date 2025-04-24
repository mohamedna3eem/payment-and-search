import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../auth/presentation/views/widget/sing_in_view_body.dart';

// class ProfileTab extends StatelessWidget{
//   static const String routeName="profile_name";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("asda"),),
//       backgroundColor: Colors.red,
//       body: Column(children: [Image(image: AssetImage("assets/images/s (2).png"))],),);
//   }
//
// }
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
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
      body: Column(children: [
        Icon(Icons.abc_sharp)
      ],),
    );
  }
}
